class Change < ActiveRecord::Migration
  def change
  	change_column :pieces, :price, :decimal, precision: 8, scale: 2
  end
end
