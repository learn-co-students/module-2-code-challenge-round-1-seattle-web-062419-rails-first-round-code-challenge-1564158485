class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroines_params)
    redirect_to @heroine
  end

  def update
    @heroine = Heroine.find(params[:id])
    @heroine.update(heroines_params)
    redirect_to @heroine
  end

  def edit
    @heroine = Heroine.find(params[:id])
  end

  private 
  def heroines_params
  params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
