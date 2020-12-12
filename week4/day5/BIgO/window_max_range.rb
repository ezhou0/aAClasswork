def windowed_max_range(array, window)
    max_range = nil
    (0..array.length - window).each do |i|
        temp_window = array[i..i + window - 1]
        current_range = temp_window.max - temp_window.min
        if i == 0
            max_range = current_range
        end
        max_range = current_range if (current_range > max_range)
    end
    return max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8