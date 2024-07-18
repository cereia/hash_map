# frozen_string_literal: true

# linked list data structure class
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(key, value)
    new_node = Node.new(key, value)
    @head = new_node if @head.nil?
    @tail.next_node = new_node unless @tail.nil?
    @tail = new_node
  end

  def prepend(key, value)
    @head = Node.new(key, value, @head)
    @tail = Node.new(key, value) if @tail.nil?
  end

  def size
    node = @head
    nodes = 0
    until node.nil?
      nodes += 1
      node = node.next_node
    end
    nodes
  end

  def at(index)
    node = @head
    i = 0
    return 'Out of range' if index > size - 1 || index.negative?

    while i < index
      node = node.next_node
      i += 1
    end
    node if i == index
  end

  def pop
    @tail = at(size - 2)
    @tail.next_node = nil
  end

  def contains?(key)
    index = find(key)
    index.nil? ? false : true
  end

  def find(key, node = @head)
    return nil if node.nil?

    return node if node.key == key

    return nil if node == @tail

    find(key, node.next_node)
  end

  def insert_at(key, value, index)
    if index.zero?
      @head = Node.new(key, value, @head)
      @tail = Node.new(key, value) if @tail.nil?
    elsif index > size - 1 || index.negative?
      puts 'Index is out of range'
    else
      prev_node = at(index - 1)
      new_node = Node.new(key, value, at(index))
      prev_node.next_node = new_node
    end
  end

  def remove(key)
    @head.key == key ? remove_at(0) : remove_at(find_index(key))
  end

  def find_index(key, index = 0, node = @head)
    return nil if node.nil?
    return index if node.key == key

    find_index(key, index + 1, node.next_node)
  end

  def remove_at(index)
    return puts 'Index is out of range' if index > size - 1 || index.negative?
    return @head = @head.next_node if index.zero?

    prev_node = at(index - 1)
    @tail = prev_node if at(index) == @tail
    node_to_remove = at(index)
    prev_node.next_node = node_to_remove.next_node
  end

  def each
    node = @head

    while node
      yield(node)
      node = node.next_node
    end
  end

  def to_s
    node = @head
    str = ''
    until node.nil?
      str += "#{node} -> "
      node = node.next_node
    end
    str += 'nil' if node.nil?
    str
  end
end
