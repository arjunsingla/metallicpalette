class ChangeCharityCut < ActiveRecord::Migration
  def change
  	  	remove_column :purchases, :charity_cut, :decimal
  end
end
