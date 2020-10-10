class PolyTreeNode
    
    attr_reader :parent, :children, :pos
 
    def initialize(pos)
        @pos = pos
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

    def dfs(target_pos)
        return self if pos == target_pos

        children.each do |child|
            passed = child.dfs(target_pos)
            return passed if passed
        end

        return nil
    end

    def bfs(target_pos)
        queue = [self]

        until queue.empty?
            node = queue.shift
            return node if node.pos == target_pos
            queue += node.children
        end

        return nil
    end

    def inspect
        return "Current pos: #{pos}, Current children: #{children}"
    end

end