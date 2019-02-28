# frozen_string_literal: true

class StudentWorkSessionsController < ApplicationController
  def roll_call
    @student_work_sessions = StudentWorkSession.where(work_session_id: params[:id]).not_present
    @student_presents = StudentWorkSession.where(work_session_id: params[:id]).present
  end

  def update
    if params["student_work_session"].present?
      @student_work_sessions = StudentWorkSession.find(params["student_work_session"]["present"])
      @student_work_sessions.each do |student|
        unless student.update(update_params)
          redirect_back fallback_location: work_sessions_path, alert: @student_work_sessions.errors.full_messages.to_s
        end
      end
      redirect_back fallback_location: work_sessions_path, notice: "Updated"
    else
      redirect_back fallback_location: work_sessions_path, alert: "Vous devez sélectionner au moins un élève"
    end
  end

  private

  def update_params
    params.require(:student_work_session).permit(present: [])
  end
end
