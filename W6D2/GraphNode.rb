class GraphNode
    attr_accessor :value, :neighbors
    def initialize(value)
        @value = value
        @neighbors = []  
    end
end

def bfs(starting_node, target_value)
    visited = Set.new
    queue = []
    queue << starting_node

    until queue.empty?
        current_node = queue.shift 
        until !visited.include?(current_node)
            current_node = queue.shift
        end
        visited.add(current_node)
        next unless current_node.is_a?(GraphNode)
        current_node.neighbors.each do |neighbor|
            return neighbor if neighbor.value == target_value
            neighbor.neighbors.each do |new_neighbor|
                queue << new_neighbor
            end
        end
    end

    nil
end