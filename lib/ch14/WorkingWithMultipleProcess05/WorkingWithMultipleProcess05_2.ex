defmodule WWMP3 do
  import :timer, only: [sleep: 1 ]

  def child_func(pid, message) do
    send pid , message
    raise "Some error occur"
  end

  def receive_func() do
    receive do msg -> IO.puts(msg) end
    receive_func()
  end

  def parent_func() do
    spawn_monitor(WWMP3, :child_func, [self(), "This is message"])
    sleep 500
    receive_func()
  end


  def run() do
    parent_func()
  end
end

WWMP3.run()


"""
例外が発生し、子プロセスからのメッセージが受信できた

22:48:40.002 [error] Process #PID<0.98.0> raised an exception
** (RuntimeError) Some error occur
    WorkingWithMultipleProcess05_2.ex:6: WWMP3.child_func/2
This is message
** (Protocol.UndefinedError) protocol String.Chars not implemented for {:DOWN, #Reference<0.595336752.78643216.42367>, :process, #PID<0.98.0>, {%RuntimeError{message: "Some error occur"}, [{WWMP3, :child_func, 2, [file: 'WorkingWithMultipleProcess05_2.ex', line: 6]}]}} of type Tuple
    (elixir 1.10.1) lib/string/chars.ex:3: String.Chars.impl_for!/1
    (elixir 1.10.1) lib/string/chars.ex:22: String.Chars.to_string/1
    (elixir 1.10.1) lib/io.ex:669: IO.puts/2
    WorkingWithMultipleProcess05_2.ex:10: WWMP3.receive_func/0

"""
