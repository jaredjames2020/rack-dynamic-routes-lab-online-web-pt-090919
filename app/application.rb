require 'pry'
class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    @@items = []
    
    if req.path=="/items/#{Item.name}"
      
      @@items.each do |item|
        binding.pry
      
      item_price = req.path.split("/items/")
      item = @@item.find{|i| i.price == item_price}
 
      resp.write item.price
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end