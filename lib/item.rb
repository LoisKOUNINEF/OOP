require "csv"

class Item
  attr_accessor :name, :price, :quantity, :brand, :id

  def initialize(id, name, price, quantity, brand)
    @id = id
    @name = name
    @price = price
    @quantity = quantity
    @brand = brand
  end

  def save_to_csv
    CSV.open("db/item.csv", "a") do |csv|
      csv << [@id, @name, @price, @quantity, @brand]
    end
  end

  def self.all
    item_temporary = []
    all_items = []
    CSV.foreach("db/item.csv", headers: true, col_sep: ",") do |row|
      item_temporary = Item.new(row[0], row[1], row[2], row[3], row[4])
      all_items << item_temporary
    end
    return all_items
  end

  def self.find(id)
    CSV.foreach(("./db/item.csv"), headers: true, col_sep: ",") do |row|
      if row[0].to_i === id.to_i
        item = Item.new(row[0], row[1], row[2], row[3], row[4])
        return item
      end
    end
  end

  # def self.count_all
  #   rows = []
  #   CSV.foreach("db/item.csv").with_index do |row, i|
  #     rows << i + 1
  #   end
  #   return rows.pop || 0
  # end

  def self.delete_by(id)
    item_temporary = []
    all_items = []
    output = []
    CSV.foreach("db/item.csv", headers: true, col_sep: ",") do |row|
      item_temporary = Item.new(row[0], row[1], row[2], row[3], row[4])
      all_items << item_temporary
    end
    output = all_items.delete_if { |item| item.id.to_i == id }
    CSV.open("db/item.csv", "w") do |csv|
      output.each do |item|
        csv << [item.id, item.name, item.price, item.quantity, item.brand]
      end
    end
  end
end
