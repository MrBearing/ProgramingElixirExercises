defmodule MyList do
  @moduledoc false
  def caesar(list ,n ) , do: _caesar(list, n)
  # A-Z 65-90 ,a-z : 97-122
  def _caesar([head|tail],n) when head + n <= 122 ,do: [head + n | _caesar(tail,n) ]
  def _caesar([head|tail],n) ,do: [(head-26+n) | _caesar(tail,n) ]
  def _caesar([], _),do: []
  #abcdefghijklmnopqr
end

IO.puts( MyList.caesar('ryvkve',13))