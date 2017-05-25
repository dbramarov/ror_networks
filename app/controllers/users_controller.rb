class UsersController < ApplicationController
  before_action :require_login, except: [:index, :login, :register]
  def index
  end

  def login
  	@user = User.find_by(email: params[:Email]).try(:authenticate, params[:Password])
  	if @user
  		session[:user_id] = @user.id
  		redirect_to "/professional_profile"
  	else 
  		flash[:errors] = ["Invalid Combination"]
  		redirect_to :back
  	end  
  end

  def register
  	@user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], description: params[:description])
  	if @user.valid? 
   		session[:user_id] = @user.id
  		redirect_to "/professional_profile"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to :back
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def logout
  	session.clear
  	redirect_to '/main'
  end
end
