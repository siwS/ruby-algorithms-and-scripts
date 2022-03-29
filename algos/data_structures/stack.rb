class Stack

  class StackFullError < StandardError
  end

  def initialize(size)
    @elements = []
    @size = size
  end

  def push(item)
    raise StackFullError if @elements.size == @size
    @elements << item
  end

  def pop
    element = @elements.last
    @elements.delete_at(@elements.size - 1)
    element
  end

  def size
    @elements.size
  end

  def is_empty?
    @elements.size == 0
  end

  def is_full?
    @elements.size == @size
  end
end

stack = Stack.new(4)
stack.push(1)
stack.push(2)
stack.push(3)
puts stack.pop
puts stack.is_empty?
puts stack.pop
puts stack.is_empty?
puts stack.pop
puts stack.is_empty?
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)
