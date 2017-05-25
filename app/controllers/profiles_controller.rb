class ProfilesController < ApplicationController
	before_action :require_login
  def index
  	@user = User.find(session[:user_id])
  	@invitations = Invitation.where(inviter_id: @user.id)
  	@networks = Network.where(friend_id: @user.id)
  end
  def users
  	@user = User.find(session[:user_id])
  	@users = User.all 
    @networks = Network.where(friend_id: session[:user_id])
    @invitation = Invitation.find_by(inviter_id: @user.id)
  end
end
