#Greatest prime factor
defmodule GPF do
  def is_prime(x) when x in [2,3] do true end
  def is_prime(x) do
    2..floor(:math.sqrt(x)) |> Enum.all?(&(rem(x, &1) != 0))
  end

  def gpf(x) do
    floor(:math.sqrt(x))..2 |> Enum.filter(&(rem(x,&1) == 0 and is_prime(&1))) |> hd
  end
end

IO.puts GPF.gpf 600851475143
