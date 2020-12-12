def first_anagrams?(str1, str2)
    all_anagrams(str1).include?(str2)
end

def all_anagrams(str)
    return [str] if str.length <= 1
    last_anagrams = all_anagrams(str[0...-1])
    new_anagrams = []
    last_anagrams.each do |anagram|
        (0..anagram.length).each do |i|
            new_anagrams << anagram.dup.insert(i, str[-1])
        end
    end
    new_anagrams
end
#O(n!)

# p first_anagrams?("gizmo", "sally")
# p first_anagrams?("elvis", "lives")

def second_anagrams?(str1, str2)
    arr2 = str2.split("")
    str1.each_char do |char|
        idx = arr2.find_index(char) #since this iterates, its a nested n
        return false unless idx
        arr2.delete_at(idx)
    end
    arr2.empty?
end
#O(n^2)
# p second_anagrams?("gizmo", "sally")
# p second_anagrams?("elvis", "lives")

def third_anagrams?(str1,str2)
    str1.split("").sort.join("") == str2.split("").sort.join("")
end

#O(nlogn)

# p third_anagrams?("gizmo", "sally")
# p third_anagrams?("elvis", "lives")

def fourth_anagrams?(str1,str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    str1.each_char {|char| hash1[char]+=1}
    str2.each_char {|char| hash2[char]+=1}

    hash1==hash2
end

#O(n)
def fourth_anagrams_bonus?(str1,str2)
    hash = Hash.new(0)

    str1.each_char {|char| hash[char]+=1}
    str2.each_char {|char| hash[char]-=1}
    hash.values.all? {|v| v == 0}
end
#O(n)
p fourth_anagrams_bonus?("gizmo", "sally")
p fourth_anagrams_bonus?("elvis", "lives")