require_relative "00_tree_node"
require "byebug"

class KnightPathFinder
attr_reader :current_options

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
    # byebug
    all = [[x - 1, y - 2], [x + 1, y - 2], [x + 1, y + 2], [x - 1, y + 2], [x - 2, y - 1], [x + 2, y - 1], [x + 2, y + 1], [x - 2, y + 1]]
    all.select do |pos|
      pos[0].between?(0, 7) && pos[1].between?(0,7)
    end
  end

  def new_move_positions(pos)
    @current_options = KnightPathFinder.valid_moves(pos)
    @current_options.reject! do |el|
      @visited_pos.include?(el)
    end
    
  end

end

testing = KnightPathFinder.new
p KnightPathFinder.valid_moves([0,0])
