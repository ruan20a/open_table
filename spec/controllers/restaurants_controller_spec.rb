require 'spec_helper'

describe RestaurantsController do

  let(:restaurant) do
    Restaurant.create(name: "Sample", description: "sample sample", address: "sample address", phone_number: "sample number", image: "sample_image" )
  end

  describe "GET index" do
    it "renders the index view" do
      get :index
      response.should render_template :index
    end

    it "assigns all restaurants as @restaurants" do
      restaurant
      get :index
      restaurant_array = []
      restaurant_array << restaurant
      # expect(assigns(:restaurants)).to eq([restaurant])
      assigns(:restaurants).should eq(restaurant_array)
    end
  end

  describe "GET show" do
    it "renders the show view" do
      get :show, id: restaurant.id
      expect(response).to render_template :show
    end

    it "show the restaurant that you assigned as @restaurant" do
      get :show, id: restaurant.id
      assigns(:restaurant).should eq(restaurant)
    end
  end

  describe "GET new" do
    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns restaurant as the new restaurant" do
      get :new
      assigns(:restaurant).should be_a_new(Restaurant)
    end
  end

  describe "GET edit" do
    it "renders the edit view" do
      get :edit, id: restaurant.id
      expect(response).to render_template :edit
    end

    it "shows the correct restaurants for the edit page" do
      get :edit, id: restaurant.id
      assigns(:restaurant).should eq (restaurant)
    end
  end

  describe "POST create" do
    let(:valid_restaurant_params) do
      {restaurant: {
        name: "sample2",
        description: "sample2desc",
        address: "sample2add",
        phone_number: "1234567890",
        image: "sample2image"
        }
      }
    end

    it "redirects to the new restaurant" do
      post :create, valid_restaurant_params
      expect(response).to redirect_to Restaurant.last
    end

    it "creates a new restaurant" do
      expect{post :create, valid_restaurant_params}.to change{Restaurant.count}.by(1)
    end

    # context "when there are invalid params" do
    #   let(:invalid_restaurant_params) do {
    #     gaga: "sampleinvalid"
    #   }
    #   end

    #   it "renders the new page" do
    #     post :create, restaurant: invalid_restaurant_params
    #     expect(response).to render_template(:new)
    #   end

    #   it "does not create a new restaurant" do
    #     expect{post :create, invalid_restaurant_params}.to change{Restaurant.count}.by(0)
    #   end
    # end
  end

  describe "PUT update" do
    let(:restaurant_update_params) do
      {
        name: "samplechange"
      }
    end

    it "redirects back to restaurant if successful" do
      put :update, id: restaurant.id, restaurant: restaurant_update_params
      expect(response).to redirect_to Restaurant.find(restaurant.id)
    end

    it "expects restaurant to change the name" do
      put :update, id: restaurant.id, restaurant: restaurant_update_params
      expect(Restaurant.find(restaurant.id).name).to eq "samplechange"
    end

    # let(:invalid_restaurant_params) do
    #   {
    #     gaga: "haha"
    #   }
    # end
  end

  describe "DELETE destroy " do

    it "destroys the restaurant" do
      delete :destroy, id: restaurant.id
      expect(Restaurant.exists?(restaurant.id)).to be_false
    end

    it "redirects back to index" do
      delete :destroy, id: restaurant.id
      expect(response).to redirect_to(restaurants_path)
    end
  end

end