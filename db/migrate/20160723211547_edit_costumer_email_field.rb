class EditCostumerEmailField < ActiveRecord::Migration
  def change
  	 rename_column :purchases, :costumer_email, :customer_email
  end
end
