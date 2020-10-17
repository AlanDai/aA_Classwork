#my_min

#time complexity: O(n^2)
def my_min_slow(list)
    list.each do |ele1|
        smallest = true
        list.each do |ele2|
            smallest = false if ele1 > ele2
        end
        return ele1 if smallest
    end
end

#O(n)
def my_min_fast(list)
    list.inject(nil) {|acc, ele| acc == nil || ele < acc ? ele : acc } 
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_slow(list)  # =>  -5
p my_min_fast(list)

# ==============================================================================

#largest_contiguous_subsum

#time complexity: O(n^3)
def lcs_slow(list)
    sub_arr = []
    (0...list.length).each do |i|
        (i...list.length).each do |j|
            sub_arr << list[i..j]
        end
    end

    sub_arr.map(&:sum).max
end

#O(n)
def lcs_fast(list)
    sub_sum = list[0]
    largest_sub_sum = sub_sum

    list[1..-1].each do |ele|
        sub_sum += ele
        largest_sub_sum = largest_sub_sum < sub_sum ? sub_sum : largest_sub_sum

        sub_sum = 0 if sub_sum < 0
        largest_sub_sum = ele if ele > largest_sub_sum
    end
    largest_sub_sum
end


list1 = [5, 3, -7]
p lcs_slow(list1) # => 8

list2 = [2, 3, -6, 7, -6, 7]
p lcs_slow(list2) # => 8 (from [7, -6, 7])

list3 = [-5, -1, -3]
p lcs_slow(list3)
# => -1 (from [-1])

p lcs_fast(list1)
p lcs_fast(list2)
p lcs_fast(list3)