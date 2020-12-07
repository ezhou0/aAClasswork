require "./lib/00_tree_node.rb"

class KnightPathFinder
    attr_reader :position 
    attr_accessor :considered_position, :root_node
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
        queue = [self.root_node]
        until queue.empty?
            node = queue.shift
            possibilities = new_move_positions(node.value) #this is an array
            possibilities.each do |option| #each option is a position
                new_node = PolyTreeNode.new(option)
                node.add_child(new_node)
                queue << new_node #re-populate the queue
            end
        end
    end

    ## root < created this instance of a root node
    #/      \
    #NN      NN
    #iterate thru the possible positions
    #at each position, we need to call polytreenode to create a new instance of node
    #parent.addchild(newnode)

    ##[ root ]
    #/      \
    #[NN      NN]
    #/ \        / \
    #[N  N       N   N]

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        possible_moves.reject! {|a_pos| @considered_position.include?(a_pos)}
        possible_moves.each {|a_pos| @considered_position << a_pos }
        possible_moves
    end

    def find_path(end_pos)
        end_node = self.root_node.dfs(end_pos)
        trace_path_back(end_node).reverse.map{|node|node.value}
    end

    def trace_path_back(end_node)
        nodes = []

        current_node = end_node
        until current_node.nil?
            nodes << current_node
            current_node = current_node.parent
        end
        nodes
    end
   

end

# kpf = KnightPathFinder.new([0, 0])
# kpf.build_move_tree # => [[0, 0], [2, 1]]
# p kpf.considered_position.length # => [[0, 0], [2, 1], [3, 3]]
# p kpf.considered_position

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]


