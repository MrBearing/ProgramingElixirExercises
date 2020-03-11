defmodule WWMP3 do
  import :timer, only: [sleep: 1 ]

  def child_func(pid, message) do
    send pid , message
    exit(:boom)
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


# 子プロセスからのメッセージが受信できた
"""
This is message
** (Protocol.UndefinedError) protocol String.Chars not implemented for {:DOWN, #Reference<0.3465508587.78905348.76437>, :process, #PID<0.98.0>, :boom} of type Tuple
    (elixir 1.10.1) lib/string/chars.ex:3: String.Chars.impl_for!/1
    (elixir 1.10.1) lib/string/chars.ex:22: String.Chars.to_string/1
    (elixir 1.10.1) lib/io.ex:669: IO.puts/2
    WorkingWithMultipleProcess05_1.ex:10: WWMP3.receive_func/0
"""
