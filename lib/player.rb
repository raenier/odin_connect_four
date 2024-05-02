# frozen_string_literal: true

class Player
  attr_reader :piece

  def initialize(piece_color)
    @piece = piece_color
  end

  def move
    gets.to_i
  end
end
