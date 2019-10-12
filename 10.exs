# Find the sum of all the primes below two million

defmodule Prime do
  defp is_prime(x, primes) do
    primes
    |> Enum.all?(&(rem(x, &1) != 0))
  end

  defp upto(2), do: [2]
  defp upto(3), do: [2,3]

  defp upto(x) when x >= 2 do
    sqrt = :math.sqrt(x) |> trunc()
    needed = upto(sqrt)
    needed ++ for(i <- sqrt..x, is_prime(i, needed), do: i)
  end

  def sumto(n), do: Enum.sum(upto(n))
end
