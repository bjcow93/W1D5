class PolyTreeNode
attr_reader :parent, :children, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def parent=(p_value)
    @parent.children.delete(self) unless @parent.nil?
    @parent = p_value
    @parent.children << self unless @parent.nil? || @parent.children.include?(self)
  end

  def children
    @children
  end

  def value
    @value
  end

  def add_child(child_node)
    @children.push(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "You can't do that" unless @children.include?(child_node)
    @children.delete(child_node)
    child_node.parent = nil
  end

  def inspect
    return "#<node name: #{self.value}, children: #{self.children}, parents: #{self.parent} "
  end

  def dfs(target_value)
    return nil if self.nil?
    return self if self.value == target_value

    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = []
    queue << self
    queue.each do |node|
      if node.value == target_value
        return node
      else
        node.children.each do |kiddo|
          queue << kiddo
        end
      end
    end
    nil
  end

end
