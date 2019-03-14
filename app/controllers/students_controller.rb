# frozen_string_literal: true

class StudentsController < ApplicationController
  include StudentSearch
  before_action :set_student, only: %i[show edit update destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all.page params[:page]
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @skills = @student.skills_with_sections
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit; end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: "L'étudiant.a a bien été créé.e" }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Les informations sur l'étudiant.e ont bien été mises à jour." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    if valid_file(params[:students_csv])
      CsvManager::CheckCsv.check_students(params[:students_csv])
      flash[:notice] = "Import en cours (#{ImportError.count} erreurs de formatage rencontrées, consultez l'onglet Rapport d'importation pour plus de détails)"
    else
      flash[:alert] = "Le fichier doit être au format CSV!"
    end
    redirect_to students_path
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :search, :session_ids)
  end

  def valid_file(file)
    file.content_type.include? "csv"
  end
end
