Models

Category - has_many :items 
  name:string



Items  belongs_to :category
bigint "category_id"
string "product_title"
string "product_detail_url"
string "app_sale_price"
string "currency"
string "ASIN"
string "Customer_Reviews"
string "Best_Sellers_Rank"
string "available_quantity"

Amazon Api 
Searching by Product
GET /api/product/{productId}
Ruby Code

require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://amazon24.p.rapidapi.com/api/product/B09193Z3B3?country=US")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = ENV['AMAZON_HOST']
request["x-rapidapi-key"]  = ENV['AMAZON_KEY']

response = http.request(request)
puts response.read_body

Output
{25 items
"modificationDate":"2021-10-24T15:39:37.377Z"
"product_small_image_urls":[8 items
0:"https://m.media-amazon.com/images/I/518x4xudGkL._AC_US40_.jpg"
1:"https://m.media-amazon.com/images/I/518j-38WuKL._AC_US40_.jpg"
2:"https://m.media-amazon.com/images/I/51DJDZgT6BL._AC_US40_.jpg"
3:"https://m.media-amazon.com/images/I/510qpyBCtxL._AC_US40_.jpg"
4:"https://m.media-amazon.com/images/I/51TWXrJUl9L._AC_US40_.jpg"
5:"https://m.media-amazon.com/images/I/51wFGnAVapL._AC_US40_.jpg"
6:"https://m.media-amazon.com/images/I/51xVHsrrrpL._SS40_BG85,85,85_BR-120_PKdp-play-icon-overlay__.jpg"
7:"https://images-na.ssl-images-amazon.com/images/G/01/x-locale/common/transparent-pixel._V192234675_.gif"
]
"product_information_html":[...]1 item
"feature_bullets":[...]6 items
"_id":"618533603b9e96001359dd8b"
"variantAsin":{...}2 items
"variantImages":{...}2 items
"isPrime":false
"product_id":"B09193Z3B3"
"product_title":"Facelle Kitchen Stand Mixer, 660W 6-Speed Tilt-Head mixers kitchen electric stand mixer with 6 QT Stainless Steel Bowl, Dough Hook, Flat Beater, Wire Whip, Splash Guard, for Baking,Cakes,Cookie(Blue)"
"product_detail_url":"https://www.amazon.com/dp/B09193Z3B3"
"app_sale_price":99.99
"currency":"$"
"product_overview":{8 items
"Brand":"Facelle"
"Color":"Blue"
"Material":"Stainless Steel"
"Wattage":"1500 watt_hours"
"Voltage":"220 Volts (AC)"
"Item_Dimensions_LxWxH":"16.53 x 10.47 x 14 inches"
"Number_of_Speeds":"6"
"Is_Dishwasher_Safe":"Yes"
}
"product_details":{7 items
"Product_Dimensions":"16.53 x 10.47 x 14 inches"
"Item_Weight":"12.72 pounds"
"ASIN":"B09193Z3B3"
"Item_model_number":"1519U"
"Customer_Reviews":"4.6 out of 5 stars302 ratings4.6 out of 5 stars"
"Best_Sellers_Rank":"#17,208 in Kitchen & Dining (See Top 100 in Kitchen & Dining)#34 in Household Stand Mixers"
"Date_First_Available":"May 27, 2021"
}
"product_main_image_url":"https://m.media-amazon.com/images/I/71mkEM7sIWL._AC_SL1500_.jpg"
"available_quantity":0
"breadcrumbs":[...]5 items
"country":"US"
"prices_history":[...]1 item
"quantities_history":[1 item
0:{...}3 items
]
"competitors_history":[]0 items
"sales_history":[]0 items
"reviews_history":[]0 items
"__v":0
}