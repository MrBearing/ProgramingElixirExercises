defmodule Chain do
  def process(pid) do
    receive do
      {sender, msg} ->
        send sender, msg
    end

  end

  def create_processes(names) do
    last = Enum.reduce name , self(),
            fn (_,send_to) ->
              spawn(Chain, :counter, [send_to])
            end
    send last, 0
    receive do
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(names) do

  end
end


