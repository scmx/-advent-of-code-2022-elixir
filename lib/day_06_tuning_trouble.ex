defmodule Adventofcode.Day06TuningTrouble do
  use Adventofcode

  alias __MODULE__.{Parser, Part1, Part2}

  def part_1(input) do
    input
    |> Parser.parse()
    |> Part1.solve(4)
  end

   def part_2(input) do
     input
     |> Parser.parse()
     |> Part2.solve()
   end

  defmodule Part1 do
    def solve(chars, size), do: solve(chars, size, size)

    def solve(chars = [_ | tail], size, received) do
      chars
      |> Enum.take(size)
      |> MapSet.new
      |> Enum.to_list
      |> then(fn set when length(set) == size -> received; _ -> solve(tail, size, received + 1) end)
    end
  end

  defmodule Part2 do
    def solve(state) do
      state
      |> Part1.solve(14)
    end
  end

  defmodule Parser do
    def parse(input) do
      input
      |> String.trim()
      |> String.to_charlist
    end
  end
end
