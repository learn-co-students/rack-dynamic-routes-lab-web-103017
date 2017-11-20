
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      search = Item.item.find do |i| i.name == item_name
      end
      if search == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write search.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish



  end


end
