# frozen_string_literal: true

class SkillsController < ApplicationController
  before_action :set_skill, only: %i[show update edit]
  def index
    @skills = Skill.all
  end

  def show; end

  def edit; end

  def update
    @skill.update(skill_params)
    redirect_to skills_path
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
