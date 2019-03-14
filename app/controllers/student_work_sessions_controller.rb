# frozen_string_literal: true

class StudentWorkSessionsController < ApplicationController
  def roll_call
    @student_work_sessions = StudentWorkSession.where(work_session_id: params[:id])
  end

  def update
    if params["student_work_session"].blank?
      redirect_to work_session_path(params[:id])
      return
    end
    update_record
    UpdateSkillStudentsJob.perform_later(params[:id])
    redirect_to work_session_path(params[:id])
  end

  private

  def update_params
    params.require(:student_work_session).permit(attended: [], late: [], medical: [], suspended: [])
  end

  def update_attendance(params_key, column = params_key, value = true)
    StudentWorkSession.where(
      id: params["student_work_session"][params_key]
    ).find_each do |sws|
      sws.update("#{column}": value)
    end
  end

  def update_record
    update_attendance("present", "attended") if params_present?("present")
    update_attendance("absent", "attended", false) if params_present?("absent")
    update_attendance("!late", "late", false) if params_present?("!late")
    update_attendance("late") if params_present?("late")
    update_attendance("!medical", "medical", false) if params_present?("!medical")
    update_attendance("medical") if params_present?("medical")
    update_attendance("!suspended", "suspended", false) if params_present?("!suspended")
    update_attendance("suspended") if params_present?("suspended")
  end

  def params_present?(params_key)
    params["student_work_session"][params_key]
  end
end
