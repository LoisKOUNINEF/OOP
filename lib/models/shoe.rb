require "./item.rb"

class Shoe < Item
  attr_accessor :size

  def initialize(shoe_id, shoe_name, shoe_price, shoe_quantity, shoe_brand, shoe_description, shoe_size)
    super(shoe_id, shoe_name, shoe_price, shoe_quantity, shoe_brand, shoe_description)
    @size = shoe_size
  end

end
