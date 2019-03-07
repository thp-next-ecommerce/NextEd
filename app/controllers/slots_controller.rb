# frozen_string_literal: true

class SlotsController < ApplicationController
  before_action :set_slot, only: %i[update edit]
  def index
    @slots = Slot.all
  end

  def new
    @slot = Slot.new
  end

  def create
    @slot = Slot.new(permitted_params)
    if @slot.save
      flash[:notice] = "Le slot a été créée"
      redirect_to slots_path
    else
      flash[:alert] = "Le slot n'a PAS été créée"
      render action: "new"
    end
  end

  def edit; end

  def update
    if @slot.update(permitted_params)
      flash[:notice] = "Le slot #{@slot.name} a bien été mis à jour"
      redirect_to slots_path
    else
      flash[:alert] = "Le slot #{@slot.name} n'as pas été mis à jour"
      render action: "edit"
    end
  end

  private

  def permitted_params
    params.require(:slot).permit(:name, :start_time, :end_time)
  end

  def set_slot
    @slot = Slot.find(params[:id])
  end
end
