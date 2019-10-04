# What is the 10 001st prime number?

defmodule PrimeGenerator do
  def is_prime(x, primes) do
     primes
     |> Stream.take_while(&(&1 <= :math.sqrt(x)))
     |> Enum.all?(&(rem(x, &1) != 0))
  end

  def nth(n), do: nth(n,2,3,[2,3])
  def nth(n, count, biggest, _primes) when n == count, do: biggest 
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
