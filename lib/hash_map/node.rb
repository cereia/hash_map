# frozen_string_literal: true

# linked list node class
class Node
  attr_accessor :next_node, :key, :value

  def initialize(key, value, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end

  def to_s
    "[#{@key}, #{@value}]"
  end
end
