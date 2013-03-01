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
    @workers.each{ |worker| worker.dig }
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
    def initialize(i,j)
      @i = i
      @j = j
    end
    
    def dig
      
    end
  end
end

maze = Maze.new(File.read('./data.txt'))
maze.run
p maze

