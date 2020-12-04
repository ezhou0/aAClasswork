def reverser(str, &prc)
    return prc.call(str.reverse)
end

def word_changer(str, &prc)
    words = str.split(" ")
    new_words = words.map {|word| prc.call(word)}
    return new_words.join(" ")
end

def greater_proc_value(num, proc_1, proc_2)
    if proc_1.call(num) > proc_2.call(num)
        return proc_1.call(num)
    else
        return proc_2.call(num)
    end
end

def and_selector(arr, proc_1, proc_2)
    new_arr = []
    arr.each do |num|
        if proc_1.call(num) == true && proc_2.call(num) == true
            new_arr << num
        end
    end
    return new_arr
end

def alternating_mapper(arr, proc_1, proc_2)
    new_arr = []
    arr.each_with_index do |ele, i|
        if i.even?
            new_arr << proc_1.call(ele)
        else
            new_arr << proc_2.call(ele)
        end
    end
    return new_arr
end