# frozen_string_literal: true

# a data structure that takes a key value pair, produces a hash code, and stores the pair in a bucket
class HashMap
  def initialize
    @buckets = Array.new(16)
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  #   raise IndexError if index.negative? || index >= @buckets.length
end
