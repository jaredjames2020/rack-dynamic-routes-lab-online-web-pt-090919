require 'pry'
class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_request = req.path.split("/").last
      item = @@items.detect{|i| i.name == item_request}
          if item 
            resp.write "#{item.price}"
          else  
          resp.write "Item not found"
          resp.status = 400
        end
    else
        resp.write "Route not found"
        resp.status = 404
    end
    
    resp.finish
  end
end