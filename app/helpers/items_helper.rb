module ItemsHelper
  def find_item(id)
    item = Item.find_by_id(id)
    return item.name
  end
end
