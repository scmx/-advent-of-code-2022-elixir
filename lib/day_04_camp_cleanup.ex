defmodule Adventofcode.Day04CampCleanup do
  use Adventofcode

  alias __MODULE__.{Parser, Part1, State}

  def part_1(input) do
    input
    |> Parser.parse()
    |> Part1.solve()
  end

  # def part_2(input) do
  #   input
  #   |> Parser.parse()
  #   |> State.new
  #   |> Part2.solve()
  # end
  #

  defmodule State do
    @enforce_keys []
    defstruct pos: {0, 0}

    def new(_data), do: %__MODULE__{}
  end

  defmodule Part1 do
    def solve(pairs) do
      pairs
      |> Enum.filter(&one_fully_contain_other?/1)
      |> Enum.count
    end

    defp one_fully_contain_other?([a1..a2, b1..b2]) do
      cond do
        a1 >= b1 && a2 <= b2 -> true
        b1 >= a1 && b2 <= a2 -> true
        true -> false
      end
    end
  end

  # defmodule Part2 do
  #   def solve(state) do
  #     state
  #   end
  # end

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
