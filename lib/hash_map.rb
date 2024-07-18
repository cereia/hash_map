# frozen_string_literal: true

# a data structure that takes a key value pair, produces a hash code, and stores the pair in a bucket
class HashMap
  INITIAL_CAPACITY = 16

  def initialize
    @capacity = INITIAL_CAPACITY
    @buckets = Array.new(@capacity)
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    index = hash_index(key)
    grow_buckets if full_capacity?

    # if the bucket doesn't exist, make a new linked list and append the key value pair
    if @buckets[index].nil?
      @buckets[index] = LinkedList.new
      @buckets[index].append(key, value)
    else
      # if you can find the key in the existing entries, set that value to new value
      # else, just append the new key value pair
      entry = @buckets[index].find(key)
      entry ? entry.value = value : @buckets[index].append(key, value)
    end
  end

  def get(key)
    index = hash_index(key)
    !@buckets[index]&.find(key).nil? ? @buckets[index].find(key) : nil
  end

  def has?(key)
    present = get(key)
    present ? true : false
  end

  def remove(key)
    index = hash_index(key)

    return nil unless has?(key)

    value = @buckets[index].find(key).value
    @buckets[index].remove(key)
    value
  end

  def length
    keys.count
  end

  def clear
    @buckets = Array.new(INITIAL_CAPACITY)
  end

  def keys
    entries.map(&:first)
  end

  def values
    entries.map(&:last)
  end

  # use entries to write keys and values methods
  def entries
    @buckets.each_with_object([]) do |bucket, array|
      next unless bucket

      bucket.each { |entry| array << [entry.key, entry.value] }
    end
  end

  private

  def grow_buckets
    puts 'Buckets are growing...'
    @capacity *= 2
    saved_entries = entries
    @buckets = Array.new(@capacity)
    saved_entries.each { |key, value| set(key, value) }
  end

  def hash_index(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length

    index
  end

  def full_capacity?
    length >= @capacity * @load_factor
  end

  def to_s
    @buckets.each { |bucket| puts bucket unless bucket.nil? }
  end
end
