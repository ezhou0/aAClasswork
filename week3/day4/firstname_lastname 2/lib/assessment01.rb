class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    temp = nil
    if accumulator == nil
      temp = self[0]
      (1...self.length).each do |i|
        temp = prc.call(temp,self[i])
      end
    else
      temp = accumulator
      (0...self.length).each do |i|
        temp = prc.call(temp,self[i])
      end
    end
    temp
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
   return false if num < 2
   (2...num).each do |i|
    return false if num%i == 0
   end
   return true
end

def primes(num)
  arr = []
  i = 0
  while arr.count < num
    arr << i if is_prime?(i)
    i += 1
  end
  arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 0
  return [1] if num == 1
  
  prev = factorials_rec(num-1)
  prev << (num-1) * prev[-1]
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new { |h, k| h[k] = [] }
    (0...self.length).each do |i|
      hash[self[i]] << i
    end
    hash.select {|k,v| v.count > 1} 
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    self.all_substrings.select do |ele|
        ele == ele.reverse
    end
  end

  def all_substrings
    all_sub = []
     (0...self.length).each do |i|
        (1...self.length).each do |i2|
            all_sub << self[i..i2] if i2 > i
      end
    end
    all_sub
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    
    prc = Proc.new {|ele1, ele2| ele1 <=> ele2} if prc.nil? ##sets prc if none given
    return self if self.length <= 1 ##base case
    mid_index = self.length/2
    left_side = self[0...mid_index].merge_sort(&prc)
    right_side = self[mid_index..-1].merge_sort(&prc)

    Array.merge(left_side,right_side, &prc)

  # [1,2,3,4,5,6,7,8] 
  #  '{|a,b| a>b}'
  #  [1] [2] [3] [4] [5] [6] [7] [8]
  #  [2,1] [4,3] [5,6] [7,8]
  # [8,7,6,5,4,3,2,1]
  end

  private
  def self.merge(left, right, &prc)
    temp_arr = []
    until left.empty? || right.empty?
      case prc.call(left[0], right[0])
        when -1
          temp_arr << left.shift
        when 0
          temp_arr << left.shift
        when 1
          temp_arr << right.shift
      end
    end
    temp_arr + left + right
  end
end
