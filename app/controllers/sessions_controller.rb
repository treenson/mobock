class SessionsController < ApplicationController
	def index
	end
	def new
		
	end
	def create
		user = User.find_by_name(params[:name])
		if user && user.authenticate(params[:password])
			session[:current_user_id] = user.id
			redirect_to root_url, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end
	
	def destroy
		session[:current_user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end

end
