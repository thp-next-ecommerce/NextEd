# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show update edit destroy]

  def index; @lessons = Lesson.all end

  def new; @lesson = Lesson.new end

  def create
    @lesson = Lesson.new(permitted_params)

    if @lesson.save
      flash[:notice] = "La séance a été créée"
      redirect_to(@lesson)
    else
      flash[:alert] = "La séance n'a PAS été créée"
      render action: "new"
    end
  end

  def show; end

  def edit; end

  def update
    if @lesson.update(permitted_params)
      flash[:notice] = "La séance a été mise à jour"
      redirect_to(@lesson)
    else
      flash[:alert] = "La séance n'a PAS été mise à jour"
      render action: "edit"
    end
  end

  def destroy
    @lesson.destroy ? flash[:notice] = "La séance a été supprimée" : flash[:alert] = "La séance n'as PAS été supprimée"
    redirect_to(lessons_url)
  end

  private

  def permitted_params
    params.require(:lesson).permit(:date, :daily_schedule)
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
