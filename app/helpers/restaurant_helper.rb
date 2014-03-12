module RestaurantHelper
  def format_submit_phone(number)
    number.gsub(/[^0-9]/, '')
  end

  def format_show_phone(number)
    number = number.to_s
    number.insert(-5,"-")
    number.insert(-9,"-")
    if number.length == 11
      number.insert(1,"-")
    end
  end
end