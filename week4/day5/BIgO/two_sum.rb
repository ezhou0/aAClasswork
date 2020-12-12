def bad_two_sum?(array, target)
    (0...array.length - 1).each do |i|
        (i + 1..array.length - 1).each do |j|
            return true if array[i] + array[j] == target
        end
    end
    false
end
#O(n^2)

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) 
# p bad_two_sum?(arr, 10)

def okay_two_sum?(array, target)
    sorted = array.sort #O(nlogn)
    # sorted.each do | |
    i = 0
    j = array.length - 1
    while i < j #O(n) or O(2n)
        case array[i] + array[j] <=> target
        when 0
            return true
        when -1
            i += 1
        when 1
            j -= 1
        end
    end
    false
end

# arr = [1, 0, 7, 5]
# p okay_two_sum?(arr, 6) 
# p okay_two_sum?(arr, 10)

def hash_two_sum?(arr, target)
    hash = Hash.new(0)

    arr.each do |el|
        hash[el] += 1
    end
    arr.each do |n| 
        puts hash[target-n]

        if hash[target-n] > 0
            puts hash
            if target - n == n && hash[n] != 2
                next
            else
                puts n
                return true
            end
        end
    end
    false
end

#O(n)



def hash_two_sum_2?(array, target)
    hash = Hash.new(0)

    array.each do |el|
        return true if hash[target - el] == true
        hash[el] = true
    end

    false
end

arr = [1, 0, 7, 5]
p hash_two_sum_2?(arr, 6) 
p hash_two_sum_2?(arr, 10)