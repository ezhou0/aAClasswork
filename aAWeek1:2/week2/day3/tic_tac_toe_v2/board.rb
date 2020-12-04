class Board
    def initialize
        @grid = Array.new(3){ Array.new(3,"_")}
    end

    def[](pos)
        @grid[pos[0]][pos[1]]
    end
    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def valid?(pos)
        pos.all? do |i|
            i < 3 && i >= 0
        end
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        raise if !empty?(pos) || !valid?(pos)
        self[pos] =  mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? do |row|
            row.all? {|el| el == mark }
        end
    end

    def win_col?(mark)
        @grid.transpose.any? do |col|
            col.all? {|el| el == mark }
        end
    end

    #[
    #[_,_,X]  [0,2]
    #[_,X,_]  [1,1]
    #[X,_,_]  [2,0]
    #]

    def win_diagonal?(mark)
        lr = (0..2).all? do |i|
            @grid[i][i] == mark
        end

        rl= (0..2).all? do |i|
            @grid[i][@grid.length-1-i] == mark
        end

        lr || rl
    end

    def win?(mark)
        win_diagonal?(mark) || win_col?(mark) || win_row?(mark)
    end

    def empty_positions?
        @grid.flatten.any?{|el| el == "_"}
    end


end