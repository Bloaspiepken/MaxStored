class  SessionsController < ApplicationController
  
  def new
  
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    flash[:success] = "U bent succesvol ingelogd"
    redirect_to user_path(user)
    else
    flash.now[:danger] = "Er is iets mis met uw login informatie"
    render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "U bent uitgelogd"
    redirect_to root_path
  end
  
end