class Board

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.

    def self.build_stacks(n)
        board = Array.new(n) {Array.new(0)}
    end

    def initialize(num, max_height)
        @max_height = max_height
        @stacks = Board.build_stacks(num)
        raise "rows and cols must be >= 4" if @max_height < 4 || num < 4 
    end

    def max_height
        @max_height
    end

    def add(token, stack_index)
       if @stacks[stack_index].length < @max_height
            @stacks[stack_index] << token
            return true
       else
        return false
       end
    end

    def print
        @stacks.each { |stack| p stack }
    end

    def vertical_winner?(token)
        @stacks.any? do |stack|
            count = 0
            stack.each do |el| 
                if el == token
                    count+=1
                end
            end
            return true if count == @max_height
        end
    end

    def horizontal_winner?(token)
        i = 0
        j = 0
        while j < max_height
            count = 0
            while i < @stacks.length
                count += 1 if @stacks[i][j] == token
                i+=1 
            end
            return true if count == @stacks.length 
            j+=1
            i = 0
        end
        return false
    end

    # #[ [i][j]
    # [a,b,c] [0][1]
    # [b,b]   [1][1]
    # [a,b]    [2][1]
    # #]
    #

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end

end
