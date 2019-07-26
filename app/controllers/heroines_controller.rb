class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def search
    # only returns the first matching heroine
    # if multiple have the same power and
    # the power has more than one word
    @search_term = Power.all.select {|p| p.name.include?(params[:q])}.first.name

    if params[:q]
      @heroines_matched = Heroine.all.select {|h| h.power.name == @search_term}
    end
  end

  # def search
  # attempt at returning all heroines that match the super power
  #   @search_term = Power.all.select {|p| p.name.include?(params[:q])}.first.name
  #   @search_term_array = Power.all.select {|p| p.name.include?(params[:q])}
  #   @heroine_array_empty = Heroine.all.select {|h| h.power.name == @search_term}.empty?
  #   @heroine_array = Heroine.all.select {|h| h.power.name == @search_term}
  #   @new_h_array = []

  #   if @search_term_array.length > 1 && (@heroine_array_empty == false)
  #     @search_term_array.each do |s|
  #       @heroine_array.each do |h|
  #         if h.power.name == s.name
  #           @new_h_array << h
  #         end
  #       end
  #     end
  #   elsif @search_term_array.length == 1 && (@heroine_array_empty == false)
  #     @heroine_array
  #   end
  # --
  # html below
  # 
  # <% if @new_h_array.length > 0 %>
  #   <ul>
  #     <% @new_h_array.each do |heroine| %>
  #       <li>
  #         <%= link_to heroine.super_name, heroine_path(heroine) %>
  #       </li>
  #       <br>
  #     <% end %>
  #   </ul>
  #   <% else %>
  #   <ul>
  #     <% @heroine_array.each do |heroine| %>
  #       <li>
  #         <%= link_to heroine.super_name, heroine_path(heroine) %>
  #       </li>
  #       <br>
  #     <% end %>
  #   </ul>
  #   <% end %>
  # end

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
  nochange
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
