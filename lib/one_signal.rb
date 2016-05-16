class OneSignal
  def self.notify
    params = {"app_id" => "5dd20622-2e31-4994-abe0-9899e34bdb1a", 
              "contents" => {"en" => "English Message"},
              "included_segments" => ["All"]}

    uri = URI.parse('https://onesignal.com/api/v1/notifications')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path,
                                  'Content-Type'  => 'application/json',
                                  'Authorization' => "Basic ZDQ3MmRhMjUtYTQ4OS00ZDg3LWJlYjgtMDg3NWI5OWU0ZjE4")
    request.body = params.as_json.to_json
    response = http.request(request)
    response.body
  end
end