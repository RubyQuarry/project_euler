# 2520 is the smallest number that can be divided by each
# of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly
# divisible by all of the numbers from 1 to 20?

def div_20_below(num)
  20.downto(1) do |n|
    if num % n != 0
      return false
    end
  end
  true
end

num = 1

loop do
  if div_20_below(num)
    puts num
    break
  end
  num += 1
end

