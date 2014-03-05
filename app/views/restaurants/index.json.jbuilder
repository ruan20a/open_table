json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :description, :address, :phone_number, :image, :menu
  json.url restaurant_url(restaurant, format:json)
end