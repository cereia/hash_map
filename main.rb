# frozen_string_literal: true

require_relative 'lib/linked_list'
require_relative 'lib/node'

test_list = LinkedList.new
test_list.append('Jason')
test_list.append('Jen')
test_list.append('Jerry')
test_list.append('Helen')
puts test_list
