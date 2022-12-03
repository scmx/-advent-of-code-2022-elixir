defmodule Adventofcode.Day03RucksackReorganization do
  use Adventofcode

  alias __MODULE__.{Parser, Part1, Part2, State}

  def part_1(input), do: input |> Parser.parse |> Part1.solve

  def part_2(input), do: input |> Parser.parse |> Part2.solve

  defmodule Part1 do
    def solve(input) do
      input
      |> Enum.map(&split/1)
      |> Enum.map(&compare/1)
      |> Enum.map(&sum/1)
      |> Enum.sum
    end

    defp split(line) do
      half = div(length(line), 2)
      [MapSet.new(Enum.slice(line, 0, half)), MapSet.new(Enum.slice(line, half, half))]
    end

    def compare(parts) do
      parts
      |> Enum.reduce(&MapSet.intersection/2)
      |> Enum.to_list
    end

    defp sum(chars) do
      chars
      |> Enum.map(&offset/1)
      |> Enum.sum
    end

    def offset(char) when char >= 97, do: char - ?a + 1
    def offset(char), do: char - ?A + 27
  end

  defmodule Part2 do
    def solve(input) do
      input
      |> Enum.map(&MapSet.new/1)
      |> Enum.chunk_every(3)
      |> Enum.flat_map(&Part1.compare/1)
      |> Enum.map(&Part1.offset/1)
      |> Enum.sum
    end
  end

  defmodule Parser do
    def parse(input) do
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&parse_line/1)
    end

    defp parse_line(line) do
      line
      |> String.to_charlist
    end
  end
end
