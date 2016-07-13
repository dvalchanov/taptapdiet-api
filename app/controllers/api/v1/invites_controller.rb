class Api::V1::InvitesController < Api::BaseController
  def create
    @invite = UserMailer.user_invite(current_user, params[:email]).deliver_later
  end
end