class Array
    def my_uniq
        hash = Hash.new
        self.each { |ele| hash[ele] = 0 }
        hash.keys
    end

    def two_sum
        output = []
        (0...self.length-1).each do |i1|
            (i1+1...self.length).each do |i2|
                output << [i1, i2] if self[i1] == -self[i2]
            end
        end
        output
    end

    def my_transpose
        output = Array.new(self[0].length) {Array.new(self.length)}
        (0...self.length).each do |row|
            (0...self[0].length).each do |col|
                output[col][row] = self[row][col]
            end
        end
        output
    end

end