fizz_buzz = fn
  ( 0 , 0 , _ ) -> "FizzBuzz"
  ( 0 , _ , _ ) -> "Fizz"
  ( _ , 0 , _ ) -> "Buzz"
  ( _ , _ , b ) -> b
end

IO.puts fizz_buzz.(0,0,10)
IO.puts fizz_buzz.(0,20,10)
IO.puts fizz_buzz.(4,0,10)
IO.puts fizz_buzz.(3,5,10)