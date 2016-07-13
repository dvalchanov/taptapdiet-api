class Api::V1::UsersController < Api::BaseController

  skip_before_action :authenticate!, :if => Proc.new { |c| c.request.format == 'application/json' }

  def create
    @user, new_record = User.create_from_facebook!(create_params)
    @user.access_tokens.create!

    status = new_record ? :created : :ok
    render status: status

  end

  def create_params
    params.require(:user).permit(
      :fb_user_id,
      :fb_token,
      :time_zone,
      :fb_token_expiration_date,
      :user_name
    )
  end
end