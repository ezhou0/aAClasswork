def is_prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |div|
        if num%div == 0
            return false
        end
    end
    return true
end

def nth_prime(n)
    count = 0
    i = 1
    while count < n
        i+=1
        count += 1 if is_prime?(i)   
    end
    return i
end

def prime_range(min,max)
    arr = []
    (min..max).each do |num|
        if is_prime?(num)
            arr << num
        end
    end
    return arr
end