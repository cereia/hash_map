# frozen_string_literal: true

# linked list data structure class
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    # check if head is empty
    # - if it is, set this value as the head
    # - if it's not, set this value as the next node of the current tail
    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end
    # set tail to the new node
    # head and tail are the same node when there's only 1 element in the list
    @tail = new_node
  end

  def prepend(value)
    # check if head is nil or not
    #   - set value as the head if it is
    #   - set value as the new head and old head as the next node
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

  def at(index)
    curr = @head
    i = 0
    return 'Out of range' if index > size - 1 || index.negative?

    while i < index
      curr = curr.next_node
      i += 1
    end
    curr if i == index
  end

  def pop
    # size - 2 is the new last node because index starts at 0, so old tail is at size - 1
    @tail = at(size - 2)
    @tail.next_node = nil
  end

  def contains?(value)
    index = find(value)
    index.nil? ? false : true
  end

  def find(value)
    curr = @head
    i = 0

    until curr.nil?
      return i if curr.value == value

      curr = curr.next_node
      i += 1
    end
    nil if curr.nil?
  end

  def insert_at(value, index)
    return puts 'Index is out of range' if index > size - 1 || index.negative?
    return @head = Node.new(value, @head) if index.zero?

    prev_node = at(index - 1)
    new_node = Node.new(value, at(index))
    prev_node.next_node = new_node
  end

  def remove_at(index)
    return puts 'Index is out of range' if index > size - 1 || index.negative?
    return @head = @head.next_node if index.zero?

    prev_node = at(index - 1)
    if at(index) == @tail
      @tail = prev_node
      @tail.next_node = nil
    else
      node_to_remove = at(index)
      prev_node.next_node = node_to_remove.next_node
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
