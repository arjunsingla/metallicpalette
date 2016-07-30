class AddCountryToPurchaseAndBooleanToUsers < ActiveRecord::Migration
  def change
  	  	add_column :purchases, :customer_country, :string
  end
end