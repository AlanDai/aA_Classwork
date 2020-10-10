require_relative '02_knights_node.rb'

class KnightPathFinder
    
    def initialize(final_pos)
        @root_node = PolyTreeNode.new([0, 0])
        @considered_positions = [[0, 0]]
        @final_pos = final_pos
        # self.build_move_tree
    end

    def self.new_move_positions(considered_positions, pos)
        x, y = pos
        possible_moves = [[x-2, y-1], [x-2, y+1], [x+2, y-1], [x+2, y+1], [x-1, y-2], [x-1, y+2], [x+1, y-2], [x+1, y+2]]
        return KnightPathFinder.valid_moves(considered_positions, possible_moves)
    end

    def self.valid_moves(considered_positions, moves)
        moves.reject do |move| 
            considered_positions.include?(move) || 
            move[0] < 0 || move[0] >= 8 ||
            move[1] < 0 || move[1] >= 8
        end
    end

    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            curr_node = queue.shift

            possible_moves = KnightPathFinder.new_move_positions(@considered_positions, curr_node.pos)
            curr_children = possible_moves.each do |possible_move|
                @considered_positions << possible_move
                new_child = PolyTreeNode.new(possible_move)
                curr_node.add_child(new_child)
                queue << new_child
            end
        end

        return @root_node
    end

    def find_path(end_pos)
        target_node = @root_node.bfs(end_pos)

        return trace_path_back(target_node)
    end

    def trace_path_back(node)
        path = []

        while node
            path.unshift( node.pos )
            node = node.parent
        end

        path

        # until path.first.parent.nil?
        #     path.unshift(path.first.parent)
        # end
    end

end

if __FILE__ == $PROGRAM_NAME
    kpf = KnightPathFinder.new([0, 0])
    kpf.build_move_tree
    p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
    p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
end

