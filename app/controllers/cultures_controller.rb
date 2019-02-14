# frozen_string_literal: true

class CulturesController < ApplicationController
  before_action :set_culture, only: %i[show edit update]

  def index
    @cultures = Culture.all
  end

  def show; end

  def edit; end

  def update
    if @culture.update(update_params)
      flash[:notice] = "La culture #{@culture.id}a bien ete mise à jour"
      redirect_to culture_path(@culture)
    else
      flash[:alert] = "La culture #{@culture.id} n'as pas été mise à jour"
      render action: "edit"
    end
  end

  private

  def set_culture
    @culture = Culture.find(params[:id])
  end

  def update_params
    @update_params ||= params.require(:culture).permit(:name, :description)
  end
end
