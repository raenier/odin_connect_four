class Board
  attr_accessor :size, :occupied_spaces

  def initialize(yval, xval)
    self.size = [yval, xval]
    self.occupied_spaces = {}
  end
end
