require_relative "../models/item"
require_relative "../views/item_view"

class ItemController
  def initialize
    @view = View.new
  end

  def create_item
    params = @view.create_item
    id = (Item.count_all) + 1
    item = Item.new(id, params[:name], params[:price], params[:quantity], params[:brand])
    item.save_to_csv
    View.show(item)
  end

  def items_alphabet_order
    items = Item.all
    View.sorted_alphabet(items)
  end

  def items_from_lowest
    items = Item.all
    View.sorted_lowest(items)
  end

  def items_from_highest
    items = Item.all
    View.sorted_highest(items)
  end

  def show
    id = @view.ask_item_id
    item = Item.find_by(id)
    if item == 0
      @view.invalid_id
    else
      View.show(item)
      quantity = View.buy_item(item)
      Item.buy_item(item, quantity)
    end
  end

  # def count_all
  #   View.count(Item.count_all)
  # end

  def update_item
    id = @view.ask_item_id
    item = Item.find_by(id)
    if item == 0
      @view.invalid_id
    else
      params = @view.create_item
      updated_item = Item.new(id, params[:name], params[:price], params[:quantity], params[:brand])
      updated_item.update_csv
      View.show(updated_item)
    end
  end

  def delete_by_id
    id = @view.ask_item_id
    item = Item.find_by(id)
    if item == 0
      @view.invalid_id
    else
      Item.delete_by(id)
    end
  end
end
