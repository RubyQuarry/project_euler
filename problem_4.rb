# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.
require 'prime'

class Integer
  def palindrome
    self.to_s.reverse == self.to_s
  end
end

puts (100..999).to_a.permutation(2).to_a.map { |arr| arr[0] * arr[1] }.
                                         select { |num| num.palindrome }.max

