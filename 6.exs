# """
# The sum of the squares of the first ten natural numbers is,
#
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
#
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten
# natural numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first
# one hundred natural numbers and the square of the sum.
# """

sumofsquares = 1..100 |> Stream.map(&(&1*&1)) |> Enum.sum()
squareofsum = 1..100 |> Enum.sum |> :math.pow(2)
IO.puts sumofsquares - squareofsum |> round
