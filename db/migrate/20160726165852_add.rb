class Add < ActiveRecord::Migration
  def change
  		add_column :purchases, :seller_city, :string
  		add_column :purchases, :seller_state, :string
  		add_column :purchases, :seller_zip_code, :integer

  		add_column :purchases, :customer_apartment, :string
  		add_column :purchases, :customer_city, :string
  		add_column :purchases, :customer_country, :string
  		add_column :purchases, :customer_state, :string
  		add_column :purchases, :customer_zip_code, :integer
  		add_column :purchases, :customer_name, :string

  		remove_column :purchases, :customer_address_line_2, :string
  end
end