def partition(arr, num)
    final = [[], []]
    arr.each do |ele|
        if ele < num
            final[0] << ele
        else
            final[1] << ele
        end
    end
    final
end

def merge(hash_1,hash_2)
    hash = Hash.new(0)
    hash_2.each do |k,v|
        hash[k] = hash_2[k]
    end

    hash_1.each do |k,v|
        if !hash.has_key?(k)
            hash[k] = hash_1[k]
        end
    end

    return hash
end

def censor(sentence, arr)
    new_words = []

    words = sentence.split(" ")
    words.each do |word|
        if arr.any? {|each| each == word.downcase}
            new_words << voweless(word)
        else
            new_words << word
        end
    end
    new_words.join(" ")
end



def voweless(str)
    vowels = "aeiouAEIOU"
    new_word = ""
    str.each_char do |char|
        if vowels.include?(char)
            new_word += "*"
        else
            new_word += char 
        end
    end
    new_word
end

def power_of_two?(num)
    (0...num).each do |i|
        if 2**i == num
            return true
        end
    end
    return false
end


