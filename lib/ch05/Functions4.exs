prefix = fn (some_string) -> fn ( some_some_string )-> some_string <> " "<> some_some_string end  end

mrs  = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")
