# # strange_sums
# # Write a method strange_sums that accepts 
# # an array of numbers as an argument.
# # The method should return a count of the number
# #  of distinct pairs of elements that have a sum of zero. 
# # You may assume that the input array contains unique elements.

def strange_sums(arr)
    count = 0
    arr.each.with_index do |n1, i1|
        arr.each.with_index do |n2, i2|
            if i2 > i1 &&  n1 + n2 == 0
                count += 1
            end
        end
    end
    count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

# pair_product
# Write a method pair_product that accepts an array of
# numbers and a product as arguments. The method should
# return a boolean indicating whether or not a pair of distinct
# elements in the array result in the product when multiplied
# together. You may assume that the input array contains unique
# elements

def pair_product(arr, num)
    arr.each.with_index do |n1, i1|
        arr.each.with_index do |n2, i2|
            if i2 > i1 &&  n1*n2 == num
                return true
            end
        end
    end
    return false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

#Rampant Repeats
# Write a method rampant_repeats that accepts a string and a hash as
# arguments. The method should return a new string where characters of the
# original string are repeated the number of times specified by the hash. If a
# character does not exist as a key of the hash, then it should remain unchanged.

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char do |char|
        if hash.has_key?(char)
            new_str += (char * hash[char])
        else
            new_str += char       
        end
    end
    new_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

# perfect_square?
# Write a method perfect_square? that accepts a number as an argument. 
# The method should return a boolean indicating whether or not the argument 
# is a perfect square. A perfect square is a number that is the product of 
# some number multiplied by itself. For example, 
# since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 
# 35 is not a perfect square.

def perfect_square(num)
    (1..num).each {|i| return true if i*i == num} 
    return false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

# anti_prime?
# Write a method anti_prime? that accepts a number as an argument. The
# method should return true if the given number has more divisors than all
# positive numbers less than the given number. For example, 24 is an anti-prime
# because it has more divisors than any positive number less than 24. Math Fact:
# Numbers that meet this criteria are also known as highly composite numbers.

def anti_prime?(num)
    hash = Hash.new(0)
    (1..num).each do |i|
        hash[i] = counter(i)
    end
    new_hash = hash.sort_by { |k,v| v}

    if new_hash[-1][0] == num
        return true
    else
        return false
    end
end

def counter(n)
    count = 0
    (1..n).each do |i|
        if n % i == 0
            count += 1
        end
    end
    count 
end



# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false


# matrix_addition
# Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition 
# that accepts two matrices as arguments. The two matrices are guaranteed to have 
# the same "height" and "width". The method should return a new matrix representing 
# the sum of the two arguments. To add matrices, we simply 
# add the values at the same positions:

# # programmatically
# [[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]

# # structurally
# 2 5  +  9 1  =>  11 6
# 4 7     3 0      7 7

def matrix_addition(arr1, arr2)
    new_arr = []
        arr1.each.with_index do |sub1, i1|
            temp_arr = []
            sub1.each.with_index do |num1, idx1|
                temp_arr << arr2[i1][idx1] + arr1[i1][idx1]
            end
            new_arr << temp_arr
        end
    new_arr
end

# def matrix_addition(arr1, arr2)
#     height = arr1.length
#     width = arr1[0].length
#     new_arr = Array.new(height) {Array.new(width,0)}

#    (0...height).each do |row|
#         (0...width).each do |col|
#             new_arr[row][col] = arr1[row][col] + arr2[row][col]
#         end
#     end
# end


# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

# Mutual_factors
# Write a method mutual_factors that accepts any amount of numbers as
# arguments. The method should return an array containing all of the common
# divisors shared among the arguments. For example, the common divisors of 50
# and 30 are 1, 2, 5, 10. You can assume that all of the arguments are positive
# integers.

def mutual_factors(*num)
    hash = Hash.new(0)
    arr = []

    num.each do |i|
        arr << divisors(i)
    end
    arr.flatten.each {|n| hash[n] += 1} 
    new_hash = hash.select do |k,v|
        if hash[k] == num.length
            k
        end
    end
    new_hash.keys
end

def divisors(n)
    div_arr = []
    (1..n).each do |factor|
        if n % factor == 0
            div_arr << factor
        end
    end
    div_arr
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

# tribonacci_number
# The tribonacci sequence is similar to that of Fibonacci.
#  The first three numbers of the tribonacci sequence are 1, 1, and 2. 
#  To generate the next number of the sequence, we take the sum of 
#  the previous three numbers. The first six numbers of tribonacci sequence are:
# 1, 1, 2, 4, 7, 13, ... and so on
# Write a method tribonacci_number that accepts a number argument, n, 
# and returns the n-th number of the tribonacci sequence.

