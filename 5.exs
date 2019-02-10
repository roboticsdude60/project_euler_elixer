# What is the smallest positive number that is evenly divisible
# by all of the numbers from 1 to 20?

#naive -- multiply the factorizations of numbers in range, removing duplicates
IO.puts Enum.reduce([2,2,2,2,3,3,5,7,11,13,17,19],&(&1 * &2))

# after some research
# the LCM(Least Common Multiple) of two numbers a, b = a * b / GCD(a,b)
defmodule GeneralLCM do
  defp gcd(a,0), do: a
  defp gcd(a,b), do: gcd(b, rem(a,b))
  defp lcm(a,b), do: div(a*b, gcd(a,b))

  def lcm(numbers), do: Enum.reduce(numbers,&lcm(&1,&2))
end

# now we can calculate this in a more generalized fashion
IO.inspect GeneralLCM.lcm(1..20)
