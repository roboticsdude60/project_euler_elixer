# Find the sum of all the primes below two million

defmodule Prime do
  defp is_prime(x, primes) do
    primes
    # |> Stream.take_while(&(&1 <= :math.sqrt(x))) #TODO why does this slow it down soo much. Or when will the overhead pay off?
    # sqrt = :math.sqrt(x) |> trunc()
    # |> Stream.take_while(&(&1 <= sqrt))
    |> Enum.all?(&(rem(x, &1) != 0))
  end

  defp upto(2), do: [2]

  defp upto(x) do
    sqrt = :math.sqrt(x) |> trunc()
    needed = upto(sqrt)
    needed ++ for i <- sqrt..x, is_prime(i, needed), do: i
  end

  def sumto(n), do: Enum.sum(upto(n))
end
