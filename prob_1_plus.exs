# prob1
# easy 1 liner which sums all the numbers
# in the given range only if divisible by 3 or 5
IO.puts Enum.sum for n <- 1..999, rem(n, 3) == 0 or rem(n, 5) == 0, do: n
