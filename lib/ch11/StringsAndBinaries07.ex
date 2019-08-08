defmodule Tax do


  def orders_with_total(orders, tax_rates) do
    orders |> Enum.map(&(add_total_amount(&1, tax_rates)))
  end

  def add_total_amount(order = [id: _ , ship_to: state , net_amount: net], tax_rates) do
    tax_rate = Keyword.get(tax_rates, state, 0)
    total = net*(1.0+tax_rate)
    Keyword.put(order, :total_amount, total)
  end

  def sales_tax(orders) do
     orders_with_total(orders,[ NC: 0.075, TX: 0.08 ])
  end
end

defmodule OrderReader do
  def apply(file_path)do
    read_file(file_path) |> parse() |> Tax.sales_tax()
  end

  def read_file(file_path)do
    {:ok , file} = File.open(file_path,[:read])
    IO.stream(file,:line)
  end

  def parse(file_stream) do
    file_stream
    |> Stream.filter(&(not String.starts_with?(&1,"id")))
    |> Stream.map(&String.split(&1, ","))
    |> Stream.map(&toKeywordList(&1))

  end
  #  [id: num_id, ship_to: state_code , net_amount: net ]

  def toKeywordList([id , state, net | _ ]) do
    id_int = String.to_integer(id)
    state_code = String.to_atom(state)
    net_float = net|> String.slice(0,String.length(net)-1) |> String.to_float()
    [id: id_int , ship_to: state_code , net_amount: net_float ]
  end

end

OrderReader.apply("lib\\ch11\\orders.csv") |> IO.inspect()



#file
#  |> IO.read(:all)
#  |> String.split("\n")
#  |> Enum.map(fn(str) -> String.split(str,",") end)
#  |> IO.inspect()

#tax_rates = [ NC: 0.075, TX: 0.08 ]
#orders = [
#  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
#  [ id: 124, ship_to: :OK, net_amount: 35.50 ],
#  [ id: 125, ship_to: :TX, net_amount: 24.00 ],
#  [ id: 126, ship_to: :TX, net_amount: 44.80 ],
#  [ id: 127, ship_to: :NC, net_amount: 25.00 ],
#  [ id: 128, ship_to: :MA, net_amount: 10.00 ],
#  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
#  [ id: 120, ship_to: :NC, net_amount: 50.00 ]
#]

