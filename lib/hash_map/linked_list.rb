# frozen_string_literal: true

# linked list data structure class
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    # add new node to the end of the list as the last item
    new_node = Node.new(value)
    # if head is nil, append makes the value the head
    @head = new_node if @head.nil?
    # if tail is not nil, the old tail's next node is the new node
    @tail.next_node = new_node unless @tail.nil?
    @tail = new_node
  end

  def prepend(value)
    # add new node to the front of the list as the first item
    @head = Node.new(value, @head)
    @tail = Node.new(value) if @tail.nil?
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
    if index.zero?
      @head = Node.new(value, @head)
      @tail = Node.new(value) if @tail.nil?
    elsif index > size - 1 || index.negative?
      puts 'Index is out of range'
    else
      prev_node = at(index - 1)
      new_node = Node.new(value, at(index))
      prev_node.next_node = new_node
    end
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
