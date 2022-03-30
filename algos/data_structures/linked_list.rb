# frozen_string_literal: true

# Implementation for a LinkedList in Ruby
class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      find_tail.next_node = Node.new(value)
    end
  end

  def append_at(target, value)
    current = @head
    (target - 1).times { current = current.next_node }

    new_node           = Node.new(value)
    new_node.next_node = current.next_node
    current.next_node  = new_node
  end

  def append_after(target_value, value)
    current = @head

    while !current.next_node.nil? && current.value != target_value
      current = current.next_node
    end

    new_node           = Node.new(value)
    new_node.next_node = current.next_node
    current.next_node  = new_node
  end

  def delete_value(target_value)
    if @head.value == target_value
      @head = @head.next_node
      return
    end

    current = @head

    while !current.next_node.nil? && current.next_node.value != target_value
      current = current.next_node
    end

    return if current.nil? || current.next_node.nil?

    current.next_node = current.next_node.next_node
  end

  def find_tail
    current = @head
    current = current.next_node until current.next_node.nil?
    current
  end

  def print
    node = @head
    puts node.to_s
    while (node = node.next_node)
      puts node.to_s
    end
  end
end

# Helper class for node
class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
  end

  def to_s
    value
  end
end

llist = LinkedList.new
llist.append(3)
llist.append(4)
llist.append(5)
llist.append(6)

llist.append_at(2, 8)
llist.append_after(8, 9)
llist.delete_value(6)
llist.delete_value(3)

llist.print
