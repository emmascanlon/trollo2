class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :details
      t.integer :priority
      t.belongs_to :list, foreign_key: true

      t.timestamps
    end
  end
end
