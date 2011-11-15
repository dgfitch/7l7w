class Tree
  attr_accessor :children, :node_name

  def initialize(name, hash)
    @node_name = name
    @children = hash.map { |k,v| Tree.new(k,v) }
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end

  def to_s
    @node_name
  end
end


family = {
    'grandpa' => {
      'dad' => {
        'child1' => {},
        'child2' => {}
      },
      'uncle' => {
        'child3' => {},
        'child4' => {}
      }
    }
  }

genes = Tree.new('root', family)

genes.visit_all {|n| puts n}
