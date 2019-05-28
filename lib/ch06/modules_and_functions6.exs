defmodule Chop do
    def guess(actual , a..b) do
        d = div(a+b,2)
        IO.puts "actual  :#{actual}  , a to b: #{a}..#{b}} , num : #{d} "
        guess_h(actual , a..b ,d)
    end
    # マッチは上から順にマッチする。先に条件判定させたい物を先に書く
    def guess_h(actual, _  , actual ) do
      IO.puts actual
    end
    def guess_h(actual , begin..range_end , num ) when actual > num  do
      IO.puts "Is it #{num}"
      guess(actual , (num+1)..range_end )
    end
    def guess_h(actual , begin..range_end , num )  do
        IO.puts "Is it #{num}"
        guess(actual , begin..num )
    end
end

Chop.guess(273, 1..10000)

#1. a..bの中間の値を取る = guess_num  (足して2で割る)
#2. actual < guess_num    1..guess_num-1の範囲で再トライ
