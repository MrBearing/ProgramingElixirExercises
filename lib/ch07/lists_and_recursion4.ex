defmodule MyList do
    def span(from , to) ,do: _span(from, to)
    def _span(from, to ) when from == to do
      [to]
    end
    def _span(from , to), do: [from | _span(from+1, to)]

end

IO.inspect( MyList.span(20, 39) )