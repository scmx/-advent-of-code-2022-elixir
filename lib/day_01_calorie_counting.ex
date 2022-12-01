defmodule Adventofcode.Day01CalorieCounting do
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

  defmodule Part1 do
    def solve(state) do
      state
      |> Enum.map(&Enum.sum/1)
      |> Enum.max
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
      |> String.split("\n\n")
      |> Enum.map(&parse_eld/1)
    end

    defp parse_eld(line) do
      line
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
    end
  end
end
