require 'pry'
class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    # if req.path.match(/items/)
    #   item_name = req.path.split("/").last
    #   item = @@items.detect{|i| i.name == item_name}
    #   if item
    #     resp.write item.price
    #   else
    #     resp.write "Item not found"
    #     resp.status = 400
    
    if req.path.match(/items/)
      binding.pry
      item_request = req.path.split("/").last
        @@items.detect{|i| i.name == item_name}
        if @@items.include?(item_request)
          resp.write "#{item_request.price}"
        else
        resp.write "Route not found"
        resp.status = 400
        end
    else
        resp.write "Route not found"
        resp.status = 404
    end
    
    resp.finish
  end
end