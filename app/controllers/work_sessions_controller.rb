# frozen_string_literal: true

class WorkSessionsController < ApplicationController
  before_action :set_work_session, only: %i[show update edit destroy roll_call]

  def roll_call; end

  def index; @work_sessions = WorkSession.all end

  def new; @work_session = WorkSession.new end

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
    if @work_session.update(permitted_params)
      flash[:notice] = "La séance a été mise à jour"
      redirect_to(@work_session)
    else
      flash[:alert] = "La séance n'a PAS été mise à jour"
      render action: "edit"
    end
  end

  def destroy
    @work_session.destroy ? flash[:notice] = "La séance a été supprimée" : flash[:alert] = "La séance n'as PAS été supprimée"
    redirect_to(work_sessions_url)
  end

  private

  def permitted_params
    params.require(:work_session).permit(:date, :daily_schedule)
  end

  def set_work_session
    @work_session = WorkSession.find(params[:id])
  end
end
