require "stack"
class MyStackQueue
    def initialize
        @in = MyStack.new
        @out = MyStack.new
    end

    def size
        @in.size + @out.size
    end

    def empty?
        @in.empty? && @out.empty?
    end

    def enqueue(val)
        @in.push(val)
    end

    def dequeue
        @out.populate if out.empty?
        @out.pop
    end

    private
    def populate
        @out.push(@in.pop) until @in.empty?
    end
end