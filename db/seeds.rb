# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


category = Category.create(name: "Appliances")

item = Item.new(product_title: "Facelle Kitchen Stand Mixer, 660W 6-Speed", product_detail_url: "https://www.amazon.com/dp/B09193Z3B3", app_sale_price: 99.99, currency:"$", ASIN: "B09193Z3B3", Customer_Reviews: "4.6 out of 5 stars302 ratings4.6 out of 5 stars", Best_Sellers_Rank: "#17,208 in Kitchen & Dining (See Top 100 in Kitchen & Dining)#34 in Household Stand Mixers", available_quantity: 0)

user = User.create(username: "Mark", email: "mark@abc123.com", password: "password")


