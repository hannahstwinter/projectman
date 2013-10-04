class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      flash[:notice] = "You're signed in."
      redirect_to root_path
    elsif user && !user.authenticate(params[:password])
      flash[:alert] = "Invalid password."
      redirect_to signin_path
    else
      flash[:alert] = "Invalid email."
      redirect_to signin_path
    end
  end
  def destroy
    cookies.delete(:auth_token)
    flash[:notice] = "You're signed out."
    redirect_to root_path
  end
end