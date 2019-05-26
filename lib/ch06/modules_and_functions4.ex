defmodule ModuleAndFunction4 do
  @moduledoc false
  def sum(1) do 1 end
  def sum( a ) do a + sum( a - 1) end
end

IO.puts ModuleAndFunction4.sum(10)
IO.puts ModuleAndFunction4.sum(100)
IO.puts ModuleAndFunction4.sum(1000)
