# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a^2 + b^2 = c^2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

one_to_100 = (1..100).to_a.permutation(2).to_a


one_to_100.map  do |arr|
  m, n = arr[0], arr[1]
  a = n**2 - m**2
  b = 2 * m * n
  c = m ** 2 + n ** 2
  puts "#{a} #{b} #{c} #{a* b* c} " if a + b + c == 1000
end

