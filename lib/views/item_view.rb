class View
  def create_item
    print "-" * 50
    get_name
    get_price
    get_quantity
    get_brand
    print "-" * 50

    return params = { name: @name, price: @price, quantity: @quantity, brand: @brand }
  end

  def get_name
    @name
    loop do
      print "\nWhat's the item name ?\n>"
      @name = gets.chomp
      break if @name.length > 0 && @name.length <= 100
      print "\nName's should be between 1 and 100 characters. Please try again !"
    end
    return @name
  end

  def get_price
    @price
    loop do
      print "\nWhat's the item price ?\n>"
      @price = gets.chomp
      break if @price.length > 0 && @price.length <= 10
      print "\nPrice isn't correct, is it ?"
    end
    return @price
  end

  def get_quantity
    @quantity
    loop do
      print "\nHow many of this item do you have in stock ?\n>"
      @quantity = gets.chomp
      break if @quantity.length > 0 && @quantity.length <= 4
      print "\nIsn't it a bit excessive ?"
    end
    return @quantity
  end

  def get_brand
    @brand
    loop do
      print "\nWhat's the item brand ?\n>"
      @brand = gets.chomp
      break if @brand.length > 0 && @brand.length <= 30
      print "\nBrand name should be between 1 and 30 characters. Please try again !"
    end
    return @brand
  end

  def self.all(all_items)
    sorted_items = all_items.sort_by! { |i| i.name.downcase }
    sorted_items.each do |item|
      print "-" * 50
      print "\nID : #{item.id}, Item name : #{item.name}.\n"
    end
  end

  # def self.count(total)
  #   print "There are #{total} items."
  # end

  def ask_item_id
    print "-" * 50
    print "\nWhich item would you like to pick ?\n>"
    id = gets.chomp.to_i
    return id
  end

  def invalid_id
    print "Invalid Id"
  end

  def self.show(item)
    print "-" * 50
    print "\nItem ID : #{item.id}, Item name : #{item.name}, Item price : #{item.price}, Item quantity : #{item.quantity}, Item brand : #{item.brand}.\n"
    print "-" * 50
  end
end
