class PolyTreeNode
    attr_reader :children, :parent
    attr_accessor :value
    def initialize(value = nil)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        return if self.parent == parent_node
        #if node already has parent(p_old), then access p_old and remove self from p_old.children
        @parent = parent_node
        self.parent.children << self unless self.parent == nil
    end

end