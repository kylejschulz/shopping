class Vendor
  attr_reader :name,
              :inventory
  def initialize(name )
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item].nil?
      @inventory[item] = 0
    end
    @inventory[item]
  end

  def stock(item, quantity)
    if @inventory[item].nil?
      @inventory[item] = 0
    end
    @inventory[item] += quantity
  end

  def potential_revenue
    sum = @inventory.sum do |item, quantity|
      item.price * quantity
    end
    sum
  end

end
