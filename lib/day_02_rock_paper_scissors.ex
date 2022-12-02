defmodule Adventofcode.Day02RockPaperScissors do
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
    def solve(input) do
      input
      |> Enum.map(&battle/1)
      |> Enum.sum
    end

    def battle([:A, :X]), do: 1 + 3
    def battle([:A, :Y]), do: 2 + 6
    def battle([:A, :Z]), do: 3

    def battle([:B, :X]), do: 1
    def battle([:B, :Y]), do: 2 + 3
    def battle([:B, :Z]), do: 3 + 6

    def battle([:C, :X]), do: 1 + 6
    def battle([:C, :Y]), do: 2
    def battle([:C, :Z]), do: 3 + 3
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
      |> String.split(" ")
      |> Enum.map(&String.to_atom/1)
    end
  end
end
