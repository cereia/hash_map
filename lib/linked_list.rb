# frozen_string_literal: true

# linked list data structure class
class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    # check if head is empty; if it is, set this value as the head
    if @head.nil?
      @head = new_node
      # check if tail is empty; this mean's there's no values other than head, so tail is next
    elsif @tail.nil?
      @tail = new_node
      @head.next_node = @tail
    else
      # have to set the old tail's next node to the new one to connect before setting new tail
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    # check if head is nil or not
    #   set value as the head if it is
    #   set value as the new head and old head as the next node
    @head = @head.nil? ? Node.new(value) : Node.new(value, @head)
  end

  def size
    curr = @head
    nodes = 0
    until curr.nil?
      nodes += 1
      curr = curr.next_node
    end
    nodes
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
