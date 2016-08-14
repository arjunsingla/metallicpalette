class RemoveAmountFromPurchases < ActiveRecord::Migration
  def change
  	   remove_column :purchases, :amount, :integer
  end
end
