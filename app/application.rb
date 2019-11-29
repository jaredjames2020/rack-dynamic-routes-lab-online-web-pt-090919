class Application
  
  @@items = []
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path=="/items/#{items.name}"
      resp.write "#{items.name}"
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end