class ChargesController < ApplicationController
	def create
	 
		piece = Piece.find(params[:piece_id])

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => piece.price_in_cents,
	    :description => piece.title,
	    :currency    => 'usd'
	  )

	 	purchase = Purchase.create(
	 		customer_email: params[:stripeEmail], 
	 		amount: piece.price_in_cents, 
	 		currency: charge.currency,
	 		card: params[:stripeToken],
	 		description: charge.description, 
	    	customer_id: customer.id, 

	    	customer_name: params[:stripeShippingName],
	    	customer_address_line_1: params[:stripeShippingAddressLine1],
	    	customer_apartment: params[:stripeShippingAddressApt],
    		customer_city: params[:stripeShippingAddressCity],
    		customer_state: params[:stripeShippingAddressState],
			customer_zip_code: params[:stripeShippingAddressZip],
			customer_country: params[:stripeShippingAddressCountry],

	    	seller_name: piece.user.name,
	    	seller_email: piece.user.email,
	    	seller_address_line_1: piece.user.address_line_1,
	    	seller_address_line_2: piece.user.address_line_2,
	    	seller_city: piece.user.city,
	    	seller_state: piece.user.state,
	    	seller_zip_code: piece.user.zip_code

	   )

		redirect_to purchase


	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end