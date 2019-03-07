# frozen_string_literal: true

class StudentWorkSessionsController < ApplicationController
  def roll_call
    @student_work_sessions = StudentWorkSession.where(work_session_id: params[:id]).has_attended
  end

  def update
    if params["student_work_session"].blank?
      # display an error if form is validated without students selection
      redirect_back fallback_location: work_sessions_path, alert: "Vous devez sélectionner au moins un élève"
      return
    end

    if params["student_work_session"]["absent"].present?
      update_attendance("absent", "attended", false)
    end

    if params["student_work_session"]["late"].present?
      update_attendance("late")
    end

    if params["student_work_session"]["medical"].present?
      update_attendance("medical")
    end

    if params["student_work_session"]["suspended"].present?
      update_attendance("suspended")
    end

    redirect_to work_session_path(params[:id])
  end

  private

  def update_params
    params.require(:student_work_session).permit(attended: [], late: [], medical: [], suspended: [])
  end

  def update_attendance(params_key, column = params_key, value = true)
    @students = StudentWorkSession.find(params["student_work_session"][params_key])
    @students.each { |student| student.update("#{column}": value) }
  end
end
