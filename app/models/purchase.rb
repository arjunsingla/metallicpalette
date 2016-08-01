class Purchase < ActiveRecord::Base
	after_create :email_purchaser, :email_seller

	private

	def email_purchaser
		PurchaseMailer.purchase_receipt(self).deliver
	end

	def email_seller
		PurchaseMailer.purchase_notification(self).deliver
	end
end
