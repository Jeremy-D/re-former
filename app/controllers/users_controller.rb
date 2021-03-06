class UsersController < ApplicationController
	def new
		@user = User.new()
	end

	def index
		@users = User.all
	end

	def create
		#@user = User.new(username: params[:username], email: params[:email], password: params[:password])
		@user = User.new(whitelisted_post_params)
		if @user.save
			redirect_to new_user_path
		else
			render :index
		end
	end

	private

	def whitelisted_post_params
		params.require(:user).permit(:username, :email, :password)
	end

end
