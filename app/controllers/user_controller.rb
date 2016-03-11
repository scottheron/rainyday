class UserController < ApplicationController

  def create
    if user_params == nil
      flash[:danger] = "Passwords don't match"
      redirect_to root_path
    else
      puts user_params
      user = User.create user_params
      if user.valid?
        session[:user_id] = user.id
        flash[:success] = 'User created and logged in'
        redirect_to root_path
      else
        messages = user.errors.map { |k, v| "#{k} #{v}" }
        flash[:danger] = messages.join(', ')
        redirect_to root_path
      end
    end
  end    

  private

  def user_params
    # password = params.require(:user).permit(:password).to_s
    # password_confirmation = params.require(:user).permit(:password_confirmation).to_s
    # puts password
    # puts password_confirmation
    # if password == password_confirmation
    #   puts 'here2'
      return params.require(:user).permit(:name, :email, :password)
    # else
    #   puts 'here1'

    #   return nil
    # end
  end  

  # def user_zip
  #   params.require(:zip)
  # end

    
end
