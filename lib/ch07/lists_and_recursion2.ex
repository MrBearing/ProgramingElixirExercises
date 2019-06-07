defmodule MyList do
  @moduledoc false

  def max([head | tail]), do: _max(tail,head)
  def _max([head | tail], value) when value > head ,do: _max(tail,value)
  #  def _max([head | tail], value) when value < head ,do: _max(tail,head)
  # ↑この実装をするとmaxの値がリスト中に複数あった場合にエラーとなる
  def _max([head | tail], value) ,do: _max(tail,head)
  def _max([], value),do: value
end

IO.puts( MyList.max( [1,3,4,56,7,10,56,56,56,56,10] ) )
IO.puts( MyList.max( [56,7,10,3,4,6] ) )
IO.puts( MyList.max( [-1,-3,-4,-56,-7,-10] ) )
