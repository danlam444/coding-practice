class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end
end

# Setting up the tree
root = Node.new('a')
root.left = Node.new('b')
root.right = Node.new('c')
root.left.left = Node.new('d')
root.left.right = Node.new('e')
root.right.left = Node.new('f')
root.right.right = Node.new('g')

def dfs(node, value)
  puts node.value	
  return true if node.value == value
  left = dfs(node.left, value) if node.left
  return left if left
  right = dfs(node.right, value) if node.right
  left or right
end

def traverse_df(node)
  puts node.value	
  traverse_df(node.left) if node.left
  traverse_df(node.right) if node.right
end

def bfs(root, value)
  queue = []
  queue << root
  while queue.size != 0 do 
  	node = queue.shift
  	puts node.value
  	return true if node.value == value
  	queue << node.left
  	queue << node.right
  end
end

def traverse_bf(root)
  queue = []
  queue << root
  while queue.size != 0
  	node = queue.shift
  	puts node.value
  	queue << node.left if node.left
  	queue << node.right if node.right
  end
end

puts "depth first search:"
puts dfs(root, 'a')
puts '============='
puts dfs(root, 'b')
puts '============='
puts dfs(root, 'c')
puts '============='
puts dfs(root, 'd')
puts '============='
puts dfs(root, 'e')
puts '============='
puts dfs(root, 'f')
puts '============='
puts dfs(root, 'f')

puts "traversing depth first"
traverse_df(root)

puts "breadth first search"
bfs(root, 'g')
puts '============='
bfs(root, 'c')

puts "traversing breadth first"
traverse_bf(root)