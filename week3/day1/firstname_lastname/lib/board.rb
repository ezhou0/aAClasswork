class Board
    attr_reader :size
    def initialize(size)
        @size = size
        @grid = Array.new(size) {Array.new(size)}
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, mark)
        @grid[pos[0]][pos[1]] = mark
    end

    def complete_row?(mark)
        @grid.any? do |row|
            row.all? do |el|
                el == mark
            end
        end
    end

    def complete_col?(mark)
        @grid.transpose.any? do |row|
            row.all? do |el|
                el == mark
            end
        end
    end

    def complete_diag?(mark)
        left_right = (0...@size).all? do |i|
            @grid[i][i] == mark
        end
        right_left = (0...@size).all? do |i|
            @grid[i][@grid.length - 1 - i] == mark
        end

        left_right || right_left
    end

    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end



    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
