def hipsterfy(str)
    vowels = "aeiou"
    newstr = ""
    count = 0
    str.reverse.each_char do |char|
        if !vowels.include?(char) || count == 1
            newstr += char
        else
            count+=1
        end 
    end

    return newstr.reverse
end

def vowel_counts(str)
    hash = Hash.new(0)
    vowels = "aeiou"
    str.downcase.each_char do |char|
        if vowels.include?(char)
            hash[char] += 1
        end
    end
    hash 
end

def caesar_cipher(str, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_words = []

    str.split(" ").each do |word|
        new_word = ""
        word.each_char do |letter|
            if alphabet.include?(letter)
                idx1 = alphabet.index(letter)
                idx2 = idx1+num
                newchar = alphabet[idx2%26]
                new_word += newchar
            else
                new_word += letter
            end
        end
        new_words << new_word
    end
    return new_words.join(" ")
end