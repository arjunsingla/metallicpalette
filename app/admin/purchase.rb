ActiveAdmin.register Purchase do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	 filter :total_transaction
	 filter :artist_cut
	 filter :stripe_fee
	 filter :taxes
	 filter :our_cut
    filter :description
    filter :piece_id
    filter :customer_email
    filter :seller_email
    filter :customer_name
    filter :customer_address_line_1
    filter :customer_city
    filter :customer_state
    filter :customer_zip_code
    filter :customer_country
    filter :seller_name
    filter :seller_address_line_1
    filter :seller_address_line_2
    filter :seller_city
    filter :seller_state
    filter :seller_zip_code 
    filter :currency
    filter :card
    filter :created_at
    filter :ship_by
    filter :arrive_by


	index do
	    selectable_column
	    id_column
	    column :total_transaction do |purchase|
	    	"$" + number_with_precision(purchase.total_transaction, :precision => 2, :delimiter => ',')
	     end
	    column :artist_cut do |purchase|
    	   "$" + number_with_precision(purchase.artist_cut, :precision => 2, :delimiter => ',')
       end
       column :stripe_fee do |purchase|
    	   "$" + number_with_precision(purchase.stripe_fee, :precision => 2, :delimiter => ',')
       end
       column :taxes do |purchase|
    	   "$" + number_with_precision(purchase.taxes, :precision => 2, :delimiter => ',')
       end
       column :our_cut do |purchase|
    	   "$" + number_with_precision(purchase.our_cut, :precision => 2, :delimiter => ',')
       end
    
	    column :description
	    column :piece_id
	    column :customer_email
	    column :seller_email
	    column :customer_name
	    column :customer_address_line_1
	    column :customer_city
	    column :customer_state
	    column :customer_zip_code
	    column :customer_country
	    column :seller_name
	    column :seller_address_line_1
	    column :seller_address_line_2
	    column :seller_city
	    column :seller_state
	    column :seller_zip_code 
	    column :currency
	    column :card
	    column :created_at
	    column :ship_by
	    column :arrive_by
	    actions
	  end
end