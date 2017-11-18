 class Application

   def call(env)
     resp = Rack::Response.new
     req = Rack::Request.new(env)

     if req.path.match(/item/)
       item = req.path.split('/items/').last
       item_names = @@items.map { |item| item.name  }
       if item_names.include?(item)
         item_obj = @@items.find {|item| item.name = item}
         resp.write item_obj.price
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
