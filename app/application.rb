class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      match = @@items.select{|itm| itm.name == item}
        if match.count > 0
          resp.write match.first.price
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
