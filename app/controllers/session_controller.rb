# Sessions controller manages the user sessions and provides feedback via flash messages. 
class SessionController < ApplicationController
	def new
	end
	def create
		user = User.authenticate(user_params[:email], user_params[:password])
		if user
			session[:user_id] = user.id
			flash[:success] = "You are now logged in."
			redirect_to profile_path
		else
			flash[:danger] = "Email and/or password invalid."
			redirect_to root_path
		end	
	end
	def destroy
		session[:user_id] = nil
		flash[:success] = "You are now logged out."
		redirect_to root_path
	end
	private
	def user_params
		params.require(:user).permit(:email, :password)
	end
end
