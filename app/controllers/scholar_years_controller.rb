# frozen_string_literal: true

class ScholarYearsController < ApplicationController
  def index
    @scholar_years = ScholarYear.all
    @scholar_year = ScholarYear.new
  end

  def create
    @scholar_year = ScholarYear.new(scholar_year_params)
    if @scholar_year.save
      redirect_to scholar_years_path, notice: "Année scolaire bien enregistrée."
    else
      render :new, notice: "L'année scolaire n'a pas été enregistrée."
    end
  end

  def archive
    @scholar_year = ScholarYear.find(params[:id])
    if @scholar_year.current?
      @scholar_year.update(current: false)
    else
      @scholar_year.update(current: true)
    end
    redirect_to scholar_years_path
  end

  private

  def scholar_year_params
    params.require(:scholar_year).permit(:start_date, :end_date)
  end
end
