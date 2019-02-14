class CulturesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  private

  def update_params
    @update_params ||= params.require(:culture).permit(:name, :description)
  end
end
