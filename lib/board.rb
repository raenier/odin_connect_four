class Board
  attr_accessor :size, :occupied_spaces

  def initialize(yval, xval)
    self.size = [yval, xval]
    self.occupied_spaces = {}
  end

  def put_piece(piece_value, yval, xval)
    occupied_spaces[[yval, xval]] = piece_value
  end
end
