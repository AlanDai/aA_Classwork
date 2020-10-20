class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true
    true
  end

  def remove(num)
    raise "Out of bounds" unless is_valid?(num)
    raise "Num not in set" unless store[num]
    @store[num] = false
  end

  def include?(num)
    raise "Out of bounds" unless is_valid?(num)
    return store[num]
  end

  private

  def is_valid?(num)
    return num < @store.length && num >= 0
  end

  def validate!(num)
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless include?(num)
  end

  def remove(num)
    self[num].delete(num) if include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet < IntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    super
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets
    (self[num] << num; @count += 1) unless include?(num)
  end

  def remove(num)
    (self[num].delete(num); @count -= 1) if include?(num)
  end

  private

  def resize!
    @store, temp = Array.new(num_buckets * 2) { Array.new }, @store
    @count = 0
    temp.each { |bucket| bucket.each { |ele| insert(ele) } }
  end
end
