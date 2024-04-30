class Board
  attr_accessor :size, :cage

  def initialize(yval, xval)
    self.size = [yval, xval]
    self.cage = set_cage
  end

  def set_cage
    Array.new(size[0]) { Array.new(size[1]) }
  end

  def put_piece(piece_value, yval, xval)
    return 'Invalid Move' if yval.negative? || yval >= size[0] || xval.negative? || xval >= size[1]
    return 'Already Occupied' if occupied_spaces[[yval, xval]]

    occupied_spaces[[yval, xval]] = piece_value
  end
end
