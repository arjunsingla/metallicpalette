class ChargesController < ApplicationController
	def create
	 

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => params[:amount],
	    :description => '<%= @piece.title %>',
	    :currency    => 'usd'
	  )

	 	purchase = Purchase.create(
	 		customer_email: params[:stripeEmail], 
	 		amount: params[:amount], 
	 		currency: charge.currency,
	 		card: params[:stripeToken],
	 		description: charge.description, 
	    	customer_id: customer.id, 
	    	customer_address_line_1: "customeraddressline1",
	    	customer_address_line_2: "customeraddressline2",
	    	seller_name: "sellername",
	    	seller_email: "selleremail",
	    	seller_address_line_1: "selleraddressline1",
	    	seller_address_line_2: "selleraddressline2",
	   )

		redirect_to purchase


	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end