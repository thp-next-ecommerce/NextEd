# frozen_string_literal: true

class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.update(skill_params)
    redirect_to skills_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
