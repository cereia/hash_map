# frozen_string_literal: true

require_relative 'lib/hash_map'
require_relative 'lib/hash_map/linked_list'
require_relative 'lib/hash_map/node'

test = HashMap.new
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('moon', 'silver')
puts "get apple #{test.get('apple')}"
p test.get('oreo')
puts "has apple?: #{test.has?('apple')}"
puts "has oreo?: #{test.has?('oreo')}"
puts "remove apple: #{test.remove('apple')}"
p test.remove('oreo')
puts "get apple: #{test.get('apple')}"
puts "entries: #{test.entries}"
puts "keys: #{test.keys}"
puts "values: #{test.values}"
puts "length: #{test.length}"
puts "test: #{test}"
