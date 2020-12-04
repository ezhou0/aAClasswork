require "byebug"

puts "hello"


arr = ["b","A","a","1"]
puts arr.min
p arr.inject("z"){|acc,el| acc + el}




def thinger
    $THING = "thing"
end

thinger
p $THING


