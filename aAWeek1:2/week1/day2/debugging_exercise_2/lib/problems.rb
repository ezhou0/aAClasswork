# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    i = num
    while i > 0
        if num%i == 0 && prime?(i)
            return i
        end
        i -= 1
    end
end

def prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        return false if num%factor == 0 
    end

    return true
end

def unique_chars?(str)
    hash = Hash.new(0)

    str.each_char do |char|
        hash[char] += 1
    end

    hash.each do |key,value|
        if value > 1
            return false
        end
    end

    true 
end

def dupe_indices(arr)
    counter = Hash.new(0)
    # arr.each_with_index do |ele, i|
    #     hash[ele] = []i

    duper = Hash.new {[]}

    arr.each do |ele|
        counter[ele] += 1
    end

    arr.each_with_index do |ele , i|
        if counter[ele] > 1
            duper[ele] += [i]
        end
    end

    return duper
    
end

def ana_array(arr1, arr2)
   return counter(arr1) == counter(arr2)  
end

def counter(arr)
    hash = Hash.new(0)

    arr.each do |ele|
        hash[ele] += 1
    end

    hash
end