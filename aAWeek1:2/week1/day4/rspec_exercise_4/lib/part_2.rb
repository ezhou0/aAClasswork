def proper_factors(num)
    arr = []
    (1...num).each do |fac|
        if num%fac == 0
            arr<<fac
        end
    end
    arr
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
     num == aliquot_sum(num)
end

def ideal_numbers(n)
    arr = []
    i = 0
    while arr.length < n
        i+=1
        arr << i if perfect_number?(i)
    end
    arr
end