class GraphNode
	
	attr_accessor :value, :neighbors

	def initialize(value)
		@value = value
		@neighbors = Array.new
	end

end

#Array works but Set does not...why...?
def bfs(starting_node, target_value, visited = Set.new() )
# def bfs(starting_node, target_value, visited = Array.new() )
	
	val = starting_node.value
	return nil if visited.include?(val)
	puts val
	visited.add(starting_node.value)
	# visited << (starting_node.value)

	return val if val == target_value
	starting_node.neighbors.each do |neighbor|
		neighbor_val = bfs(neighbor, target_value, visited)
		return neighbor_val if !neighbor_val.nil?
	end
	nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "f")