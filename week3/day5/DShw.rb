class Stack
    attr_reader :an_array
    def initialize
      # create ivar to store stack here!
      @an_array = []
    end

    def push(el)
      # adds an element to the stack
      an_array.push(el)
    end

    def pop
      # removes one element from the stack
      an_array.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      an_array.last
    end
  end

#   stack = Stack.new
#   stack.push(1)
#   p stack
#   stack.pop
#   p stack
#   stack.push(1)
#   stack.push(2)
#   p stack.peek

class Queue
    attr_reader :an_array
    def initialize
        @an_array = []
    end

    def enqueue(el)
        an_array.push(el)
    end

    def dequeue
        an_array.shift
    end

    def peek
        an_array.first
    end
end

# q = Queue.new
# p q 
# q.enqueue(1)
# q.enqueue(2)
# q.enqueue(3)
# p q 
# q.dequeue
# p q 
# p q.peek

class Map
    attr_reader :an_array

    def initialize
        @an_array = []
    end

    def set(key, value)
        #does this exist in the map
        exist = @an_array.index {|pair| pair[0] == key}
        if exist
            @an_array[exist][1] == value
        else
            @an_array << [key, value]
        end
    end

    def get(key)
        @an_array.each {|pair| return pair[1] if pair[0] == key}
        nil
    end

    def delete(key)
        an_array.reject! {|pair| pair[0] == key}
    end

    def show
        @an_array
    end
end

map = Map.new
map.set(1,1)
map.set(2,2)
map.set("a","a")
p map.show #[[1,1],[2,2],["a", "a"]]
p map.get(1) #1
p map.get(12) #nil
map.delete(2) #[1,1],["a", "a"]]
p map.get(2) #nil
p map.show #[1,1],["a", "a"]]

