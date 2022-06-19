require "csv"

class Item
  attr_accessor :name, :price, :quantity, :brand, :description, :id

  def initialize(id, name, price, quantity, brand, description)
    @id = id
    @name = name
    @price = price
    @quantity = quantity
    @brand = brand
    @description = description
  end

  def save_to_csv
    CSV.open("db/item.csv", "a", {:row_sep => "\r\n"}) do |csv|
      csv << [@id, @name, @price, @quantity, @brand, @description]
    end
  end

  def update_csv
    all_items = self.all
    CSV.open("db/item.csv", "w") do |csv|
      all_items.each do |item|
        if item.id.to_i == id.to_i
          csv << [item.id, @name, @price, @quantity, @brand, @description]
        else
          csv << [item.id, item.name, item.price, item.quantity, item.brand, item.description]
        end
      end
    end
  end

  def self.all
    item_temporary = []
    all_items = []
    CSV.foreach(("db/item.csv"), headers: true, col_sep: ",") do |row|
      item_temporary = self.new(row[0], row[1], row[2], row[3], row[4], row[5])
      all_items << item_temporary
    end
    return all_items
  end

  def self.find_by(id)
    @items = self.count_all
    if @items.to_i >= id.to_i
      CSV.foreach("db/item.csv") do |row|
        if row[0].to_i === id.to_i
          item = self.new(row[0], row[1], row[2], row[3], row[4], row[5])
          return item
        end
      end
    else
      return 0
    end
  end

  def self.count_all
    rows = []
    CSV.foreach(("db/item.csv"), headers: true, col_sep: ",").with_index do |row, i|
      rows << i + 1
    end
    return rows.pop || 0
  end

  def self.delete_by(id)
    all_items = self.all
    output = []
    output = all_items.delete_if { |item| item.id.to_i == id }
    CSV.open("db/item.csv", "w") do |csv|
      output.each do |item|
        csv << [item.id, item.name, item.price, item.quantity, item.brand, item.description]
      end
    end
  end

  def self.buy_item(id, quantity)
    all_items = self.all
    all_items.each do |item|
      if item.id.to_i == id.id.to_i
        item.quantity = item.quantity.to_i - quantity
      end
      CSV.open("db/item.csv", "w") do |csv|
        all_items.each do |item|
          csv << [item.id, item.name, item.price, item.quantity, item.brand, item.description]
        end
      end
    end
  end

end
