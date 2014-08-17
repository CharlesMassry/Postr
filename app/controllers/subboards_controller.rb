class SubboardsController < ApplicationController
  def new
    @subboard = Subboard.new
  end

  def create
    subboard = Subboard.new(subboard_params)
    subboard.save
    redirect_to subboard
  end

  def show
    @subboard = find_subboard
  end

  private

  def find_subboard
    Subboard.find_by(slug: params[:id])
  end

  def subboard_params
    params.require(:subboard).permit(:name, :description)
  end
end
