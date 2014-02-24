class RestaurantsController < ApplicationController

  # get /restaurants
  # get /restaurant.json
  def index
    @restaurants = Restaurant.all
  end

  # get /restaurants/1
  # get /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
    respond_to do |format|
      format.html
      format.json{render json: @restaurant}
    end
  end

  # get /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # get /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # post /restaurants
  # post /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    # binding.pry
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
    @restaurant = Restaurant.find(params[:id])
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
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    respond_to do |format|
      format.html {redirect_to restaurants_url}
      format.json {head :no_content}
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :phone_number, :image, :remote_image_url, :remove_image)
  end


end