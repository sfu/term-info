module Canvas
  module Server
    extend self

    def server
      "https://canvas.sfu.ca"      
    end

    def parse_json(url)
      uri = URI.parse url
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true 
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request request
      JSON.parse response.body
    end

  end

end
