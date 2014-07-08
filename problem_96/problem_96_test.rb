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
      assert_equal [[0, 0, 3, 9, 0, 0, 0, 0, 1],
                    [0, 0, 8, 7, 0, 0, 0, 0, 6],
                    [0, 0, 2, 8, 0, 0, 0, 0, 5],
                    [0, 2, 0, 3, 0, 5, 8, 0, 6],
                    [1, 0, 2, 0, 0, 0, 7, 0, 8],
                    [6, 0, 9, 2, 0, 3, 0, 1, 0],
                    [6, 0, 0, 0, 0, 1, 4, 0, 0],
                    [9, 0, 0, 0, 0, 8, 2, 0, 0],
                    [5, 0, 0, 0, 0, 9, 3, 0, 0]],
                   @puzzle.boxes
    end

    should "recognize only one number is left and fill it in" do
      # Unknown numbers are recognized as 0.
      assert_equal(@puzzle.fill_in_last_box([0,1,2,3,4,5,6,7,8]),
                                            [9,1,2,3,4,5,6,7,8])

      assert_equal(@puzzle.fill_in_last_box([1,2,3,4,5,6,7,0,9]),
                                            [1,2,3,4,5,6,7,8,9])
    end

    should "find appropriate starter column and row associated with \\
            given block" do
      assert_equal([0,0], @puzzle.can_1(0))
      assert_equal([6,6], @puzzle.can_1(8))
      assert_equal([3,6], @puzzle.can_1(5))
    end
  end
end