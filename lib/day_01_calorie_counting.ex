defmodule Adventofcode.Day01CalorieCounting do
  use Adventofcode

  alias __MODULE__.{Parser, State}

  def part_1(input) do
    input
    |> Parser.parse()
    |> Enum.map(&Enum.sum/1)
    |> Enum.max()
  end

  def part_2(input) do
    input
    |> Parser.parse()
    |> Enum.map(&Enum.sum/1)
    |> Enum.sort()
    |> Enum.reverse()
    |> Enum.take(3)
    |> Enum.sum()
  end

  defmodule Parser do
    def parse(input) do
      input
      |> String.trim()
      |> String.split("\n\n")
      |> Enum.map(&parse_group/1)
    end

    defp parse_group(line) do
      line
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
    end
  end
end
