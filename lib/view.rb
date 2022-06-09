class View
  def create_item
    puts "What's the name ?"
    print ">"
    @name = gets.chomp
    puts "Whats the price ?"
    print ">"
    @price = gets.chomp
    puts "Whats the quantity ?"
    print ">"
    @quantity = gets.chomp
    puts "Whats the brand ?"
    print ">"
    @brand = gets.chomp

    return params = { name: @name, price: @price, quantity: @quantity, brand: @brand }
  end

  def self.all(all_items)
    all_items.each do |item|
      print "#{item.id}, Item name : #{item.name}.\n"
    end
  end

  # def self.count(total)
  #   puts "There are #{total} items."
  # end

  def ask_item_id
    puts "Which item would you like to pick?\n>"
    id = gets.chomp.to_i
    return id
  end

  def self.show(item)
    print "Item ID : #{item.id}, Item name : #{item.name}, Item price : #{item.price}, Item quantity : #{item.quantity}, Item brand : #{item.brand}.\n"
  end
end
