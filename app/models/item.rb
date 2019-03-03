class Item < ApplicationRecord
  belongs_to :list

  def self.all_items(id)
    Item.find_by_sql([
      "SELECT *
      FROM items AS i
      WHERE i.list_id = ? ", id])  
  end

  def self.create_item(p, list_id)
    Item.find_by_sql(["
    INSERT INTO items (title, details, priority, list_id, created_at, updated_at)
    VALUES (:title, :details, :priority, :list_id, :created_at, :updated_at);
    ", {
      title: p[:title],
      details: p[:details],
      priority: p[:priority],
      list_id: list_id,
      created_at: DateTime.now,
      updated_at: DateTime.now
      }])
  end

  def self.update_item(item_id, p)
    Item.find_by_sql(["
    UPDATE items AS i
    SET title = ?, priority = ?, details = ?, updated_at = ?
    WHERE i.id = ?
    ;", p[:title], p[:priority], p[:details], DateTime.now, item_id])
  end
end
