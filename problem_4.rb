# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.


class Integer
  def palindrome?
    self.to_s == self.to_s.reverse
  end
end

puts (100..999).to_a.permutation(2).map{ |arr|  arr[0] * arr[1] }.
  select { |num| num.palindrome? }.max