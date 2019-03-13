# frozen_string_literal: true

class WorkSessionsController < ApplicationController
  before_action :set_work_session, only: %i[show update edit]

  def index
    @work_sessions = WorkSession.all
  end

  def new
    @work_session = WorkSession.new
    @groups = Group.all
  end

  def create
    @work_session = WorkSession.new(permitted_params)
    unless ScholarYear.up_to_date?
      flash[:alert] = "Veuillez créer une année courante."
      render action: "new"
      return
    end
    @work_session.update(scholar_year: ScholarYear.current_year.first)
    if @work_session.save
      flash[:notice] = "La séance a été créée"
      redirect_to(@work_session)
    else
      flash[:alert] = "La séance n'a PAS été créée, motif : #{@work_session.errors.full_messages}"
      render action: "new"
    end
  end

  def show; end

  def edit; end

  def update
    if unarchived_session? && @work_session.update(permitted_params)
      redirect_to work_session_path, notice: "La séance a été mise à jour"

    elsif unarchived_session? == false
      redirect_back fallback_location: work_sessions_path, alert: "Vous ne pouvez pas modifier une séance archivée"
    else
      redirect_back fallback_location: work_sessions_path, alert: @work_session.errors.full_messages.to_s
    end
  end

  private

  def permitted_params
    params.require(:work_session).permit(:date, :slot_id, student_ids: [], skill_ids: [], teacher_ids: [], subject_ids: [])
  end

  def set_work_session
    @work_session = WorkSession.find(params[:id])
  end

  def unarchived_session?
    Time.zone.now < @work_session.date
  end
end
