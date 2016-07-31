class AddDescriptionToUsersAndChangePieceDescription < ActiveRecord::Migration
  def change
		change_column :pieces, :description, :text
		add_column :users, :user_description, :text
  end
end
