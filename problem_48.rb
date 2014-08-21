# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.


series = Enumerator.new do |yielder|
  sum = 0
  num = 1
  loop do
    sum += num ** num
    yielder.yield(sum)
    num += 1
  end
end
puts series.take(1000).last % (10 ** 10)
