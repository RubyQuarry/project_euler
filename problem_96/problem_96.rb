# Su Doku (Japanese meaning number place) is the name given to a popular
# puzzle concept. Its origin is unclear, but credit must be attributed to
# Leonhard Euler who invented a similar, and much more difficult, puzzle
# idea called Latin Squares. The objective of Su Doku puzzles, however,
# is to replace the blanks (or zeros) in a 9 by 9 grid in such that each
# row, column, and 3 by 3 box contains each of the digits 1 to 9. Below
# is an example of a typical starting puzzle grid and its solution grid.

# A well constructed Su Doku puzzle has a unique solution and can be solved
# by logic, although it may be necessary to employ "guess and test" methods
# in order to eliminate options (there is much contested opinion over this).
# The complexity of the search determines the difficulty of the puzzle; the
# example above is considered easy because it can be solved by straight forward
# direct deduction.

# By solving all fifty puzzles find the sum of the 3-digit numbers found in the
# top left corner of each solution grid; for example, 483 is the 3-digit number
# found in the top left corner of the solution grid above.

# https://projecteuler.net/problem=96


class Puzzle
  attr_accessor :rows

  def initialize(rows)
    @rows = rows
  end

  def print
    @rows.each do |row|
      puts row
    end
  end

  def [](index)
    @rows[0]
  end

  def to_column
    @rows.to_a
  end
end

module Sudoku
  SUDOKU_NUMBERS = (1..9).to_a

  def self.remaining_numbers(array)
    SUDOKU_NUMBERS - array
  end
end


class Row
  include Sudoku

  def initialize(row)
    @row = row
  end

  def remaining_numbers
    Sudoku::remaining_numbers(@row)
  end

  def to_s
    @row.to_s
  end

  def to_a
    [@row]
  end

  def[](index)
    @row[index]
  end
end

class Column
  def initialize(cols)
    @cols = cols
  end
end

Rows = []
Puzzles = []

File.foreach('sudoku.txt') do |file|
  if file =~ /[0-9]{9}/
    if Rows.length < 9
      Rows << file.split("")[0..8].map(&:to_i)
    end
  end
end

puts Rows.transpose.to_s