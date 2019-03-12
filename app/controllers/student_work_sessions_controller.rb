# frozen_string_literal: true

class StudentWorkSessionsController < ApplicationController
  def roll_call
    @student_work_sessions = StudentWorkSession.where(work_session_id: params[:id])
  end

  def update
    update_attendance("absent", "attended", false) if params["student_work_session"]["absent"].present?
    update_attendance("present", "attended") if params["student_work_session"]["present"].present?
    update_attendance("late") if params["student_work_session"]["late"].present?
    update_attendance("medical") if params["student_work_session"]["medical"].present?
    update_attendance("suspended") if params["student_work_session"]["suspended"].present?
    update_attendance("!late", "late", false) if params["student_work_session"]["!late"].present?
    update_attendance("!medical", "medical", false) if params["student_work_session"]["!medical"].present?
    update_attendance("!suspended", "suspended", false) if params["student_work_session"]["!suspended"].present?

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
end
