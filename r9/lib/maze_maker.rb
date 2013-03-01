class Maze
  def initialize(data)
    @data = data.split(/\n/).map { |line| line.split(//).map { |cell| Cell.new(cell) } }
    @data
  end

  def inspect
    @data.map { |line| line.map { |cell| cell.inspect }.join }.join("\n")
  end

  def worker
    workers = []
    @data.each do |line|
      line.each do |cell|
        cell.work?
  end

  def run
    @data.
  end

  class Cell
    def initialize(cell)
      @cell = cell
      if entrance?
        @work = Worker.new
      elsif exit?
        @work = Worker.new
      end
    end

    def inspect
      @cell
    end

    def wall?; @cell == "*"; end
    def entrance?; @cell == "e"; end
    def exit?; @cell == "e"; end
  end

  class Worker
  end
end

maze = Maze.new(File.read('./data.txt'))
maze.run
p maze

