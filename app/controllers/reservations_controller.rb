class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :update, :show]

  def index
    @reservations = Reservation.all
  end

  def show
    respond_to do |format|
      format.html
      format.json{render json: @reservation}
    end
  end

  def new
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
    binding.pry
    respond_to do |format|
      if @reservation.save
        format.html {redirect_to @reservation, notice: 'Reservation was successfully created'}
        format.json {redirect action: 'show', status: :created, location: @reservation}
      else
        format.html{render action: 'new'}
        format.json{render json:@reservation.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html {redirect_to @reservation, notice: 'Reservation successfully updated'}
        format.json {head :no_content}
      else
        format.html {render action: 'edit'}
        format.json {render json: @reservation.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @reservation = Reservation.find(params[:reservation_id])
    @reservation.destroy
    respond_to do |format|
      format.html {redirect_to reservations_path}
      format.json {head :no_content}
    end
  end



  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:email, :request_date, :message, :restaurant_id)
  end

end
