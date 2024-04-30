class Board
  attr_accessor :size, :cage

  def initialize(yval, xval)
    self.size = [yval, xval]
    self.cage = set_cage
  end

  def set_cage
    Array.new(size[0]) { Array.new(size[1]) }
  end

  def drop_piece(piece, column)
    cage.each do |row|
      return row[column] = piece unless row[column]
    end

    false
  end
end
