class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
    	t.string :costumer_email
    	t.integer :amount
    	t.string :description
    	t.string :currency
    	t.string :customer_id
    	t.string :customer_address_line_1
    	t.string :customer_address_line_2
    	t.string :card
    	t.string :seller_name
    	t.string :seller_email
    	t.string :seller_address_line_1
    	t.string :seller_address_line_2
      t.timestamps null: false
    end
  end
end
