class MyQueue
    def initialize
        @store = []
    end

    def peek
        @store[0]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(val)
        @store.push(val)
    end

    def dequeue
        @store.shift
    end
end

#[1,2,3,4]
#[2,3,4]

#[1,2,3,4]
#[1,2,3]