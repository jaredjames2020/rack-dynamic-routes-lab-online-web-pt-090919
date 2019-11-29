require 'pry'
class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    @@items = []
    
    if req.path=="/items/"
      search_term = req.params["item"]
        if @@items.include?(search_term)
          resp.write "#{search_term.price}"
        else
        resp.write "Route not found"
        resp.status = 404
        end
    end
    
    resp.finish
  end
end