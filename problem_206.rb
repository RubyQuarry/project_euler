# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

num = 1389026620
until (num ** 2).to_s =~ /1.2.3.4.5.6.7.8.9.0/
  num -= 10
end

puts num