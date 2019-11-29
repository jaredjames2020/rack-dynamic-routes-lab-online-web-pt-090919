class Application
 
  @@item = [Song.new("Sorry", "Justin Bieber"),
            Song.new("Hello","Adele")]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path=="/items/#{item.name}"
      resp.write "#{item.name}"
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end