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