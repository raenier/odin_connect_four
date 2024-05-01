class Board
  attr_accessor :size, :cage

  def initialize(yval, xval)
    self.size = [yval, xval]
    self.cage = set_cage
  end

  def set_cage
    Array.new(size[0]) { Array.new(size[1]) }
  end

  def drop_piece(piece, column)
    cage.each do |row|
      return row[column] = piece unless row[column]
    end

    false
  end

  def display
    inner_string = "|---+---+---+---+---+---+---|\n"

    cage.reverse_each do |row|
      inner_string += '|'
      row.each do |piece|
        piece ||= ' '
        inner_string += " #{piece} |"
      end
      inner_string += "\n|---+---+---+---+---+---+---|\n"
    end

    puts inner_string
  end

  def full?
    return false if cage.last.any?(&:nil?)

    true
  end
end
