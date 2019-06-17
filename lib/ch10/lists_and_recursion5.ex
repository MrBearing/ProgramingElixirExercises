'''
filter の実装には if 文使用OK
'''
defmodule MyEnum do
  def all?( list , some_func), do: _all?(list , some_func)
  defp _all?([] , _ ) , do: true
  defp _all?([head | tail ],some_func)do
     some_func.(head) && _all?(tail,some_func)
  end


  def each(list, some_func ), do: _each(list,some_func )
  defp _each([el] , some_func), do: el |> some_func.()
  defp _each([head | tail ] , some_func ) do
    head |> some_func.()
    _each(tail,some_func)
  end

  def filter(list, some_func),do: _filter(list, some_func)
  defp _filter([],_ ), do: []
  defp _filter([head | tail], some_func) do
    if some_func.(head) do
        [head]++_filter(tail,some_func)
    else
      _filter(tail,some_func)
    end
  end


  def split(list, marker),do: _split(list,[] , marker)

  defp _split([head | tail] , first_list , marker) when head == marker ,
       do: [ first_list ++ [head] , tail]

  defp _split([head | tail] , first_list , marker) do
    _split(tail, first_list++[head] , marker)
  end

  def take(list , num), do: _take(list,num)
  defp _take(_ , num ) when num == 0, do: []
  defp _take([head | tail] , num ) do
     [head] ++  _take(tail, num-1)
  end


end

list = Enum.to_list(23..155)

"****each****" |> IO.puts()
MyEnum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)

"****all?****" |> IO.puts()
MyEnum.all?(list , &(&1 > 20))  |> IO.inspect()
MyEnum.all?(list , &(&1 > 100)) |> IO.inspect()

"****split****" |> IO.puts()
MyEnum.split(list , 33) |> IO.inspect()
MyEnum.split(list , 155) |> IO.inspect()

"****filter****" |> IO.puts()
MyEnum.filter(list,  &(&1 > 140)) |> IO.inspect()
MyEnum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end) |> IO.inspect()

"****take****" |> IO.puts()
MyEnum.take(list,24) |> IO.inspect()
