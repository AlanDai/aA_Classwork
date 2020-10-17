#time complexity: O(n * n!) w/ n being length of the string
def first_anagram?(str, target_str)
    anagrams = str.chars.permutation.to_a.map(&:join)
    anagrams.include?(target_str)
end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")

#O(n^2)
def second_anagram?(str, target_str)
    str_arr = str.chars
    target_arr = target_str.chars
    str_arr.each do |char|
        idx = target_arr.index(char)
        return false if idx.nil?
        target_arr.delete_at(idx)
    end
    target_arr.empty?
end

# p second_anagram?("gizmo", "sally")
# p second_anagram?("elvis", "lives")

#O(n * log n)
def third_anagram?(str, target_str)
    str_arr = str.chars.sort
    target_arr = target_str.chars.sort
    str_arr == target_arr
end

# p third_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives")

#O(n)
def fourth_anagram?(str, target_str)
    return false unless str.length == target_str.length
    str_counter = Hash.new(0)
    target_counter = Hash.new(0)

    str.each_char {|char| str_counter[char] += 1}
    target_str.each_char {|char| target_counter[char] += 1}
    str_counter.keys.all? {|k| str_counter[k] == target_counter[k]}
end

# p fourth_anagram?("gizmo", "sally")
# p fourth_anagram?("elvis", "lives")