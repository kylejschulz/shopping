require 'date'
class Market
  attr_reader :name,
              :vendors,
              :date
  def initialize(name)
    @name = name
    @vendors = []
    @date = (Time.now).strftime("%m/%d/%Y")
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
        if hash[item].nil?
          hash[item] = Hash.new
        end
        if hash[item][:quantity].nil?
          hash[item][:quantity] = quantity
        else
          hash[item][:quantity] += quantity
        end
        if hash[item][:vendors].nil?
          hash[item][:vendors] = [vendor]
        else
          hash[item][:vendors] << vendor
        end
      end
    end
  hash
  end

  def sorted_list
    items.map do |item|
      item.name
    end.sort
  end

  def overstocked_items
    over_stocked = []
    total_inventory.each do |item, qv|
      over_stocked << item if qv[:quantity] > 50 && qv[:vendors].length > 1
    end
    over_stocked
  end

  # def sell(item, quantity)
  #   sale_item = total_inventory.select do |k, v|
  #     k == item
  #   end
  #   if sale_item.value[:quantity] < quantity
  #     false
  #   else
  #
  #
  # end
end
