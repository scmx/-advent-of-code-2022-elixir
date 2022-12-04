defmodule Adventofcode.Day04CampCleanup do
  use Adventofcode

  alias __MODULE__.{Parser, Part1, Part2}

  def part_1(input) do
    input
    |> Parser.parse()
    |> Part1.solve()
  end

  def part_2(input) do
    input
    |> Parser.parse()
    |> Part2.solve()
  end

  defmodule Part1 do
    def solve(pairs) do
      pairs
      |> Enum.filter(&one_fully_contain_other?/1)
      |> Enum.count
    end

    defp one_fully_contain_other?([a1..a2, b1..b2]) do
      (a1 >= b1 && a2 <= b2) || (b1 >= a1 && b2 <= a2)
    end
  end

  defmodule Part2 do
    def solve(pairs) do
      pairs
      |> Enum.reject(&disjoint?/1)
      |> Enum.count
    end

    defp disjoint?([a,b]), do: Range.disjoint?(a, b)
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
      |> String.split(",")
      |> Enum.map(&parse_section/1)
    end

    defp parse_section(section) do
      section
      |> String.split("-")
      |> Enum.map(&String.to_integer/1)
      |> (fn [first, last] -> first..last end).()
    end
  end
end