def tribonacci_number(num)
    arr = [1,1,2]
    if num <= 3
        return arr[num-1]
    end
    
    while arr.length < num
        arr << arr[-1] + arr[-2] + arr[-3]
    end
    return arr[-1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

# matrix_addition_reloaded
# Write a method matrix_addition_reloaded that accepts any number 
# of matrices as arguments. The method should return a new matrix 
# representing the sum of the arguments. Matrix addition can only 
# be performed on matrices of similar dimensions, so if all of the 
# given matrices do not have the same "height" and "width", then return nil.

def matrix_addition_reloaded(*matrices)
    length = matrices[0].length 
    matrices.each do |matrix|
        if matrix.length != length
            return nil
        end 
    end
    new_matrix = matrices.inject do |m1 ,m2| 
        matrix_addition(m1, m2)
    end
 
end


# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# squarocol?
# Write a method squarocol? that accepts a 2-dimensional array as an argument.
# The method should return a boolean indicating whether or not any row or column 
# is completely filled with the same element. You may assume that the 2-dimensional 
# array has "square" dimensions, meaning it's height is the same as it's width.

def squarocol?(matrix)
    return true if matrix.any? {|arr| uniform?(arr)}
    # compare same indices in each arr; if equal, return true
    matrix[0].each_with_index do |ele, i|
        j = 0
        new_arr = []
        while j < matrix.length
            new_arr << matrix[j][i] 
            j+=1
        end
        return true if uniform?(new_arr)
    end

    return false
end

def uniform?(array)
    array.all? {|ele| ele == array[0]}
end

# p squarocol?([
#     [:a, :x , :d], #[0][1]
#     [:b, :x , :e], #[1][1]
#     [:c, :x , :f], #[2][1]
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

# squaragonal?
# Write a method squaragonal? that accepts 2-dimensional array as an argument. 
# The method should return a boolean indicating whether or not the array contains 
# all of the same element across either of its diagonals. You may assume that the 
# 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

def squaragonal?(matrix)
    return diagonal1(matrix) || diagonal2(matrix)
end

def uniform?(array)
    array.all? {|ele| ele == array[0]}
end

def diagonal1(matrix)
    j = 0
    new_arr = []
    while j < matrix.length
        new_arr << matrix[j][j]
        j += 1
    end
    return uniform?(new_arr)
end

def diagonal2(matrix)
    i = 0
    j = matrix.length-1
    new_arr = []
    while i < matrix.length
        new_arr << matrix[i][j]
        i += 1
        j -= 1
    end
    return uniform?(new_arr)
end



# p squaragonal?([
#     [:x, :y, :o], #[0][0]
#     [:x, :x, :x], #[1][1]
#     [:o, :o, :x], #[2][2]
# ]) # true

# p squaragonal?([
#     [:x, :y, :o], #[0][2]
#     [:x, :o, :x], #[1][1]
#     [:o, :o, :x], #[2][0]
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. The top
# of the pyramid is the number 1. To generate further levels of the pyramid, every
# element is the sum of the element above and to the left with the element above
# and to the right. Nonexisting elements are treated as 0 when calculating the
# sum. For example, here are the first 5 levels of Pascal's triangle:
# Write a method pascals_triangle that accepts a positive number, n, as
# an argument and returns a 2-dimensional array representing the first n levels
# of pascal's triangle.

def pascals_triangle(num)
    arr = [[1]]
    while arr.length < num
        prevlvl = arr[-1]
        nextlvl = build(prevlvl)
        arr << nextlvl
    end
    arr
end

def build(arr)
    new_arr = [1]
    arr.each_with_index do |n,i|
        if i != arr.length-1
            new_arr << arr[i] + arr[i+1]
        end
    end
    new_arr << 1
    new_arr
end



# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

# mersenne_prime
# A "Mersenne prime" is a prime number that is one less than a power of 2. 
# This means that it is a prime number with the form 2^x - 1, where x is 
# some exponent. For example:

# 3 is a Mersenne prime because it is prime and 3 = 2^2 - 1
# 7 is a Mersenne prime because it is prime and 7 = 2^3 - 1
# 11 is not a Mersenne prime because although it is prime, 
# it does not have the form 2^x - 1
# The first three Mersenne primes are 3, 7, and 31. 
# Write a method mersenne_prime that accepts a number, n, 
# as an argument and returns the n-th Mersenne prime.

def mersenne_prime(num)
    count = 0
    x = -1
        while count < num
        x += 1
        candidate = 2**x - 1
        count += 1 if prime?(candidate)
    end
    return 2**x - 1 
end

def prime?(n)
    return false if n < 2
    return (2...n).none? {|i| n % i == 0}

end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

# triangular_word?
# A triangular number is a number of the form 
# (i * (i + 1)) / 2 where i is some positive integer. 
# Substituting i with increasing integers gives the triangular 
# number sequence. The first five numbers of the triangular number
#  sequence are 1, 3, 6, 10, 15. Below is a breakdown of the 
#  calculations used to obtain these numbers:

# i	(i * (i + 1)) / 2
# 1	1
# 2	3
# 3	6
# 4	10
# 5	15

# We can encode a word as a number by taking the sum of 
# its letters based on their position in the alphabet. 
# For example, we can encode "cat" as 24 because c is the 3rd 
# of the alphabet, a is the 1st, and t is the 20th:

# 3 + 1 + 20 = 24

# Write a method triangular_word? that accepts 
# a word as an argument and returns a boolean 
# indicating whether or not that word's number 
# encoding is a triangular number. You can assume that the 
# argument contains lowercase letters.

def triangular_word?(str)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    sum = 0
    str.each_char do |char|
        sum += alpha.index(char) + 1
       # p alpha.index(char)
    end
   # p sum
    triangular?(sum)
end

def triangular?(num)
    (1..num).each do |i|
        if (i * (i + 1)) / 2 == num
            return true
        end
    end
    return false
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

# consecutive_collapse
# Write a method consecutive_collapse that accepts an array of 
# numbers as an argument. The method should return a new array 
# that results from continuously removing consecutive numbers that 
# are adjacent in the array. If multiple adjacent pairs are consecutive
#  numbers, remove the leftmost pair first. For example:
# [3, 4, 1] -> [1]
# because 3 and 4 are consecutive and adjacent numbers, so we can remove them
# [1, 4, 3, 7] -> [1, 7]
# because 4 and 3 are consecutive and adjacent numbers, so we can remove them
# [3, 4, 5] -> [5]
# because 4 and 3 are consecutive and adjacent numbers, we don't
#  target 4 and 5 since we should prefer to remove the leftmost pair

# We can apply this rule repeatedly until we cannot collapse the array any further:
# # example 1
# [9, 8, 4, 5, 6] -> [4, 5, 6] -> [6]

# # example 2
# [3, 5, 6, 2, 1] -> [3, 2, 1] -> [1]



def consecutive_collapse(arr)
    arr.each {arr = collapse(arr)}
    arr
end

def collapse(arr)
    (0...arr.length - 1).each do |i|
        if arr[i] + 1 == arr[i+1] || arr[i] == arr[i+1] + 1
            return arr[0...i] + arr[i + 2.. -1]
        end
    end 
    arr
end


# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []



# pretentious_primes
# Write a method pretentious_primes that takes accepts 
# an array and a number, n, as arguments. The method 
# should return a new array where each element of 
# the original array is replaced according to the following rules:

# when the number argument is positive, replace an 
# element with the n-th nearest prime number that is greater than the element
# when the number argument is negative, replace an element 
# with the n-th nearest prime number that is less than the element
# For example:

# if element = 7 and n = 1, then the new element
#  should be 11 because 11 is the nearest prime greater than 7
# if the element = 7 and n = 2, then the 
# new element should be 13 because 13 is the 2nd nearest prime greater than 7
# if the element = 7 and n = -1, then the
#  new element should be 5 because 5 is the nearest prime less than 7
# if the element = 7 and n = -2, then the 
# new element should be 3 because 3 is the 2nd nearest prime less than 7
# Note that we will always be able to find a 
# prime that is greater than a given number 
# because there are an infinite number of primes 
# (this is given by Euclid's Theorem). However, we may be 
# unable to find a prime that is smaller than a given number, 
# because 2 is the smallest prime. When a smaller prime cannot be 
# calculated, replace the element with nil.

def nearestprime(ele, num)
    step = 1
    if num < 0
        num = -(num)
        step = -(step)
    end

    prime_count = 0
    while prime_count < num
        return nil if ele < 0
        ele += step
        prime_count += 1 if prime?(ele)
    end
    ele
end

def pretentious_primes(arr, num)
    return arr.map{|ele| nearestprime(ele, num) }
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]


