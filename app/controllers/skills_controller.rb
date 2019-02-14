# frozen_string_literal: true

class SkillsController < ApplicationController
  before_action :set_skill, only: %i[show update edit]
  def index
    @skills = Skill.all
  end

  def show; end

  def edit; end

  def update
    if @skill.update(skill_params)
      flash[:notice] = "La compétence a été mise à jour"
      redirect_to skills_path
    else
      flash[:alert] = "La compétence n'a pas été mise à jour"
      render action: "edit"
    end
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :description, :domain_id)
  end
end
