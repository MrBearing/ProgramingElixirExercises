defmodule MyCalcCheet do
  def calculate(formula),do: _calculate(formula)

  def _calculate(formula) do
    # これはズルすぎろのでやめよう。。。
    {a,[]}= Code.eval_string(formula)
    a
  end
end

defmodule MyCalc do
  def calculate(formula),do: _calculate(formula,[])

  def _calculate([?+ | b], a )do
    number_digits(a) + number_digits(b)
  end

  def _calculate([?- | b], a )do
    number_digits(a) - number_digits(b)
  end

  def _calculate([?/ | b], a )do
    number_digits(a) / number_digits(b)
  end

  def _calculate([?* | b], a )do
    number_digits(a) * number_digits(b)
  end

  def _calulate([?\s | b], a)do
    IO.inspect(b)
    _calculate(b,a)
  end

  def _calculate([head | b], a ) do
#      IO.inspect(b)
      _calculate(b, a ++ [head])
  end

  def number_digits(num_list), do: _number_digits(num_list,0)

  defp _number_digits([],value) , do: value
  defp _number_digits([?\s| tail],value), do: _number_digits(tail,value)
  defp _number_digits([digit| tail] ,value)
    when digit in '0123456789' do
    _number_digits(tail , value*10 + digit - ?0 )
  end
  defp _number_digits([non_digit | _ ] , _),do: raise "Invalid digits '#{[non_digit]}}'"

end

IO.puts('this is cheet way')
MyCalcCheet.calculate('123 + 27') |> IO.inspect()
MyCalcCheet.calculate('123 * 27') |> IO.inspect()
MyCalcCheet.calculate('120 / 30') |> IO.inspect()
MyCalcCheet.calculate('123 - 27') |> IO.inspect()

IO.puts('this is non-cheet way')
MyCalc.calculate('123     +    27') |> IO.inspect()
MyCalc.calculate('123 * 27') |> IO.inspect()
MyCalc.calculate('123 - 27') |> IO.inspect()
MyCalc.calculate('120 / 30') |> IO.inspect()



