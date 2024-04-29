class Board
  attr_accessor :size, :occupied_spaces

  def initialize(yval, xval)
    self.size = [yval, xval]
    self.occupied_spaces = {}
  end

  def put_piece(piece_value, yval, xval)
    return 'Invalid Move' if yval.negative? || yval >= size[0] || xval.negative? || xval >= size[1]

    occupied_spaces[[yval, xval]] = piece_value
  end
end
