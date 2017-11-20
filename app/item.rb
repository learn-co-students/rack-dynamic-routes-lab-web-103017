class Item
  attr_accessor :name, :price
  @@item = []

  def self.item
    @@item
  end


  def initialize(name,price)
    @name = name
    @price = price
    @@item << self
  end
end
