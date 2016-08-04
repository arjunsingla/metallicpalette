class AddShipByAndArriveByDatesToPurchases < ActiveRecord::Migration
  def change
  	add_column :purchases, :ship_by, :datetime
  	add_column :purchases, :arrive_by, :datetime
  end
end
