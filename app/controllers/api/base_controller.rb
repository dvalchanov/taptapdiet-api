class Api::BaseController < ApplicationController
	BEARER = 'Bearer'.freeze

	before_action :authenticate!

	private

		def authenticate!
			return if current_user.present?
			render json: { error: 'UNAUTHORIZED', code: 401 }, status: :unauthorized
		end

		

		def current_user
			@current_user.presence || authenticate_with_auth_token
		end

		def authenticate_with_auth_token
	    authorization = request.headers.fetch('HTTP_AUTHORIZATION') { '' }
	    type, token = authorization.split(' ')
	    return if type != BEARER
	    access_token = AccessToken.find_by(token: token)
	    return if access_token.blank? || access_token.expired?
	    @current_user = access_token.user
		end
end