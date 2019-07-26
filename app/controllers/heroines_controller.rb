class HeroinesController < ApplicationController
  # def index
  #   @heroines = Heroine.all
  # end

  def index
    @heroines = Heroine.search(params[:search])
  end

  def new
    @powers = Power.all
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save!
      redirect_to @heroine
    else
      render :new 
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  private 

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
