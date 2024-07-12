# frozen_string_literal: true

# a data structure that takes a key value pair, produces a hash code, and stores the pair in a bucket
class HashMap
  def initialize
    @capacity = 16
    @buckets = Array.new(@capacity)
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def count_full_buckets
    # remove all buckets that are nil and count the full buckets
    @buckets.reject(&:nil?).count
  end

  def set(key, value)
    hash_key = hash(key)

    # if the bucket doesn't exist, make a new linked list and append the key value pair
    if @buckets[hash_key].nil?
      @buckets[hash_key] = LinkedList.new
      @buckets[hash_key].append(key, value)
    else
      # if you can find the key in the existing entries, set that value to new value
      # else, just append the new key value pair
      entry = @buckets[hash_key].find(key)
      entry ? entry.value = value : @buckets[hash_key].append(key, value)
    end
  end

  def get(key)
    hash_key = hash(key)
    !@buckets[hash_key]&.find(key).nil? ? @buckets[hash_key].find(key) : nil
  end

  def has?(key)
    present = get(key)
    present ? true : false
  end

  # def grow_buckets
  #   @capacity *= 2
  #   @new_buckets = Array.new(@capacity)

  # end

  #   raise IndexError if index.negative? || index >= @buckets.length
end
