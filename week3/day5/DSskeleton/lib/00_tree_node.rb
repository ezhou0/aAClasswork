class PolyTreeNode
    attr_reader :children
    attr_accessor :parent, :value
    def initialize(value = nil)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        parent = parent_node
        parent_node.children << children
    end

end