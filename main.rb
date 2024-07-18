# frozen_string_literal: true

require_relative 'lib/hash_map'
require_relative 'lib/hash_map/linked_list'
require_relative 'lib/hash_map/node'

test = HashMap.new
test.set('apple', 'red')
# test.set('banana', 'yellow')
# test.set('carrot', 'orange')
# test.set('dog', 'brown')
# test.set('elephant', 'gray')
# test.set('frog', 'green')
# test.set('grape', 'purple')
# test.set('hat', 'black')
# test.set('ice cream', 'white')
# test.set('jacket', 'blue')
# test.set('pplea', 'pink')
# test.set('kite', 'pink')
# test.set('lion', 'golden')
# puts test.get('apple')
# p test.get('oreo')
# puts test.has?('apple')
# puts test.has?('oreo')
p "remove apple: #{test.remove('apple')}"
p "remove oreo: #{test.remove('oreo')}"
puts "get apple: #{test.get('apple')}"
puts "test #{test}"

# list = LinkedList.new
# list.append('test', 'val')
# list.append('haha', 'boo')
# list.append('oop', '234')
# list.append('wow', 'heh')
# puts list
# list.remove('oop')
# puts list
