class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      if Item.all.find{|x| x.name ==item}
        resp.write Item.all.find{|x| x.name ==item}.price
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
