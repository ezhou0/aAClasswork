
def my_min(list)
    min_num = nil
    list.each do |ele|
        temp_num = ele
        list.each do |ele2|
            if ele2 < temp_num
                min_num = ele2
            end
        end
    end
    min_num
end
#O(n^2) time

def my_min2(list)
    min_num = list.first
    list.each do |ele|
        min_num = ele if ele < min_num
    end
    min_num
end
#O(n) time

def largest_contiguous_subsum(array)
    subs = []
    (0...array.length - 1).each do |i|#n
        (i..array.length - 1).each do |i2|#n
            subs << array[i..i2] #n
        end
    end #(n^2)
    subs.map {|sub| sub.inject(:+)}.sort[-1] #(nlogn)
end

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list)
#O(n^3) or O(n^2)


def largest_contiguous_subsum_2(arr)
    largest_sum = arr.first
    largest_index = 0
    arr.each_with_index do |el,i| #O(n)
        if el > largest_sum
            largest_sum = el 
            largest_index = i
        end
    end
    new_arr = arr[0...largest_index] + arr[largest_index+1..-1] #O(2n)or#O(n)
   
    new_arr.each do |el| #O(n)
        temp_sum = el + largest_sum
        largest_sum = temp_sum if temp_sum > largest_sum
    end
    largest_sum
end #O(n)


 list = [-5, -1, -3]
p largest_contiguous_subsum_2(list) # => 8


