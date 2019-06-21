defmodule MyList do
  def span(from , to) ,do: _span(from, to)
  def _span(from, to ) when from == to do
    [to]
  end
  def _span(from , to), do: [from | _span(from+1, to)]
end


n = 100
list = for  x <- MyList.span(2, n),
            Enum.all?(
              MyList.span(2,Enum.max([2,x-1])), # 試し割法
              fn v -> rem(x, v) > 0 end
            ) ,do: x
IO.inspect(list)