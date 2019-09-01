defmodule FizzBuzz do
  def upto(n) when n > 0, do: _upto(1, n, [])
  defp _upto(_current, 0, result), do: Enum.reverse result
  defp _upto(current ,left ,result) do
    case {rem(current, 3), rem(current,5) } do
        { 0, 0 } -> _upto(current + 1,  left-1 , ["FizzBuzz" | result])
        { 0, _ } -> _upto(current + 1,  left-1 , ["Fizz" | result])
        { _, 0 } -> _upto(current + 1,  left-1 , ["Buzz" | result])
        { _, _ } -> _upto(current + 1,  left-1 , [current | result])
      end
  end
end


FizzBuzz.upto(20) |> IO.inspect()