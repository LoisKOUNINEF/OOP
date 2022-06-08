class View
  def create_item
    puts "Who is iteming ?"
    print ">"
    @product = gets.chomp

    return params = { product: @product }
  end

  def self.all(all_items)
    all_items.each do |item|
      print "item ID :"
      puts "#{item.id}"
      print "item product :"
      puts "#{item.product}"
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
