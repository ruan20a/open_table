# == Schema Information
#
# Table name: restaurants
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text
#  address      :text
#  phone_number :string(255)
#  image        :string(255)
#  menu         :string(255)
#  owner_id     :integer
#

class Restaurant < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader
  belongs_to :owner
end
