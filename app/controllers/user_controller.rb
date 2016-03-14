class UserController < ApplicationController
 before_action :is_authenticated?, except: [:new, :create]
  def new
    user = User.new
    zip = Zip.new
  end

  def show
  end

  def create
    puts user_params
    if user_params == nil
      flash[:danger] = "Passwords don't match"
      redirect_to root_path
    else
      user = User.create user_params
      zipcode = params[:zip][:code]
      lat = zipcode.to_lat
      lon = zipcode.to_lon
      new_zip = Zip.find_or_create_by(code: zipcode) do |z|
        z.lat = lat
        z.lng = lon
      end

      user.zip_id = new_zip.id
      user.save

      if user.valid?
        session[:user_id] = user.id
        flash[:success] = 'User created and logged in'
        redirect_to profile_path
      else
        messages = user.errors.map { |k, v| "#{k} #{v}" }
        flash[:danger] = "Something's wrong"
        redirect_to root_path
      end
    end
  end    

  private

  def zip_params
    user_code = params[:zip][:code]
    params.require(:zip).permit(:code)
  end

  def user_params
    password = params[:user][:password]
    password_confirmation = params[:user][:password_confirmation]
    if (password == password_confirmation)
      params.require(:user).permit(:name, :email, :password)
    else
      nil
    end
  end 
    
end
