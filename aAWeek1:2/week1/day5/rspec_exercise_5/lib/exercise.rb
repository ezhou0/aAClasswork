def zip(*arr)
    length = arr.first.length
    (0...length).map do |i|
        arr.map {|subArr| subArr[i]}
    end 
end


def prizz_proc(arr, prc_1, prc_2)
    new_arr = []
    arr.each do |ele|
        if (prc_1.call(ele) && !prc_2.call(ele)) ||(!prc_1.call(ele) && prc_2.call(ele))
            new_arr << ele
        end
    end
    new_arr
end

def zany_zip(*arr)
    length = arr.max_by(&:length).length
    (0...length).map do |i|
        arr.map {|subArr| subArr[i]}
    end
end


def maximum(arr, &prc)
    max = arr[0]
    arr.each do |el|
        if prc.call(el) >= prc.call(max)
            max = el
        end
    end
    max
end

def my_group_by(arr, &prc)
    hash = Hash.new {|h, k| h[k] = []} 
    arr.each do |ele|
        hash[prc.call(ele)] << ele
    end
    hash
end

def max_tie_breaker(arr, prc, &block)
   narr = []
   max = maximum(arr, &block)

   arr.each do |el|
        if block.call(el) == block.call(max)
             narr << el 
        end
   end

   return narr[0] if narr.length == 1
   return nil if narr.empty?

   maximum_2(narr, &prc)
end

def maximum_2(arr, &prc)
    max = arr[0]
    arr.each do |el|
        if prc.call(el) > prc.call(max)
            max = el
        end
    end
    max
end

# array_1 = ['potato', 'swimming', 'cat'] 
#  array_2=['cat', 'bootcamp', 'swimming', 'ooooo'] 
# array_3 = ['photo','bottle', 'bother'] 
# length =  Proc.new { |s| s.length } 
# o_count =Proc.new { |s| s.count('o') } 

# max_tie_breaker(array_1, o_count, &length)

def silly_syllables(str)
    # new_words = []
    vowels = "aeiouAEIOU"
    words = str.split(" ")
    new_words = words.map do |word|
        if word.split("").count {|char| vowels.include?(char) } >= 2
            remove_char(word)
        else
            word
        end
    end
    new_words.join(" ")
end

# def remove_char(word)
#     new_word = ""
#     vowels = "aeiouAEIOU"
#     word.each_char.with_index do |char, i|
#         if vowels.include?(char)
#             new_word = word[i..-1]
#              break
#         end
#     end
#     newer_word = ""
#     # new_word.reverse.each_char.with_index do |char,i|
#     #     if vowels.include?(char)
#     #         return new_word[0..i + 1]
#     #     #properly
#     #     end

#     new_word.split("").reverse_each.with_index do |char,i|
#         if vowels.include?(char)
#             return new_word[0..i]
#         #properly
#         end
#     end
# end

def vowel_counter(word)
    count = 0
    vowels = "aeiouAEIOU"
    word.each_char do |char|
        if vowels.include?(char)
            count += 1
        end
    end
    count
end

def remove_char(word)
    vowels = "aeiouAEIOU"

    (0...word.length).each do |first_vowel|
        if vowels.include?(word[first_vowel])
            (0...word.length).reverse_each do |last_vowel|
                if vowels.include?(word[last_vowel])
                    return word[first_vowel..last_vowel]
                end
            end
        end
    end
end