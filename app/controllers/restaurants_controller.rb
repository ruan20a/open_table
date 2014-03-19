class RestaurantsController < ApplicationController
  before_action :authenticate_owner!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :set_restaurant, only:[:show,:edit,:update,:destroy]
  helper RestaurantHelper
  # get /restaurants
  # get /restaurant.json
  def index
    @restaurants = Restaurant.all
  end

  # get /restaurants/1
  # get /restaurants/1.json
  def show
    # @restaurant.phone_number = format_show_phone(@restaurant.phone_number)
    respond_to do |format|
      format.html
      format.json{render json: @restaurant}
    end
  end

  # get /restaurants/new
  def new
    @restaurant = Restaurant.new
    @restaurant.owner_id = current_owner.id
  end

  # get /restaurants/1/edit
  def edit
  end

  # post /restaurants
  # post /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    #TODO format phone number correctly
    # format_submit_phone(@restaurant.phone_number)
    @restaurant.owner_id = current_owner.id
    respond_to do |format|
      if @restaurant.save
        format.html {redirect_to @restaurant, notice: 'Restaurant was successfully created'}
        format.json {redirect action: 'show', status: :created, location: @restaurant}
      else
        format.html {render action: 'new'}
        format.json {render json: @restaurant.errors, status: :unprocessable_entity}
      end
    end
  end

  #PATCH/PUT /restaurants/1
  #PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html {redirect_to @restaurant, notice: 'Restaurant successfully updated.'}
        format.json {header :no_content}
      else
        format.html {render action: 'edit'}
        format.json {render json: @restaurant.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html {redirect_to restaurants_path}
      format.json {head :no_content}
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :phone_number, :image, :image_cache, :remote_image_url, :remove_image,:menu, :menu_cache, :remote_menu_url, :remove_menu, :owner_id)
  end

  def check_owner
    restaurant = Restaurant.find(params[:id])
    redirect_to "/owners/sign_in", notice: "You are not the owner of this restaurant" unless current_owner.id == restaurant.owner_id
    # redirect_to "/owners/sign_in",method: :get, notice: "You are not the owner of this restaurant. Please login to the correct account." unless current_owner.id == restaurant.owner.id
  end

end