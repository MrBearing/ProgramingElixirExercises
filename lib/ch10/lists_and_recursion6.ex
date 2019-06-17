'''
filter の実装には if 文使用OK
'''
defmodule MyEnum do

  def flatten(list), do: _flatten(list)
  defp _flatten([]), do: []
  defp _flatten([head | tail]) when is_list(head), do: _flatten(head) ++ _flatten(tail)
  defp _flatten([head | tail]), do: [head] ++ _flatten(tail)

end

"****flatten start ****" |> IO.puts()
MyEnum.flatten([ 1, [2,3,4] ,5,[[[6]]] ]) |> IO.inspect()

