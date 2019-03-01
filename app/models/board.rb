class Board < ApplicationRecord
  belongs_to :user
  has_many :lists
  


def self.all_boards(user_id)
  Board.find_by_sql("
  SELECT *
  FROM boards as b
  WHERE b.user_id = #{user_id}")
end

end