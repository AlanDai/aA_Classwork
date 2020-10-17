require 'set'

arr = [0, 1, 5, 7]

#O(n^2)
def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |num1, i1|
        arr.each_with_index do |num2, i2|
            if i2 > i1
                return true if num1 + num2 == target_sum
            end
        end
    end
    false
end

# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

#O(n^2) -> could be O(n * log n) if we wrote a custom binary search that searches between specified indices (to avoid splicing)



def okay_two_sum?(arr, target_sum)    
    arr.sort.each_with_index do |ele, i|
        return true if bin_search(arr, target_sum, 0, i-1) ||
                       bin_search(arr, target_sum, i+1, arr.length-1)
    end    
end

def bin_search(arr, target_value, start, finish)
    return false if start > finish

    mid = (start + finish)/2
    return true if arr[mid] == target_value
    
    target_value > arr[mid] ? 
        (return bin_search(arr, target_value, mid+1, finish)) : 
        (return bin_search(arr, target_value, start, mid-1))
end

p okay_two_sum?(arr, 1)
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 13)

arr1 = [0, 1, 5, 7]
p okay_two_sum?(arr1, 10) # => should be false

#O(n)
def two_sum?(arr, target_sum)
    hash = arr.inject(Hash.new(0)) {|acc, ele| acc[ele] += 1 ; acc }

    arr.each do |ele| 
        if ele == target_sum - ele
            return true if hash[ele] > 1
        else
            return true if hash[target_sum - ele] > 0
        end
    end
    false
end

# p two_sum?(arr, 1)
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 13)
# p two_sum?(arr, 10)