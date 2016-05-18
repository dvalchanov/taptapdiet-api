module SpecSupport
  module API
    def json
      return @json if @json.present?

      @json = JSON.parse(response_body)

      if @json.is_a?(Array)
        @json = @json.map(&:deep_symbolize_keys)
      else
        @json.deep_symbolize_keys!
      end
    end

    def request_with_user_id_auth
      header 'X-API-TOKEN', current_user.id
      send_request(params)
    end

    def request_with_auth(params = {})
      send_request(params, access_token.token)
    end

    def request_without_auth(params = {})
      send_request(params)
    end

    def current_user
      @current_user ||= create :user
    end

    def day
      @day ||= current_user.days.create!
    end

    def access_token
      @access_token ||= current_user.access_tokens.create!
    end

    def send_request(params, token = nil)
      @json = nil
      define_headers(token)
      do_request(params)
    end

    def define_headers(token = nil)
      header 'Accept', 'application/json'
      header 'Authorization', "Bearer #{ token }" if token.present?
    end
  end
end
