class Application
 
  @@item = [Song.new("Sorry", "Justin Bieber"),
            Song.new("Hello","Adele")]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    @@songs.each do |song|
      resp.write "#{song.title}\n"
    end
 
    resp.finish
  end
end