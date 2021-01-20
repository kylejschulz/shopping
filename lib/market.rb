class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def items
    items = @vendors.flat_map do |vendor|
      vendor.inventory.keys
    end
    items.uniq
  end

  def total_inventory
    hash = Hash.new
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        # if hash[item][:quantity].nil?
        #   hash[item][:quantity] = 0
        # end
        # if hash[item][:vendors].nil?
        #   hash[item][:vendors] = []
    hash[item] = {
                  quantity: 0,
                  vendors: []
                  }
                  hash[item] += quantity
                  hash[item] << vendor



    end

  end
end
