# frozen_string_literal: true

require_relative 'lib/linked_list'
require_relative 'lib/node'

test_list = LinkedList.new
test_list.append('Jason')
test_list.append('Jen')
test_list.append('Jerry')
test_list.prepend('Helen')
test_list.append('Johnny')
puts test_list
puts "list size: #{test_list.size}"
puts "contains Johnny?: #{test_list.contains?('Johnny')}"
puts "contains Zephyr?: #{test_list.contains?('Zephyr')}"
# puts test_list.head
# puts test_list.tail
# puts test_list.at(4)
# puts test_list.at(1)
test_list.pop
puts test_list
puts "list size: #{test_list.size}"
# puts test_list.contains?('Johnny')
p "Jen is at: #{test_list.find('Jen')}"
p "Joseph is at: #{test_list.find('Joseph')}"
test_list.insert_at('Mel', 3)
puts test_list
test_list.remove_at(2)
puts test_list
