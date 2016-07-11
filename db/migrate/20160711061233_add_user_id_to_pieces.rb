class AddUserIdToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :user_id, :integer
    add_index :pieces, :user_id
  end
end
