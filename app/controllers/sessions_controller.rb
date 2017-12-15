class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(username: params[:session][:username])
  	if @user && @user.authenticate(params[:session][:password])
  		session[:user_id] = @user.id
  		redirect_to root_path, notice: "Loged in!"
  	else
      flash[:notice] = "Invalid username or password!"
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end