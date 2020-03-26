defmodule Parallel do
  def pmap_hat(collection, fun)do
    me = self()

    collection
    |> Enum.map(fn (elem) ->
      spawn_link fn -> (send me, {self(), fun.(elem)}) end
    end)
    |> Enum.map(fn (pid) ->
      receive do{ ^pid, result} -> result end
    end)
  end
  def pmap_under(collection, fun)do
    me = self()
    collection
    |> Enum.map(fn (elem) ->
      spawn_link fn -> (send me, {self(), fun.(elem)}) end
    end)
    |> Enum.map(fn (pid) ->
      receive do{ _pid, result} -> result end
    end)
  end
end

import :timer, only: [sleep: 1]

Parallel.pmap_hat 1..100 ,&(&1 * &1)
|> IO.inspect(width: :infinity)
sleep 1_000
Parallel.pmap_under 1..100 ,&(&1 * &1)
|> IO.inspect(width: :infinity)


"""
iex(1)> c("WorkingWithMultipleProcess07.ex")
[Parallel]
iex(2)> Parallel.pmap 1..50 ,&(&1 * &1)
"""
