class User < ApplicationRecord
has_many :boards

  devise :database_authenticatable, :registerable, :recoverable,
        :rememberable, :validatable

        def self.all_boards(user_id)
          Board.find_by_sql("
          SELECT *
          FROM boards as b
          WHERE b.user_id = #{user_id}")
        end
end