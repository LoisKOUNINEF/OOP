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

  def update_csv
    all_items = Item.all
    CSV.open("db/item.csv", "w") do |csv|
      all_items.each do |item|
        if item.id.to_i == id.to_i
          csv << [item.id, @name, @price, @quantity, @brand]
        else
          csv << [item.id, item.name, item.price, item.quantity, item.brand]
        end
      end
    end
  end

  def self.all
    item_temporary = []
    all_items = []
    CSV.foreach("db/item.csv") do |row|
      item_temporary = Item.new(row[0], row[1], row[2], row[3], row[4])
      all_items << item_temporary
    end
    return all_items
  end

  def self.find_by(id)
    @items = Item.count_all
    if @items.to_i >= id.to_i
      CSV.foreach("db/item.csv") do |row|
        if row[0].to_i === id.to_i
          item = Item.new(row[0], row[1], row[2], row[3], row[4])
          return item
        end
      end
    else
      return 0
    end
  end

  def self.count_all
    rows = []
    CSV.foreach("db/item.csv").with_index do |row, i|
      rows << i + 1
    end
    return rows.pop || 0
  end

  def self.delete_by(id)
    all_items = Item.all
    output = []
    output = all_items.delete_if { |item| item.id.to_i == id }
    CSV.open("db/item.csv", "w") do |csv|
      output.each do |item|
        csv << [item.id, item.name, item.price, item.quantity, item.brand]
      end
    end
  end
end
