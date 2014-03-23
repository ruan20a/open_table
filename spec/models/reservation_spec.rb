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

require 'spec_helper'

describe Reservation do
  pending "add some examples to (or delete) #{__FILE__}"
end
