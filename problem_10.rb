# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

class Integer
  def prime?
    return false if self.even?
    (self - 1).downto(2) do |div|
      return false if self % div == 0
    end
    true
  end
end

primes = Enumerator.new do |yielder|
  num = 2
  loop do
    yielder.yield(num) if num.prime?
    num +=1
  end
end



puts primes.take(10001).last