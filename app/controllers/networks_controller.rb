class NetworksController < ApplicationController
		before_action :require_login
  def create
  	user = User.find(session[:user_id])
  	Network.create(user_id: params[:user_id], friend_id: user.id)
    Invitation.find(params[:invitation_id]).destroy
    redirect_to :back
  end
end
