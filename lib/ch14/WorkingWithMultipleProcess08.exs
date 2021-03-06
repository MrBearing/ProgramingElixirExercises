defmodule  FibSolver do
  def fib(scheduler) do
    send scheduler, {:ready, self()}
    receive do
      {:fib,n,client} ->
        send client,{:answer , n ,fib_calc(n), self()}
        fib( scheduler)
      {:shutdown} ->
        exit(:nomal)
    end
  end

  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1
  defp fib_calc(n), do: fib_calc(n-1) + fib_calc(n-2)
end

defmodule Scheduler do

  def run(num_process, module, func , to_calculate ) do
    (1..num_process)
    |> Enum.map(fn(_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, [])
  end

  def schedule_processes(processes, queue, results)do
    receive do
      {:ready, pid} when length(queue) > 0 ->
        [next | tail] = queue
        send pid, {:fib, next, self()}
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

to_process = [37, 37, 37, 37, 37, 37, ]

Enum.each 1..16, fn num_processes ->
  {time, result} = :timer.tc(
    Scheduler, :run,
    [num_processes, FibSolver, :fib, to_process]
  )
  if num_processes == 1 do
    IO.puts inspect result
    IO.puts "\n #   time(s)"
  end
  :io.format "~2B      ~.2f~n",[num_processes, time/1000000.0]
end


"""
[{37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}]

 #   time(s)
 1      4.72
 2      2.41
 3      1.60
 4      1.60
 5      1.58
 6      0.81
 7      0.82
 8      0.80
 9      0.80
10      0.81
11      0.81
12      0.80
13      0.81
14      0.81
15      0.81
16      0.81
"""
