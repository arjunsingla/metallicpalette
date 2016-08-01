class PurchaseMailer < ActionMailer::Base
	layout 'purchase_mailer'
	default from: "Metallic Palette <noreply@metallicpalette.com>"

	def purchase_receipt purchase
		@purchase = purchase
		@piece = Piece.find(purchase.piece_id)
		mail to: purchase.customer_email, subject: "Thanks for your purchase!"
	 end

	def purchase_notification purchase
		@purchase = purchase
		@piece = Piece.find(purchase.piece_id)
		mail to: purchase.seller_email, subject: "You Just $old $omething!!"
	end
end