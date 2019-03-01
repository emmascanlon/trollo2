class List < ApplicationRecord
  belongs_to :board
  has_many :items

  
  def self.all_lists(id)
    List.find_by_sql([
      "SELECT *
      FROM lists AS l
      WHERE l.board_id = ? ", id])  
  end
end
