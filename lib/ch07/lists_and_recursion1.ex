defmodule MyList do
  @moduledoc false

  def mapsum(list ,func)do
    _mapsum(list,func)
  end

  def _mapsum([],_),do: 0
  def _mapsum([head | tail],func),do: func.(head) + _mapsum(tail,func)
end


IO.puts( MyList.mapsum( [1,2,3], &(&1 * &1) ) )