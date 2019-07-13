defmodule MyString do
  def anagram?(word1 , word2),do: _anagram?(word1,word2)

  defp _anagram?(word1, word2)do
    sort_string(word1) == sort_string(word2)
  end
  defp sort_string(word) do
    word
    |> Enum.sort()

  end
end

# true expected
MyString.anagram?('ABCDEFGH','HGFDEABC') |> IO.inspect()
MyString.anagram?('ABRAKADABRA','AAAAABBRRKD') |> IO.inspect()

# false expected
MyString.anagram?('ABCDEFGH','HGFDEAIBC') |> IO.inspect()
