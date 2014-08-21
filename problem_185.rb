# 39542
a = %w{
90342;2
70794;0
39458;2
34109;1
51545;2
12531;1}


puts a.map { |item| item.split(';').map(&:to_i) }.to_s

proper_num 