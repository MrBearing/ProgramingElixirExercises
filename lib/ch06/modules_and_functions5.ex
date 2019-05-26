defmodule ModuleAndFunction5 do
  @moduledoc false
  def gcd(x , 0) do  x end
  def gcd(x , y) do  gcd(y, rem(x,y) )  end
end


IO.puts ModuleAndFunction5.gcd( 693 ,278)
IO.puts ModuleAndFunction5.gcd( 27 ,33)


