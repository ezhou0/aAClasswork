class Array
    def my_uniq
        hash = Hash.new(0)
        self.each {|el| hash[el]+=1}
        hash.keys
    end

    def twosum
        arr = []
        (0...self.length).each do |i|
            (i+1...self.length).each do |i2|
                arr << [i,i2] if self[i] + self[i2] == 0
            end
        end
        arr
    end

    def my_transpose
        dimension = self.length 
        new_arr = Array.new(dimension) { Array.new(dimension) }
        (0...dimension).each do |i|
            (0...dimension).each do |j|
                new_arr[j][i] = self[i][j]
            end
        end
        new_arr
    end

    def stock_picker
        best_days = []
        (0...self.length).each do |i|
            (i+1...self.length).each do |i2|
                unless best_days.empty?
                    best_price = self[best_days[1]]- self[best_days[0]]
                    if self[i2] - self[i] > best_price
                        best_days = [i,i2]
                    end
                else
                    best_days = [i,i2]
                end
            end
        end
        best_days
    end
end