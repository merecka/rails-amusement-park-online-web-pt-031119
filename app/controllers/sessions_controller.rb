class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
  
    @user = User.find_by(name: params[:user_name])
    if @user
    	return head(:forbidden) unless @user.authenticate(params[:password])
    	session[:user_id] = @user.id
    	redirect_to user_path(@user)
    else
    	redirect_to '/signin'
    end
  end

  def signin

  end

  def destroy
    session.clear
    redirect_to '/'
  end


end