require_relative "00_tree_node"

class KnightPathFinder
  def initialize(start = [0,0])
    @current_pos = start
    @grid = Array.new(8) {Array.new(8)}
    @visited_pos = [start]
    @current_options = []
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def self.valid_moves(pos)
    x, y = pos

    @current_options = [[x - 1, y - 2], [x + 1, y - 2], [x + 1, y + 2], [x - 1, y + 2], [x - 2, y - 1], [x + 2, y - 1], [x + 2, y + 1], [x - 2, y + 1]]
  end

end
