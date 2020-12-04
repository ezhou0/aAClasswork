#Define your methods here.

def string_map!(str, &prc)
    # str.split(" ").map! do |word|
    #    new_word = word.each_char.with_index do |char,i|
    #         word[i] = prc.call(word[i])
    #     end
    #     new_word
    # end
    # str
    (0..str.length-1).each do |i|
        str[i] = prc.call(str[i])
    end
    str
end
# str_1 = "Apple Cider"
# p string_map!(str_1) { |char| char.upcase }

def three?(arr, &prc)
    count = 0
    arr.each do |el|
        count +=1 if prc.call(el)
    end
    if count == 3 
        return true
    else
        return false
    end
end

def nand_select(arr, prc1, prc2)
    newarr = []
    arr.each do |el|
        if !(prc1.call(el) && prc2.call(el) )
            newarr<< el
        end
    end
    newarr
end

def hash_of_array_sum(hash)
    newarr = []
    hash.each do |k,v|
        newarr << v
    end
    newarr.flatten.sum
end

def abbreviate(str)
    words = str.split(" ")
    new_words = words.map do |word|
        if word.length > 4
            remvowel(word)
        else
            word
        end
     end
     new_words.join(" ")
end
def remvowel(str)
    vowels = "aeiouAEIOU"
    newstr = ""
    str.each_char do |char|
        if !vowels.include?(char)
            newstr += char
        end
    end
    newstr
end

def hash_selector(hash, *args)
    newhash = Hash.new(0)
  args.each do |arg|
    if hash.has_key?(arg)
        newhash[arg] = hash[arg]
    end
  end
  if newhash.empty?
    return hash
  else
    return newhash
  end
end
