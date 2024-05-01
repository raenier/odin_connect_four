require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :players

  BOARD_SIZE = [6, 7].freeze

  def initialize
    @board = Board.new(*BOARD_SIZE)
    @players = [Player.new('white'), Player.new('black')]
  end

  def start
    until board.full?
      players.each do |player|
        board.drop_piece player.piece, player.move
        board.display
      end
    end
  end
end
