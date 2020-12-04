def my_reject(arr, &prc)
    new_arr = []
    arr.each do |n|
        new_arr << n if !prc.call(n)
    end
    new_arr
end

def my_one?(arr, &prc)
    count = 0
    arr.each do |n|
        count +=1 if prc.call(n)
    end
    return true if count == 1
    return false
end

def hash_select(hash, &prc)
    newhash = {}
    hash.each do |k,v|
        if prc.call(k,v)
            newhash[k] = v
        end
    end
    newhash
end

def xor_select(arr, prc1 , prc2)
    new_arr =[]
    arr.each do |ele|
        if # true || true && !(true && true)
            !prc1.call(ele) && prc2.call(ele) || prc1.call(ele) && !prc2.call(ele) 
            new_arr << ele
        end
    end
    new_arr
end

def proc_count(num, arr)
    count = 0
    arr.each do |prc|
        count += 1 if prc.call(num)
    end
    return count
end