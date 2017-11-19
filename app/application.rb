class Application

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      item_searched = req.path.split("/items/").last
      if @@items.find{|item| item.name == item_searched}
        item =  @@items.find{|item| item.name == item_searched}
        resp.write item.price
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
end # => End CLass
