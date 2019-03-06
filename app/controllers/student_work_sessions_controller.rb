# frozen_string_literal: true

class StudentWorkSessionsController < ApplicationController
  def roll_call
    @student_work_sessions = StudentWorkSession.where(work_session_id: params[:id]).has_attended
  end

  def update
    if params["student_work_session"].present?
      # display an error if form is validated without students selection
      @student_work_sessions = StudentWorkSession.find(params["student_work_session"]["attended"] ||
                                                       params["student_work_session"]["later"] ||
                                                       params["student_work_session"]["suspended"] ||
                                                       params["student_work_session"]["medical"])
      @student_work_sessions.each do |student|
        unless student.update(update_params)
          redirect_back fallback_location: work_sessions_path, alert: @student_work_sessions.errors.full_messages.to_s
        end
      end
      redirect_back fallback_location: work_sessions_path, notice: "La mise à jour à bien été éffectué"
    else
      redirect_back fallback_location: work_sessions_path, alert: "Vous devez sélectionner au moins un élève"
    end
  end

  private

  def update_params
    params.require(:student_work_session).permit(attended: [], later: [], medical: [], suspended: [])
  end
end
