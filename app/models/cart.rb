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
    contents.map { |k,v| Item.find(k.to_i).price * v }.reduce(:+)
  end

  def subtract_item(id)
    contents[id.to_s] = contents[id.to_s] - 1
    contents.delete(id) if contents[id] == 0
  end
end
