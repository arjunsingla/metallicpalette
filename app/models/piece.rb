class Piece < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates :title, presence: true
	validates :image, presence: true
	validates :medium, presence: true
	validates :size, presence: true
	validates :artist_cut, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0.5, less_than: 798867.92 }
	validates :total_price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0.93, less_than: 999999.99}
	validate :total_price_validation
	validates :description, presence: true


	def total_price_validation
		return if self.total_price.nil?
		return if self.artist_cut.nil?
		return if self.total_price.to_f.nan?
		return if self.artist_cut.to_f.nan?
		return if (self.total_price - (((((self.artist_cut*1.1)/(1-0.095))+0.3)/(1-0.029))*100).ceil/100.0).abs <= 0.02
		errors.add(:base, "Prices can't be hacked")
	end

	def total_price_in_cents
		(self.total_price * 100).to_i
	end

	def stripe_fee
		round(self.total_price * 0.029 + 0.3)
	end

	def taxes
		round((self.total_price-self.stripe_fee)* 0.095)
	end

	def our_cut
		round(artist_cut * 0.1)
	end

	def round(x)
		(x*100).round/100.0
	end

end
