class UsersController < ApplicationController
	
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

	
end