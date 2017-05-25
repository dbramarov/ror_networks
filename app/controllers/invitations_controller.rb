class InvitationsController < ApplicationController
		before_action :require_login
  def create
  	user = User.find(session[:user_id])
  	Invitation.create(user_id: user.id, inviter_id: params[:id])
  	flash[:success] = 'Invitation Sent!'
    redirect_to :back
  end

  def destroy
  	Invitation.find_by(user_id: params[:id]).destroy
    redirect_to :back
  end
end
