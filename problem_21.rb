sum = 0
(1..10_000).to_a.each do |num|
  num.downto(1) do |elem|
    if num % elem == 0
      sum += elem if num != elem
    end
  end
end

puts sum
