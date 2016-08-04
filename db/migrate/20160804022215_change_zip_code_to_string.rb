class ChangeZipCodeToString < ActiveRecord::Migration
  def change
  		change_column :purchases, :seller_zip_code, :string
  		change_column :purchases, :customer_zip_code, :string
  		change_column :users, :zip_code, :string
  end
end
