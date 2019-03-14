# frozen_string_literal: true

class StudentsController < ApplicationController
  include StudentSearch
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = Student.all.page params[:page]
  end

  def show
    @skills = @student.skills_with_sections
  end

  def new
    @student = Student.new
  end

  def edit; end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student, notice: "L'étudiant.a a bien été créé.e"
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: "Les informations sur l'étudiant.e ont bien été mises à jour."
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :search, :session_ids)
  end
end
