content = File.read!("day1/part1.txt")

String.split(content)
|> Enum.map(fn s -> String.to_integer(s) end)
|> Enum.chunk_every(2, 1, :discard)
|> Enum.filter(fn [first, second] -> first < second end)
|> Enum.count()
|> IO.puts()
