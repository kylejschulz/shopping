class Item
  attr_reader :name,
              :price
  def initialize(args)
    @name = args[:name]
    @price = args[:price][1..-1].to_f
  end

  # def price_int
  #   @price[1..-1].to_i
  # end
end
