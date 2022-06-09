require "item"
require "view"

class Controller
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

  def items_index
    items = Item.all
    View.all(items)
  end

  def show
    id = @view.ask_item_id
    item = Item.find(id)
    View.show(item)
  end

  # def count_all
  #   View.count(Item.count_all)
  # end

  def delete_by_id
    id = @view.ask_item_id
    Item.delete_by(id)
    # @view.delete_confirm
  end
end
