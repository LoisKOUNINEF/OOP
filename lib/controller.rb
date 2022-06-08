require "item"
require "view"

class Controller
  def initialize
    @view = View.new
  end

  def create_item
    params = @view.create_item
    id = (Item.count_all) + 1
    item = Item.new(id, params[:product], params[:price], params[:quantity], params[:brand])
    item.save_to_csv
  end

  def items_index
    items = Item.all
    View.all(items)
  end

  # def count_all
  #   View.count(Item.count_all)
  # end

  def delete_by_id
    list = self.items_index
    id = @view.ask_item_id
    Item.delete_by(id)
    # @view.delete_confirm
  end
end
