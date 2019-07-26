class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.create(powers_params)
    redirect_to @power
  end

  def update
    @power = Power.find(params[:id])
    @power.update(powers_params)
    redirect_to @power
  end

  def edit
    @power = Power.find(params[:id])
  end

  private 
  def powers_params
    params.require(:power).permit(:name, :description)
  end
end
