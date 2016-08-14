class AddFeesToPurchasesAndActualPricevsArtistPricePiece < ActiveRecord::Migration
  def change

  	  	rename_column :pieces, :price, :artist_cut
  	  	add_column :pieces, :total_price, :decimal, precision: 8, scale: 2
  		
  	  	add_column :purchases, :total_transaction, :decimal, precision: 8, scale: 2
  	  	add_column :purchases, :stripe_fee, :decimal, precision: 8, scale: 2
  	  	add_column :purchases, :taxes, :decimal, precision: 8, scale: 2
  	  	add_column :purchases, :artist_cut, :decimal, precision: 8, scale: 2
  	  	add_column :purchases, :charity_cut, :decimal, precision: 8, scale: 2
  	  	add_column :purchases, :our_cut, :decimal, precision: 8, scale: 2

  end
end