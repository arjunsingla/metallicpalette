class PurchaseMailer < ActionMailer::Base
	layout 'purchase_mailer'
	default from: "Metallic Palette <reciepts@metallicpalette.com>"

	def purchase_receipt purchase
		@purchase = purchase
		mail to: purchase.customer_email, subject: "Thanks for your purchase!"
	 end
end