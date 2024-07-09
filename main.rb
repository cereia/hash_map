# frozen_string_literal: true

require_relative 'lib/linked_list'
require_relative 'lib/node'

test_list = LinkedList.new
test_list.append('item1')
test_list.append('item2')
test_list.append('item3')
test_list.prepend('item4')
test_list.append('item5')
puts "list after append/prepend #{test_list}"
puts "list size: #{test_list.size}"
puts "contains item5?: #{test_list.contains?('item5')}"
puts "contains item6?: #{test_list.contains?('item6')}"
puts "head: #{test_list.head}"
puts "tail: #{test_list.tail}"
puts "at 4: #{test_list.at(4)}"
puts "at 1 #{test_list.at(1)}"
puts "at 8: #{test_list.at(8)}"
test_list.pop
puts "list after pop #{test_list}"
puts "list size: #{test_list.size}"
# puts test_list.contains?('item5')
p "item3 is at: #{test_list.find('item3')}"
p "item9 is at: #{test_list.find('item9')}"
test_list.insert_at('item7', 3)
puts "list after insert at 3: #{test_list}"
test_list.remove_at(2)
puts "list after remove at 2: #{test_list}"
