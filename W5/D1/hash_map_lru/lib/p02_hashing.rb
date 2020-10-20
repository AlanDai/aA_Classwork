class Integer
  # Integer#hash already implemented for you
end

require "prime"

class Array
  # need to keep track of values and their respective indexes
  def hash
    self.each_with_index.inject(0) do |acc, (ele, idx)|
      ((ele.hash + idx.hash) * 1031) ^ acc
    end
  end
end

class String
  # converting characters to numeric values with index in mind
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.inject(0) do |acc, (k, v)|
      ((k.hash + v.hash) * 1031) ^ acc
    end
  end
end
