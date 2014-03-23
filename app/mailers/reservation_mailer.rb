class ReservationMailer < ActionMailer::Base
  default from: ""

  def reservation_notification(owner, restaurant, reservation)
    @owner = owner
    @restaurant = restaurant
    @reservation = reservation
    mail :to => @owner.email, :subject => "#{@restaurant.name.titleize} has a new reservation on #{@reservation.request_date}"
  end

  # # send a signup email to the user, pass in the user object that   contains the user's email address
  # def send_signup_email(user)
  #   @user = user
  #   mail( :to => @user.email,
  #   :subject => 'Thanks for signing up for our amazing app' )
  # end

end


