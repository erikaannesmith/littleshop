class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def add_item(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def count_of(id)
    contents[id.to_s].to_i
  end

  def total_price
    return 0 if contents.empty?
    contents.map { |k,v| Item.find(k.to_i).price * v }.reduce(:+)
  end

  def subtract_item(id)
    contents[id.to_s] = contents[id.to_s] - 1
    contents.delete(id) if contents[id] == 0
  end

  def remove_item(id)
    contents.delete(id)
  end

  def item_subtotal(id)
    item = Item.find(id)
    item.price * count_of(id)
  end

  def create_order_items(order)
    contents.each do |item_id, quantity|
      orderitem = OrderItems.create(order: order,
                        item_id: item_id,
                        historical_price: Item.find(item_id).price,
                        quantity: quantity)

      orderitem.update(inline_total: (orderitem.historical_price * orderitem.quantity))
    end
  end
end
