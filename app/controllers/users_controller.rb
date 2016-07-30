class UsersController < ApplicationController
	before_action :allowed_to_view, except: [:userapproved]

	def show
		@user = User.find(params[:id])
	end

	def userapproved
		@user = User.find(params[:id])
		@pieces = @user.pieces.where(status: 1)
	end

	def userrequests
		@user = User.find(params[:id])
		@pieces = @user.pieces.where(status: 2)
	end

	def userbought
		@user = User.find(params[:id])
		@pieces = @user.pieces.where(status: 3)
	end



	private

		def allowed_to_view
	      return if admin_user_signed_in? or current_user == @user
	     	redirect_to userapproved_user_path, notice: "Access Denied! Not authorized to view this page."
	   end
	
end