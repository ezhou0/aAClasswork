require "./lib/00_tree_node.rb"

class KnightPathFinder
    MOVES = [[2,1],[2,-1],[1,2],[1,-2],[-1,-2],[-1,2],[-2,1],[-2,-1]]
    def self.valid_moves(position)
        valid_mvs = []
        x = position[0]
        y = position[1]
        MOVES.each do |mx, my|
            new_pos = [mx + x, my + y]
            if new_pos.all? {|axis| axis >= 0 && axis < 8}
                valid_mvs << new_pos
            end
        end
        valid_mvs
    end

    def initialize(position)
        @position = position
        @considered_position = [position]

        build_move_tree
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(position)
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        possible_moves.reject! {|a_pos| @considered_position.include?(a_pos)}
        possible_moves.each {|a_pos| @considered_position << a_pos }

    end

    private
    attr_accessor :considered_position

end

kpf = KnightPathFinder.new([0, 0])


