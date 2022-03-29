class Set
  def initialize
    @elements = {}
  end

  def items
    @elements.keys
  end

  def add(item)
    @elements[item] = true
  end

  def is_empty?
    @elements.size == 0
  end

  def remove(item)
    @elements.delete(item)
  end
end

set = Set.new
set.add(1)
set.add(2)
set.add(3)
set.add(2)
set.add(2)
puts set.is_empty?
puts set.items.to_s
set.remove(1)
set.remove(2)
puts set.is_empty?
puts set.items
set.remove(3)
puts set.is_empty?
puts set.items