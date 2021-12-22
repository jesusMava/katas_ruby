class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    collection do |item|
      item[:name]
    end.sort
  end

  def cheap
    @items.select { |price| price[:price] < 30.0 }
  end

  def out_of_stock
    @items.select { |q| q[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    hash = {}
    res = @items.select { |nam| nam[:name] == name }.select { |el| !el[:quantity_by_size].empty? }.map { |e| e[:quantity_by_size] }
    res.map { |e| hash = e }
    hash
  end

  def total_stock
    return 0 if @items == []
    collection do |item|
      item[:quantity_by_size].map { |_, v| v }
    end.flatten.sum
  end

  private

  attr_reader :items

  def collection
    @items.map do |item|
      yield item
    end
  end
end
