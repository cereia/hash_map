# frozen_string_literal: true

# linked list node class
class Node
  def initialize(data = nil, next_node = nil)
    @value = data
    @next_node = next_node
  end
end
