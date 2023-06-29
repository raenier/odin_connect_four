class Player
  attr_reader :piece

  def initialize(piece_color)
    @piece = piece_color
  end

  def player_input
    input = gets
    while (input.length != 2 || input.to_i.to_s != input)
      input = gets
    end
  end

  def move
    player_input.split('').map(&:to_i)
  end
end
