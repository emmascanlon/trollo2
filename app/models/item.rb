class Item < ApplicationRecord
  belongs_to :list

  def self.all_items(id)
    Item.find_by_sql([
      "SELECT *
      FROM items AS i
      WHERE i.list_id = ? ", id])  
  end
end
