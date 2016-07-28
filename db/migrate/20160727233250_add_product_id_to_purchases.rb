class AddProductIdToPurchases < ActiveRecord::Migration
  def change
  		add_column :purchases, :product_id, :integer
  		remove_column :purchases, :customer_apartment, :string
  end
end
