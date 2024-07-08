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
puts test_list.size
puts test_list.head
puts test_list.tail
puts test_list.at(4)
puts test_list.at(1)
