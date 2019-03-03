class List < ApplicationRecord
  belongs_to :board
  has_many :items, dependent: :destroy

  
  def self.all_lists(id)
    List.find_by_sql([
      "SELECT *
      FROM lists AS l
      WHERE l.board_id = ? ", id])  
  end

  def self.create_list(p, id)
    List.find_by_sql(["
    INSERT INTO lists (title, icon, priority, board_id, created_at, updated_at)
    VALUES (:title, :icon, :priority, :board_id, :created_at, :updated_at);
    ", {
      title: p[:title],
      icon: p[:icon],
      priority: p[:priority],
      board_id: id,
      created_at: DateTime.now,
      updated_at: DateTime.now
      }])
  end

  def self.update_list(p, board_id)
    List.find_by_sql(["
    UPDATE lists as l 
    SET title = ?, priority = ?, icon = ?, updated_at = ?
    WHERE l.id = ?
    ;", p[:title], p[:priority], p[:icon], DateTime.now, board_id])
  end

end
