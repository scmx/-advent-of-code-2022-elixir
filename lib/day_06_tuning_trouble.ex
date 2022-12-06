defmodule Adventofcode.Day06TuningTrouble do
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
    def solve(chars = [head | tail], received \\ 4) do
      chars
      |> Enum.take(4)
      |> MapSet.new
      |> Enum.to_list
      |> then(fn set when length(set) == 4 -> received; _ -> solve(tail, received + 1) end)
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
      |> String.to_charlist
    end
  end
end
