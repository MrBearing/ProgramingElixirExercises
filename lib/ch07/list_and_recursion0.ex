defmodule MyList0 do
  @moduledoc false
  def sum([]) , do: 0
  def sum([head | tail]) ,do: head + sum(tail)
end

IO.puts MyList0.sum([1,2,3,4,5])
