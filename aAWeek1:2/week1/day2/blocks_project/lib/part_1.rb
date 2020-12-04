def select_even_nums(arr)
    return arr.select {|ele| ele.even? }
end

def reject_puppies(arr)
    return arr.reject {|hash| hash["age"] <= 2}
end

def count_positive_subarrays(arr)
    return arr.count {|subarr| subarr.sum > 0}
end

def aba_translate(str)
    vowels = "aeiou"
    newstr = ""
    str.each_char do |char|
        if vowels.include?(char)
            newstr += char + "b" + char
        else
            newstr += char   
        end
    end
    newstr
end

def aba_array(arr)
    return arr.map { |ele| aba_translate(ele) }
end