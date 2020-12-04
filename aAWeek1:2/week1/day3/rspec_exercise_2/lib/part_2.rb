def palindrome?(str)
    new_word = []
    str.split("").reverse_each { |char| new_word << char }
    new_word.join("") == str
end

def substrings(str)
    arr = []
    str.each_char.with_index do |char , i| 
        segment = str[i..-1]
        arr << looper(segment)
    end
    return arr.flatten 
end

def looper(segment)
    new_arr = []
    segment.each_char.with_index do |char, i|
        new_arr << segment[0..i]
    end
    return new_arr
end

def palindrome_substrings(str)
    new_arr = []
    arr = substrings(str)
    arr.each do |substr|
        if substr.length > 1 && palindrome?(substr)
            new_arr << substr
        end
    end
    new_arr
end