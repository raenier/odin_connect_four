# frozen_string_literal: true

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
        move = []
        loop do
          move = [player.piece.slice(0), player.move]
          break if board.drop_piece(*move)
        end
        board.display

        return puts("#{move[0]} wins the game!") if win?(*move)
      end
    end

    puts 'Game is draw!' if board.full?
  end

  def win?(piece, column)
    check_vertical(piece, column)
  end

  def check_vertical(piece, column)
    total =
      board.cage.reduce(0) do |sum, row|
        next sum if row[column].nil?
        break if row[column] != piece

        sum + 1
      end

    total == 4
  end
end
