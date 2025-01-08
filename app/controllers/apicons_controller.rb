class ApiconsController < ApplicationController

  def index
    require 'uri'
    require 'net/http'

    url =  URI("https://api.easybroker.com/v1/contacts")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["X-Authorization"] = 'f1iixdpnh7f6qxhozm10dwfb6p69rr'

    response = http.request(request)

    @data = JSON.parse(response.body)

    content = @data["content"]

    @content_hash = content.each_with_object({}) do |item, hash|
        hash[item["id"]] = item
    end

  end
end
