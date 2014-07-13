# file: lib/test_calculator.rb
require 'minitest/autorun'
require 'shoulda/context'
require_relative 'problem_96'


class TestSudoku < Minitest::Test
  context 'a puzzle' do
    setup do
      @rows = [[0, 0, 3, 0, 2, 0, 6, 0, 0],
               [9, 0, 0, 3, 0, 5, 0, 0, 1],
               [0, 0, 1, 8, 0, 6, 4, 0, 0],
               [0, 0, 8, 1, 0, 2, 9, 0, 0],
               [7, 0, 0, 0, 0, 0, 0, 0, 8],
               [0, 0, 6, 7, 0, 8, 2, 0, 0],
               [0, 0, 2, 6, 0, 9, 5, 0, 0],
               [8, 0, 0, 2, 0, 3, 0, 0, 9],
               [0, 0, 5, 0, 1, 0, 3, 0, 0]]
      @puzzle = Puzzle.new(@rows)
    end


    should "parsed into rows" do
      assert_equal @puzzle.rows, @rows
    end

    should "parsed into columns" do
      assert_equal @puzzle.columns, @rows.transpose
    end

    should "parsed into boxes" do
      assert_equal( [[0, 0, 3, 9, 0, 0, 0, 0, 1],
                    [0, 2, 0, 3, 0, 5, 8, 0, 6],
                    [6, 0, 0, 0, 0, 1, 4, 0, 0],
                    [0, 0, 8, 7, 0, 0, 0, 0, 6],
                    [1, 0, 2, 0, 0, 0, 7, 0, 8],
                    [9, 0, 0, 0, 0, 8, 2, 0, 0],
                    [0, 0, 2, 8, 0, 0, 0, 0, 5],
                    [6, 0, 9, 2, 0, 3, 0, 1, 0],
                    [5, 0, 0, 0, 0, 9, 3, 0, 0]],
                   @puzzle.boxes)
    end

    should "recognize only one number is left and fill it in" do
      # Unknown numbers are recognized as 0.
      assert_equal(@puzzle.fill_in_last_box([0,1,2,3,4,5,6,7,8]),
                                            [9,1,2,3,4,5,6,7,8])

      assert_equal(@puzzle.fill_in_last_box([1,2,3,4,5,6,7,0,9]),
                                            [1,2,3,4,5,6,7,8,9])
    end

    should "simple solve sudoku" do
      puzzles = parse_text()
      simple_puzzle = puzzles[0]
      simple_solve(simple_puzzle)

      assert_equal([[4, 8, 3, 9, 6, 7, 2, 5, 1],
                    [9, 2, 1, 3, 4, 5, 8, 7, 6],
                    [6, 5, 7, 8, 2, 1, 4, 9, 3],
                    [5, 4, 8, 7, 2, 9, 1, 3, 6],
                    [1, 3, 2, 5, 6, 4, 7, 9, 8],
                    [9, 7, 6, 1, 3, 8, 2, 4, 5],
                    [3, 7, 2, 8, 1, 4, 6, 9, 5],
                    [6, 8, 9, 2, 5, 3, 4, 1, 7],
                    [5, 1, 4, 7, 6, 9, 3, 8, 2]], simple_puzzle.boxes)
    end
  end
end