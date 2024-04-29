require 'board'

class Game
  attr_reader :board

  BOARD_SIZE = [6, 7].freeze

  def initialize
    @board = Board.new(*BOARD_SIZE)
  end
end
