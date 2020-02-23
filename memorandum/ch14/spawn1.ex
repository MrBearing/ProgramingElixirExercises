defmodule Spawn1 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}"}
    end
  end
end

"""
iex(8)> pid = spawn(Spawn1, :greet, [])
#PID<0.128.0>
iex(9)> send pid, {self, "World"}
{#PID<0.105.0>, "World"}
iex(10)> receive do
...(10)> {:ok, message}
...(10)>    IO.puts message
...(10)> end
Hello, World
:ok
iex(11)>
"""
