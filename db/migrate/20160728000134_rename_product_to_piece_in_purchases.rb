class RenameProductToPieceInPurchases < ActiveRecord::Migration
  def change
  	  	rename_column :purchases, :product_id, :piece_id

  end
end
