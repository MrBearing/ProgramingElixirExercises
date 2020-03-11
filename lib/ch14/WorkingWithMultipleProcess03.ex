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
    spawn_link(WWMP3, :child_func, [self(), "This is message"])
    sleep 500
    receive_func()
  end


  def run() do
    parent_func()
  end
end

WWMP3.run()


# 子プロセスからのメッセージが受信できない
