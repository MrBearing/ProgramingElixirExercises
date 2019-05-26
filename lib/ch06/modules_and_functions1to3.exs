defmodule Times do
  @moduledoc false
  def double(n) do
    n * 2
  end
  def triple(n) do
    n * 3
  end
  def quadruple(n) do
    double( double(n))
  end
end

IO.puts Times.double(10)
IO.puts Times.triple(10)
IO.puts Times.quadruple(10)

