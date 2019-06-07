defmodule Swapper do
  @moduledoc false
  def swap([]),do: []
  def swap([a , b | tail]), do: [b,a|swap(tail)]
  def swap([ _ ]),do: raise "Cant swap a list with an odd number"
end
