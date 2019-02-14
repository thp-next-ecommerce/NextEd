# frozen_string_literal: true

class DomainsController < ApplicationController
  before_action :set_domain, only: %i[show edit update]

  def index
    @domains = Domain.all
  end

  def show; end

  def edit; end

  def update
    if @domain.update(update_params)
      flash[:notice] = "Le domain #{@domain.id} a bien été mis à jour"
      redirect_to domain_path(@domain)
    else
      flash[:alert] = "Le domain #{@domain.id} n'as pas été mis à jour"
      render action: "edit"
    end
  end

  private

  def set_domain
    @domain = Domain.find(params[:id])
  end

  def update_params
    @update_params ||= params.require(:domain).permit(:name, :description, :culture_id)
  end
end
