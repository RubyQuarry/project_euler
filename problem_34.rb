# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

class Integer
  def factorial
    (1..self).to_a.inject(1) { |sum, num| sum * num  }
  end


end

list = []
3.upto(1_000_000) do |num|
  list << num if num.to_s.split("").map(&:to_i).map(&:factorial).inject(:+) == num
end

puts list.inject(:+)
