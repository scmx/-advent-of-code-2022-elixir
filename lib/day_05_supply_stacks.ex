defmodule Adventofcode.Day05SupplyStacks do
  use Adventofcode, trim: false

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
    def solve([crates, moves]) do
      moves
      |> Enum.reduce(crates, &move/2)
      |> Enum.map(&hd/1)
      |> Enum.join("")
    end

    defp move([0, from, to], crates), do: crates
    defp move([count, from, to], crates) do
      [head | tail] = Enum.at(crates, from - 1)
      crates = List.update_at(crates, from - 1, fn _ -> tail end)
      crates = List.update_at(crates, to - 1, &[head | &1])
      move([count - 1, from, to], crates)
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
      |> String.trim_trailing()
      |> String.split("\n\n")
      |> Enum.map(&String.split(&1, "\n"))
      |> Enum.map(&parse_group/1)
    end

    defp parse_group(lines = ["move" <> _ | _]) do
      Enum.map(lines, &parse_move/1)
    end

    defp parse_group(lines) do
      lines 
      |> Enum.drop(-1)
      |> Enum.map(&parse_stack_line/1)
      |> transpose
      |> Enum.map(&Enum.reject(&1, fn val -> val == " " end))
    end

    defp parse_move(line) do
      ~r/\d+/
      |> Regex.scan(line)
      |> List.flatten
      |> Enum.map(&String.to_integer/1)
    end

    defp parse_stack_line(line) do
      line 
      |> String.codepoints 
      |> Enum.chunk_every(4) 
      |> Enum.map(&Enum.at(&1, 1))
    end

    def transpose(rows) do
      rows
      |> List.zip
      |> Enum.map(&Tuple.to_list/1)
    end
  end
end
