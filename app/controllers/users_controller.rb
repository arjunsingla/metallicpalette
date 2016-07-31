class UsersController < ApplicationController
	before_action :set_user
	before_action :allowed_to_view, except: [:userapproved]

	def show
	end

	def userapproved
		@pieces = @user.pieces.where(status: 1)
	end

	def userrequests
		@pieces = @user.pieces.where(status: 2)
	end

	def userbought
		@pieces = @user.pieces.where(status: 3)
	end


	private
		def set_user
      	@user = User.find(params[:id])
    	end

		def allowed_to_view
	      return if admin_user_signed_in? or current_user == @user
	     	redirect_to userapproved_user_path, notice: "Access Denied! Not authorized to view this page."
	   end
	
end