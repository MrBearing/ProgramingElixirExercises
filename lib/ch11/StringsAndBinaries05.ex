defmodule MyString do
  def center(string_list),do: _center(string_list,string_list,0)

  defp _center([],string_list, max_len)do
    string_list
      |> Enum.each( fn(str)-> printCenter(str,max_len) end)
  end
  defp _center([head | tail], string_list , max_len) do
    max = _max(String.length(head) , max_len )
    _center( tail, string_list, max )
  end

  def _max( a, b)when a < b ,do: b
  def _max( a, _) ,do: a

  def printCenter(str , max_len) do
    str_len = String.length(str)
    space_num = max_len - str_len

    String.duplicate(" ", div(space_num,2))<>str
      |> String.pad_trailing(max_len," ")
      |> IO.inspect()
  end

end


MyString.center(["cat", "zebra", "elephant"])
