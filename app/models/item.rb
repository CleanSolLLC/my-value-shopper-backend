class Item < ApplicationRecord
  belongs_to :list

  def self.call_api(string)
 
    require 'net/http'
    require 'openssl'
    require 'uri'
  
      url_base = "https://amazon24.p.rapidapi.com/api/product/"
      url_aisn = string
      url_country = "?country=US"
      url_string = url_first + url_base + url_aisn + url_country
  
      url = URI(url_string)
      
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-host"] = ENV['AMAZON_HOST']
      request["x-rapidapi-key"]  = ENV['AMAZON_KEY']
  
      response = http.request(request)
      JSON.parse(response.read_body)
      #ans = JSON.parse(response.read_body)
      #ans["answer"]
  end

end
