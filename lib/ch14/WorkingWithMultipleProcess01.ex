defmodule Chain do
  def counter(next_pid) do
    receive do
      n ->
        send next_pid, n + 1
    end
  end

  def create_processes(n) do
    last = Enum.reduce 1..n, self(),
            fn (_,send_to) ->
              spawn(Chain, :counter, [send_to])
            end
    send last, 0
    receive do
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
  end
end


"""
$ elixir -r WorkingWithMultipleProcess01.ex  -e "Chain.run(10)"
{3227, "Result is 10"}

$ elixir -r WorkingWithMultipleProcess01.ex  -e "Chain.run(100)"
{4381, "Result is 100"}

$ elixir -r WorkingWithMultipleProcess01.ex  -e "Chain.run(1000)"
{7719, "Result is 1000"}

$ elixir -r WorkingWithMultipleProcess01.ex  -e "Chain.run(10000)"
{54975, "Result is 10000"}

$ elixir -r WorkingWithMultipleProcess01.ex  -e "Chain.run(100_000)"
{521532, "Result is 100000"}


以下は実行するとエラー
$ elixir -r WorkingWithMultipleProcess01.ex  -e "Chain.run(400_000)"
16:31:35.483 [error] Too many processes

--erlオプションで
elixir  --erl "+P 1000000" -r WorkingWithMultipleProcess01.ex  -e "Chain.run(400_000)"
{2126399, "Result is 400000"}
$ elixir  --erl "+P 1000000" -r WorkingWithMultipleProcess01.ex  -e "Chain.run(1_000_000)"
{5252547, "Result is 1000000"}
"""

