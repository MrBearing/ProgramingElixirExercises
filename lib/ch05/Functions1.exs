IO.puts "program start"

list_concat = fn (a , b) -> a++b end
ans = list_concat.([:a, :b], [:c,:d])
IO.inspect ans # IO.puts はlistに使えない

sum = fn (a , b , c) -> a+b+c end
s = sum.(1,2,3)
IO.puts s


pair_tuple_to_list = fn ( { tup , le } ) -> [tup, le]  end
IO.inspect pair_tuple_to_list.({1234, 5678})