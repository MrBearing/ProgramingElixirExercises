# defmodule  FibSolver do
#   def fib(scheduler) do
#     send scheduler, {:ready, self()}
#     receive do
#       {:find_cat,n ,client} ->
#         send client,{:answer , n ,fib_calc(n), self()}
#         fib( scheduler)
#       {:shutdown} ->
#         exit(:nomal)
#     end
#   end

#   defp fib_calc(0), do: 0
#   defp fib_calc(1), do: 1
#   defp fib_calc(n), do: fib_calc(n-1) + fib_calc(n-2)
# end

defmodule WordCounter do
  def count_word(scheduler) do
    send scheduler, {:ready, self()}
    receive do
      {:count_word, n, file_name, search_string,client} ->
        send client,{:answer , n ,count(n), self()}
        count_word( scheduler)
      {:shutdown} ->
        exit(:nomal)
    end
  end

  def

  def count_(file_path, search_string) do
    file_str = File.read!(file_path)
    r = Regex.compile!(search_string)
    Regex.scan(r ,file_str) |> length
  end

end

defmodule Scheduler do

  def run(num_process, module, func , files) do
    (1..num_process)
    |> Enum.map(fn(_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, [])
  end

  def schedule_processes(processes, queue, results)do
    receive do
      {:ready, pid} when length(queue) > 0 ->
        [next | tail] = queue
        send pid, {:count_word, next, self()}
        schedule_processes(processes, tail, results)
      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes,pid), queue, results)
        else
          Enum.sort(results,fn {n1,_}, {n2,_} -> n1 <= n2 end)
        end
      {:answer, number, result, _pid }->
        schedule_processes(processes, queue, [{number, result} | results])
    end
  end
end

dir = "./files/"
file_path_list = File.ls!(dir) |> Enum.map(fn file_name -> dir <> file_name end )
IO.inspect(file_path_list)
Enum.each 1..16, fn num_processes ->
  {time, result} = :timer.tc(
    Scheduler, :run,
    [num_processes, WordCounter, :count_word , file_path_list]
  )
  if num_processes == 1 do
    IO.puts inspect result
    IO.puts "\n #   time(s)"
  end
  :io.format "~2B      ~.2f~n",[num_processes, time/1000000.0]
end

"""
文字列のカウントは
Regex.scan(~r{"\id\":}, s) |> length
r = Regex.compile!("cat")
Regex.scan(r ,test) |> length
を使えば良さそう。

乱暴だけど、
|> String.split("id") |> length - 1
このパターンも
"""
