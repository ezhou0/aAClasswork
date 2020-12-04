def element_count(arr)
    new_hash = Hash.new(0)
    arr.each { |ele| new_hash[ele] += 1 }
    new_hash
end

def char_replace!(str, hash)
   str.each_char.with_index do |char,i|
        if hash.has_key?(char)
            str[i] = hash[char]
        end
    end
    str
end

def product_inject(arr)
    arr.inject {|acc, ele| acc*ele}
end

