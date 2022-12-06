defmodule Adventofcode.Day06TuningTrouble do
  use Adventofcode

  def part_1(input, size \\ 4) do
    input
    |> String.trim()
    |> String.to_charlist
    |> Enum.chunk_every(size, 1)
    |> Enum.find_index(& size == &1 |> Enum.uniq |> length)
    |> Kernel.+(size)
  end

  def part_2(input), do: input |> part_1(14)
end
