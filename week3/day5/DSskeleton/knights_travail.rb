require "./lib/00_tree_node.rb"
class KnightPathFinder

    def self.valid_moves(position)
        
    end

    def initialize(position)
        @position = position

        build_move_tree
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(position)
    end
end

kpf = KnightPathFinder.new([0, 0])


