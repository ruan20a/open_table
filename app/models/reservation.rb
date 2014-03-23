# == Schema Information
#
# Table name: reservations
#
#  id            :integer          not null, primary key
#  email         :string(255)
#  request_date  :datetime
#  message       :text
#  restaurant_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Reservation < ActiveRecord::Base

belongs_to :restaurant
validates :email, :request_date, :restaurant_id, presence: true
default_scope :order => 'request_date ASC'
end
