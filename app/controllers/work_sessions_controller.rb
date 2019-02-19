# frozen_string_literal: true

class WorkSessionsController < ApplicationController
  before_action :set_work_session, only: %i[show update edit destroy roll_call]

  def roll_call; end

  def index
    @work_sessions = WorkSession.all
  end

  def new
    @work_session = WorkSession.new
  end

  def create
    @work_session = WorkSession.new(permitted_params)

    if @work_session.save
      flash[:notice] = "La séance a été créée"
      redirect_to(@work_session)
    else
      flash[:alert] = "La séance n'a PAS été créée"
      render action: "new"
    end
  end

  def show; end

  def edit; end

  def update
    if archived_session_rescue && @work_session.update(permitted_params)
      flash[:notice] = "La séance a été mise à jour"
      redirect_to(@work_session)
    else
      redirect_back fallback_location: work_sessions_path, alert: "Vous ne pouvez pas modifié une séance archivée"
    end
  end

  def destroy
    @work_session.destroy
    redirect_back fallback_location: work_sessions_path, alert: "La séance a été supprimée"
  end

  private

  def permitted_params
    params.require(:work_session).permit(:date, :daily_schedule)
  end

  def set_work_session
    @work_session = WorkSession.find(params[:id])
  end

  def archived_session_rescue
    Time.zone.now < @work_session.date
  end
end
