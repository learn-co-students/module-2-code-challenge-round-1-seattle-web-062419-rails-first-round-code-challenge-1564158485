class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def search
    @search_term = Power.all.select {|p| p.name.include?(params[:q])}.first.name

    if params[:q]
      @heroines_matched = Heroine.all.select {|h| h.power.name == @search_term}
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)

    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private
  
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
