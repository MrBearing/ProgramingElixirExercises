defmodule Names do
  def process(name , pid) do
    send pid, name
  end

  def create_processes() do
    spawn(Names, :process, ["fred",self()])
    spawn(Names, :process, ["betty",self()])
    receive do name -> IO.puts(name) end
    receive do name -> IO.puts(name) end
  end

  def run() do
    create_processes()
  end
end


