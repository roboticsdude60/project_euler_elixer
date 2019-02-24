# What is the 10 001st prime number?

defmodule PrimeGenerator do
  def is_prime(x, primes) do
     primes
     |> Stream.take_while(&(&1 <= :math.sqrt(x)))
     |> Enum.all?(&(rem(x, &1) != 0))
  end
  def nth(n) do
    nth(n,2,3,[2,3])
  end

  def nth(n, count, biggest, _primes) when n == count do biggest end
  def nth(n, count, biggest, primes) do
    testing = biggest + 2
    if is_prime(testing,primes) do
      nth(n,count+1,testing,primes ++ [testing])
    else
      nth(n,count,testing,primes)
    end
  end
end
IO.inspect :timer.tc(&PrimeGenerator.nth/1, [10001])


# TODO try keeping only a list of the primes up to the
# square root of the biggest prime, might be way faster
defmodule PrimeGenerator2 do
  def is_prime(x, primes) do
     primes
     |> Stream.take_while(&(&1 <= :math.sqrt(x)))
     |> Enum.all?(&(rem(x, &1) != 0))
  end
  def c10001() do
    primes = thru_n(324)
    prime(100001,primes)
  end
  defp prime(i,primes) do
    prime(i,1,3,primes)
  end
  defp prime(i,count,testing,_primes) when count == i, do: testing - 2
  defp prime(i,count,testing,primes) do
    newCount = if is_prime(testing,primes) do count + 1 else count end
    prime(i,newCount,testing + 2,primes)
  end

# calculate all the primes up through the value of n
  def thru_n(n), do: n(n,3,[2,3])
  def n(n, biggest, primes) when biggest > n do primes end
  def n(n, biggest, primes) do
    testing = biggest + 2
    if is_prime(testing,primes) do
      n(n,testing,primes ++ [testing])
    else
      n(n,testing,primes)
    end
  end
end
IO.inspect :timer.tc(&PrimeGenerator2.c10001/0)
