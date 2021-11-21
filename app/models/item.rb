class Item < ApplicationRecord
  belongs_to :category
  
  def self.call_api(string)
    require 'net/http'
    require 'openssl'
    require 'uri'
  
      url_base = "https://amazon24.p.rapidapi.com/api/product/"
      url_aisn = string
      url_country = "?country=US"
      url_string = url_base + url_aisn + url_country
  
      url = URI(url_string)
      
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-host"] = ENV['AMAZON_HOST']
      request["x-rapidapi-key"]  = ENV['AMAZON_KEY']
  
      response = http.request(request)
      JSON.parse(response.read_body)
  end

  def self.parse_data(data, category)
    item = Item.new
    item.product_title = data["product_title"]
    item.product_detail_url = data["product_detail_url"]
    item.currency = data["currency"]
    item.app_sale_price = data["app_sale_price"]
    item.available_quantity = data["available_quantity"]
    item.ASIN = data["product_details"]["ASIN"]
    item.Customer_Reviews = data["product_details"]["Customer_Reviews"]
    item.Best_Sellers_Rank = data["product_details"]["Best_Sellers_Rank"] 
  
    category.items << item
  end
end
