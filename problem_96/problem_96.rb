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


module Sudoku
  SUDOKU_NUMBERS = (1..9).to_a
  def self.remaining_numbers(array)
    SUDOKU_NUMBERS - array
  end
end


class Puzzle
  include Sudoku
  attr_accessor :rows, :columns, :boxes

  def initialize(rows)
    @rows = rows
    @columns = @rows.transpose # flip the rows to columns.
    @boxes = Array.new
    convert_to_boxes
  end

  def convert_to_boxes
    iterate = [(0..2), (3..5), (6..8)]
    arr = []
    square_value = 9
    iterate.each do |iter|
      square_value.times do |num|
        square_value.times do |num2|
          if iter.include?(num2)
            arr << @rows[num][num2]
          end
        end
      end
      @boxes << Array.new(arr)
      arr.clear
    end
    @boxes.map! { |box| box.each_slice(9).to_a }.flatten!(1)
    box = []
    mappings = [0, 3, 6, 1, 4, 7, 2, 5, 8]
    mappings.each do |map|
      box << @boxes[map]
    end
    @boxes = box
  end

  def row_remaining(num)
    Sudoku::remaining_numbers(@rows[num])
  end

  def fill_in_last_box(arr)
    if arr.count(0) == 1
      sum = 45 # Sum of sudoku row.
      num = arr.inject(sum, :-)
      arr.map! { |x| x == 0? num : x }
    end
  end

  def can_solve(box_num)
    box = @boxes[box_num]
    start_column = (box_num % 3) * 3
    start_row = (box_num / 3) * 3
    col = @columns[start_column]
    row = @rows[start_row]
    fill_count = box.count(0) # Number of unfilled spaces in box.
    current_column = -1
    current_row = -1
    1.upto(9) do |number|
      arr = Array.new
      box.each_with_index do |num, index|
        next if num != 0
        box = @boxes[box_num]
        current_column = (start_column + (index % 3))
        current_row = (start_row + (index / 3))
        col = @columns[current_column]
        row = @rows[current_row]
        unless box.include?(number) || col.include?(number) || row.include?(number)
          arr << [index, current_column, current_row]
        end
      end
      if arr.count == 1
        puts "found #{number}"
        pos = arr[0][0]
        box[pos] = number
        @boxes[box_num] = box
        @columns[arr[0][1]][((box_num / 3) * 3) + (pos / 3)] = number
        @rows[arr[0][2]][((box_num % 3) * 3) + (pos % 3)] = number

        puts @boxes[box_num].to_s
        puts @columns[arr[0][1]].to_s
        puts @rows[arr[0][2]].to_s
      end
    end
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

p = Puzzle.new(Rows)


while p.boxes.include?(0) do
  0.upto(8) do |b|
    p.can_solve(b)
  end
end


puts p.boxes.to_s