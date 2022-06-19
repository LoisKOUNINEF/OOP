require "./item.rb"

class Shoe < Item
  attr_accessor :size

  def initialize(shoes_id, shoes_name, shoes_price, shoes_quantity, shoes_brand, shoes_description, shoes_size)
    super(shoes_id, shoes_name, shoes_price, shoes_quantity, shoes_brand)
    @size = shoes_size
  end

end
