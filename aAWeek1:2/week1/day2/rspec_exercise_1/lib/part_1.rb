require "byebug"

def average (num1, num2)
    return (num1 + num2) / 2.0
end

def average_array(arr)
   return arr.sum/(arr.length * 1.0)
end

def repeat(str, num)
    return str*num
end

def yell(str)
    return str.upcase! + "!"
end


def alternating_case(str)
    newstr = []
    str.split(" ").each_with_index do |ele, i|
        if i.even?
            newstr << ele.upcase
        else
            newstr << ele.downcase
        end
    end
    
    return newstr.join(" ")
end
