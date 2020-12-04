def all_words_capitalized? (array)
    return array.all? {|ele| ele == ele.capitalize}
end

def no_valid_url?(arr)
    urls = [".com", ".net" , ".io" , ".org"]
    
    return arr.none? do |ele|
         urls.any? {|url| ele.end_with?(url)}
        #urls.each {|url| ele.include?(url)}
    end

end

def any_passing_students?(arr)
    arr.any? do |hash|
        hash[:grades].sum / (hash[:grades].length * 1.0) >= 75
    end 
end



 