# prob 1
# easy 1 liner which sums all the numbers
# in the given range only if divisible by 3 or 5
IO.puts Enum.sum for n <- 1..999, rem(n, 3) == 0 or rem(n, 5) == 0, do: n


# prob 2
# considering the terms in the Fibonacci sequence
# whose values do not exceed four million,
# find the sum of the even-valued terms
defmodule Euler2 do
  def sum_even_fibs_up_to_n(n), do: sum_fibs(0,0,1,n)
  defp sum_fibs(sum, last, second_last, n) do
    if last > n do
      sum
    else
      if rem(last, 2) == 0 do #if even then add to sum
        sum_fibs(sum + last, last + second_last, last, n)
      else
        sum_fibs(sum, last + second_last, last, n)
      end
    end
  end

  # I realized that every third term will always be even,
  # so checking that every time is pointless.
  # For that matter, why not directly add
  # each third term for a faster computation
  def second_version(n), do: faster(n,0,1,1)
  defp faster(n, sum, x, y) do
    xy = x + y
    if (xy > n) do
      sum
    else
      xyy = xy + y
      faster(n, sum + xy, xyy, xy + xyy)
    end
  end
  def  pow(n, k), do: pow(n, k, 1)
  defp pow(_, 0, acc), do: acc
  defp pow(n, k, acc), do: pow(n, k - 1, n * acc)

end

# IO.inspect :timer.tc(&Euler2.sum_even_fibs_up_to_n/1, [:math.pow( 10, 100)])
IO.inspect :timer.tc(&Euler2.second_version/1, [Euler2.pow( 10, 100000)])
# alas, a case of premature optimization.
# both versions take aproximately 5 microseconds.
# only when scaled up with insanely huge
# bounds does a difference appear.
