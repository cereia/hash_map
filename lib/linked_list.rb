# frozen_string_literal: true

# linked list data structure class
class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    elsif @tail.nil?
      @tail = new_node
      @head.next_node = @tail
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def to_s
    curr = @head
    str = ''
    until curr.nil?
      str += "#{curr} -> "
      curr = curr.next_node
    end
    str += 'nil' if curr.nil?
    str
  end
end
