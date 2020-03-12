defmodule Parallel do
  def pmap(collection, fun)do
    me = self()
    IO.puts(" me :#{inspect me}")
    collection
    |> Enum.map(fn (elem) ->
      IO.puts("enume: #{inspect self()}")
      spawn_link fn ->
        IO.puts("spawn: #{inspect self()}")
        (send me, {self(), fun.(elem)})
      end
    end)
    |> Enum.map(fn (pid) ->
      receive do{^pid, result} -> result end
    end)
  end
end


"""
selfのスコープが異なるので、メインのプロセスのpidを別途取得する必要がある

iex(1)> c("WorkingWithMultipleProcess06.ex")
[Parallel]
iex(2)> Parallel.pmap 1..5 ,&(&1 * &1)
 me :#PID<0.105.0>
enume: #PID<0.105.0>
enume: #PID<0.105.0>
spawn: #PID<0.177.0>
enume: #PID<0.105.0>
spawn: #PID<0.178.0>
enume: #PID<0.105.0>
spawn: #PID<0.179.0>
enume: #PID<0.105.0>
spawn: #PID<0.180.0>
spawn: #PID<0.181.0>
[1, 4, 9, 16, 25]

"""
