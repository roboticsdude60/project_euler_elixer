# takes about 0.02 seconds
{t, _} =
  :timer.tc(fn ->
    for a <- 1..334,
        b <- a..(1000 - a),
        c = 1000 - a - b,
        a * a + b * b == c * c,
        do: IO.puts(a * b * c)
  end)

IO.inspect(t / 1_000_000)
