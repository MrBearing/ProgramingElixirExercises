defmodule MyString do
  def isASCII?(str),do: _isASCII?(str)

  defp _isASCII?([head]) when  ?\s <= head and head<=?~ do true end

  defp _isASCII?([ _ ] ) do false end
  defp _isASCII?([head | tail]) when  ?\s <= head and head<=?~ do
    _isASCII?(tail)
  end
  defp _isASCII?([_|_]), do: false
end

# true expected
MyString.isASCII?('ABCEDf adbd{}`P`{\'}  ~~~') |> IO.inspect()
# false expected
MyString.isASCII?('あいうえお') |> IO.inspect()
