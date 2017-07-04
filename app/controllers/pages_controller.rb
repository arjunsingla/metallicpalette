class PagesController < ApplicationController
	def home
		@pieces = Piece.all
	end

	def aboutus
	end

	def contactus
	end

	def faqs
	end

	def termsandconditions
	end

	def gettingstarted
	end
end

