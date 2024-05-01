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
    puts "Game starts now, put your piece #{players.first.piece} player!"

    until board.full?
      players.each do |player|
        loop { break if board.drop_piece(player.piece.slice(0), player.move) }
        board.display
      end
    end
  end
end
