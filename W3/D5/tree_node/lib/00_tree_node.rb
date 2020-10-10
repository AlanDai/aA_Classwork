class PolyTreeNode
    
    attr_reader :parent, :children, :value
 
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
    
    def parent=(new_parent)
        parent.children.delete(self) unless parent.nil?
        @parent = new_parent
        @parent.children << self unless new_parent.nil?
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "node is not a child" unless children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if value == target_value

        children.each do |child|
            passed = child.dfs(target_value)
            return passed if passed
        end

        return nil
    end

    def bfs(target_value)
        queue = [self]

        until queue.empty?
            node = queue.shift
            return node if node.value == target_value
            queue += node.children
        end

        return nil
    end

end