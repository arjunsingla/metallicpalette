class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :genre
      t.string :size
      t.decimal :price
      t.string :description
      t.integer :status

      t.timestamps null: false
    end
  end
end
