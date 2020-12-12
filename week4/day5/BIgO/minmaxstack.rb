require "stack"
class MinMaxStack
    def initialize 
        @store = MyStack.new
        @min = nil
        @max = nil
    end

    def size
        @store.size
    end

    def empty?
        @store.empty?
    end

    def new_max(val)
        if empty?
            return val
        else 
            [find_max, val].max
        end
    end

    def new_min(val)
        if empty?
            return val
        else 
            [find_min, val].min
        end
    end

    def find_max
        @store.peek[max]
    end

    def find_min
        @store.peek[min]
    end
   
    def push(val)
        @store.push({max => new_max(val), min => new_min(val, value => val)})
    end

end