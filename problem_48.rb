# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.
# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

pentagonal = Enumerator.new do |yielder|
  num = 1
  sum = 0
  loop do
    sum += num ** num
    yielder.yield(sum)
    num += 1
  end
end

puts pentagonal.first(1_000).last % (10 ** 10)
