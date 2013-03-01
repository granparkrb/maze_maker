# coding: utf-8

class Maze
  def initialize(data)
    @workers = Array.new
    @data = data.split(/\n/).each_with_index do |line, i|
      line.split(//).each_with_index do |cell, j| 
        cell = Cell.new(cell)
        @workers.push Worker.new(i,j) if cell.entrance? 
      end
    end
    @data
  end

  def inspect
    @data.map { |line| line.map { |cell| cell.inspect }.join }.join("\n")
  end

  def run
    @workers.each{ |worker| worker.dig(self) }
  end

  class Cell
    def initialize(cell)
      @cell = cell
    end

    def inspect
      @cell
    end

    def wall?; @cell == "*"; end
    def entrance?; @cell == "e"; end
    def exit?; @cell == "e"; end
  end

  class Worker
    def initialize(row, col)
      @row = row
      @col = col
    end
    
    def dig(maze)
      pattern = {}
      pattern["upper-left"]  = [@row - 1, @col - 1] # 左上
      pattern["upper"]       = [@row - 1, @col    ] # 上
      pattern["upper-right"] = [@row - 1, @col + 1] # 右上
      pattern["left"]        = [@row    , @col - 1] # 左
      pattern["right"]       = [@row    , @col + 1] # 右
      pattern["lower-left"]  = [@row + 1, @col - 1] # 左下
      pattern["lower"]       = [@row + 1, @col    ] # 下
      pattern["lower-right"] = [@row + 1, @col + 1] # 右下

      

      # 上のセルは掘れる？
      row = pattern["upper"][0]
      col = pattern["upper"][1]
      maze[row][col].wall?

      pattern.each do |row, col|
        # 壁だったら次のパターン
        next if row < 0 || col < 0
        p row, col
      end
    end
  end
end

maze = Maze.new(File.read('./data.txt'))
maze.run
p maze

