class View
  def create_item
    get_name
    get_price
    get_quantity
    get_brand

    return params = { name: @name, price: @price, quantity: @quantity, brand: @brand }
  end

  def get_name
    @name
    loop do
      puts "What's the item name ?\n>"
      @name = gets.chomp
      break if @name.length > 0 && @name.length <= 100
      print "Name's should be between 1 and 100 characters. Please try again !"
    end
    return @name
  end

  def get_price
    @price
    loop do
      puts "What's the item price ?\n>"
      @price = gets.chomp
      break if @price.length > 0 && @price.length <= 10
      print "Price isn't correct, is it ?"
    end
    return @price
  end

  def get_quantity
    @quantity
    loop do
      puts "How many of this item do you have in stock ?\n>"
      @quantity = gets.chomp
      break if @quantity.length > 0 && @quantity.length <= 4
      print "Isn't it a bit too many to hold ?"
    end
    return @quantity
  end

  def get_brand
    @brand
    loop do
      puts "What's the item brand ?\n>"
      @brand = gets.chomp
      break if @brand.length > 0 && @brand.length <= 30
      print "Brand name should be between 1 and 30 characters. Please try again !"
    end
    return @brand
  end

  def self.all(all_items)
    sorted_items = all_items.sort_by! { |i| i.name.downcase }
    sorted_items.each do |item|
      print "#{item.id}, Item name : #{item.name}.\n"
    end
  end

  # def self.count(total)
  #   puts "There are #{total} items."
  # end

  def ask_item_id
    puts "Which item would you like to pick ?\n>"
    id = gets.chomp.to_i
    return id
  end

  def self.show(item)
    print "Item ID : #{item.id}, Item name : #{item.name}, Item price : #{item.price}, Item quantity : #{item.quantity}, Item brand : #{item.brand}.\n"
  end
end
