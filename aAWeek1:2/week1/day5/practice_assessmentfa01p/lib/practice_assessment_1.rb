# Define your methods here. 
def first_letter_vowel_count(str)
    count = 0
    vowels = "aeiouAEIOU"
    words = str.split(" ")
    words.each do |word|
        count+=1 if vowels.include?(word[0])
    end
    count
end

def count_true(arr, prc)
    count = 0
    arr.each do |ele|
        count+=1 if prc.call(ele)
    end
    count
end

# def procformation(arr, prc1, prc2, prc3)
#     narr = []
#     arr.each do |ele|
#         if prc1.call(ele)
#             narr << prc2.call(ele)
#         else
#             narr << prc3.call(ele)
#         end
#     end
#     narr
# end

def procformation(arr, prc1, prc2, prc3)
    narr = arr.map do |ele|
        if prc1.call(ele)
            prc2.call(ele)
        else
            prc3.call(ele)
        end
    end
    narr
end

def array_of_array_sum(arr)
    arr.flatten.sum
end

def selective_reverse(str)
    words = str.split(" ")
    vowels = "aeiou"
    new_arr = words.map do |word|
        if vowels.include?(word[0]) || vowels.include?(word[-1])
             word
        else
             word.reverse
        end
    end
    new_arr.join(" ")
end

def hash_missing_keys(hash, *args)
    narr = []
    args.each do |arg|
       narr << arg if !hash.has_key?(arg)
    end
    narr 
end