defmodule MyModule do
  def ok!({:ok , data}) do
    data
  end

  def ok!(error) do
    raise "Error : #{error}"
  end
end

file = MyModule.ok! File.open("./README.md")
file |> IO.inspect()

#ok! = fn
#  {:ok ,data} -> data
#  {_ , error } -> raise "Error is occur  : #{error}"
#end
#
#ok!.( File.open("./README.md"))|> IO.inspect()
#ok!.( File.open("./README.md__")) |> IO.inspect()
