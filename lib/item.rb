require "csv"

class Item
  attr_accessor :product, :id

  def initialize(id, product)
    @id = id
    @product = product
  end

  def save_to_csv
    CSV.open("db/item.csv", "a") do |csv|
      csv << [@id, @product]
    end
  end

  def self.all
    item_temporary = []
    all_items = []
    CSV.foreach("db/item.csv") do |row|
      item_temporary = Item.new(row[0], row[1])
      all_items << item_temporary
    end
    return all_items
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
    CSV.foreach("db/item.csv") do |row|
      item_temporary = Item.new(row[0], row[1])
      all_items << item_temporary
    end
    output = all_items.delete_if { |item| item.id.to_i == id }
    CSV.open("db/item.csv", "w") do |csv|
      output.each do |item|
        csv << [item.id, item.product]
      end
    end
  end
end
