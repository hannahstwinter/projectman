class SignupsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You're signed up."
      redirect_to :root
    else
      flash[:alert] = "There was a problem."
      redirect_to :signup
    end
  end
end