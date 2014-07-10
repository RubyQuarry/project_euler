# The sum of the squares of the first ten natural numbers is,
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

one_to_one_hundred = (1..100).to_a

sum_of_separate_squares = one_to_one_hundred.map { |num| num ** 2 }.inject(:+)

sum_of_summed_squares = one_to_one_hundred.inject(:+) ** 2

puts "difference: ", sum_of_summed_squares - sum_of_separate_squares