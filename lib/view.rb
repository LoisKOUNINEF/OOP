class View
  def create_item
    puts "What's the product ?"
    print ">"
    @product = gets.chomp
    puts "Whats the price ?"
    print ">"
    @price = gets.chomp
    puts "Whats the quantity ?"
    print ">"
    @quantity = gets.chomp
    puts "Whats the brand ?"
    print ">"
    @brand = gets.chomp

    return params = { product: @product, price: @price, quantity: @quantity, brand: @brand }
  end

  def self.all(all_items)
    all_items.each do |item|
      print "item ID :"
      puts "#{item.id}"
      print "item product :"
      puts "#{item.product}"
      print "item price :"
      puts "#{item.price}"
      print "item quantity :"
      puts "#{item.quantity}"
      print "item brand :"
      puts "#{item.brand}"
    end
  end

  # def self.count(total)
  #   puts "There are #{total} items."
  # end

  def ask_item_id
    puts "Which item would you like to delete ?"
    print ">"
    id = gets.chomp.to_i
    return id
  end
end
