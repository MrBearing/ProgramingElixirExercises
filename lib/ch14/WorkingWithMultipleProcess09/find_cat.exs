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
      {:count_word, file_name, search_string, client} ->
        send client,{:answer , count(file_name, search_string), self()}
        count_word(scheduler)
      {:shutdown} ->
        exit(:nomal)
    end
  end

  def count(file_path, search_string) do
    file_str = File.read!(file_path)
    r = Regex.compile!(search_string)
    Regex.scan(r ,file_str)
    |> length
  end

end

defmodule Scheduler do

  def run(num_process, module, func , queue ,arg) do
    (1..num_process)
    |> Enum.map(fn(_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(queue,arg,[])
  end

  # もう少し汎用的なスケジューラーを作りたい。。。
  # 引数を工夫することでできないだろうか。。
  def schedule_processes(processes, queue , word , results)do
    receive do
      {:ready, pid} when queue != [] ->
        [next | tail] = queue
        send pid, {:count_word, next, word, self()}
        schedule_processes(processes, tail, word, results)
      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes,pid), queue, word, results)
        else
          results |> Enum.reduce(0, fn(x, acc) -> x + acc end)
        end
      {:answer, count_result, _pid } ->
        schedule_processes(processes, queue, word, [ count_result| results])
    end
  end
end

dir = "./files/"
File.cd!(dir)
file_path_list = File.ls!()
search_word = "cat"

Enum.each 1..16, fn num_processes ->
  {time, result} = :timer.tc(
    Scheduler, :run,
    [num_processes, WordCounter, :count_word , file_path_list , search_word]
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

"""
elixir find_cat.exs
8

 #   time(s)
 1      0.02
 2      0.01
 3      0.01
 4      0.01
 5      0.01
 6      0.01
 7      0.01
 8      0.01
 9      0.01
10      0.01
11      0.01
12      0.01
13      0.01
14      0.01
15      0.01
16      0.01
"""
