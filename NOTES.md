Models

List - has_many :items 
  name:string



Items  belongs_to :list 
  list_id:integer,
  name:string,
  description:string
  product_rating
  image_url:string
  product_url:string
  retailer_rating:string
  price:float 
