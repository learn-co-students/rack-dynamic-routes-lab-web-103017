class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    # req =  Rack::Request.new
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = Item.all.find{|i| i.name == item_name}

      if item
        resp.write item.price
      else
        error_404(resp, "Item not found", 400)
      end
    else
      error_404(resp, "Route not found", 404)
    end

    resp.finish
  end

  def error_404(resp, message, status)
    resp.write "#{message}"
    resp.status = status
  end

end
