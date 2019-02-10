#largest palindrome from product of 2 3 digit numbers
defmodule Palindrome do
  def palindrome?(x) do
    s = Integer.to_string x
    String.reverse(s) == s
  end

# must be product of two 3 digit numbers
  def product?(x) do
    factor = 100..999
    |> Stream.filter(&(rem(x,&1) == 0 and (div(x, &1) in 100..999)))
    |> Enum.take(1)
    not Enum.empty? factor
  end

  def largest() do
    #largest and smallest products of 3 digit numbers
    (999*999)..10000 |> Stream.filter(&(palindrome?(&1)))
    |> Stream.filter(&product?(&1)) |> Enum.take(1)
  end
end

IO.inspect Palindrome.largest()
