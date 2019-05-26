list_concat = fn (a , b) -> a++b end
concat = list_concat.([:a, :b], [:c,:d])
IO.puts concat

sum = fn (a , b , c) -> a+b+c end
ans = sum.(1,2,3)
IO.puts ans


