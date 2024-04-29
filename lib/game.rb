require 'board'
require 'player'

class Game
  attr_reader :board, :players

  BOARD_SIZE = [6, 7].freeze

  def initialize
    @board = Board.new(*BOARD_SIZE)
    @players = [Player.new('white'), Player.new('black')]
  end
end
