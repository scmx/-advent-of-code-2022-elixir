defmodule Adventofcode.Day08TreetopTreeHouse do
  use Adventofcode

  alias __MODULE__.{Parser, Part1, State}

  def part_1(input) do
    input
    |> Parser.parse()
    |> State.new
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
    @enforce_keys [:grid, :max]
    defstruct grid: %{}, max: %{x: 0, y: 0}

    def new(grid) do
      x = grid |> Enum.max_by(fn {{x,_}, _} -> x end) |> elem(0) |> elem(0)
      y = grid |> Enum.max_by(fn {{_,y}, _} -> y end) |> elem(0) |> elem(1)
      %__MODULE__{grid: Map.new(grid), max: %{x: x, y: y}}
    end
  end

  defmodule Part1 do
    def solve(state) do
      state.grid
      |> then(&Enum.count(&1, fn {pos, val} -> visible?(state, pos, val) end))
    end

    defp visible?(_state, {0, _}, _val), do: true
    defp visible?(_state, {_, 0}, _val), do: true
    defp visible?(%{max: %{x: x}}, {x, _}, _val), do: true
    defp visible?(%{max: %{y: y}}, {_, y}, _val), do: true
    defp visible?(%{max: max} = state, {px, py}, val) do
      Enum.any?([
        Enum.max(Enum.map(0..(py - 1), &state.grid[{px, &1}])),
        Enum.max(Enum.map((py + 1)..max.y, &state.grid[{px, &1}])),
        Enum.max(Enum.map(0..(px - 1), &state.grid[{&1, py}])),
        Enum.max(Enum.map((px + 1)..max.x, &state.grid[{&1, py}])),
      ], &(&1 < val))
    end

    defp same_row_or_column({x, y}, {x, y}), do: false
    defp same_row_or_column({x, _}, {x, _}), do: true
    defp same_row_or_column({_, y}, {_, y}), do: true
    defp same_row_or_column(_, _), do: false
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
      |> Enum.with_index
      |> Enum.flat_map(&parse_line/1)
    end

    defp parse_line({line, y}) do
      line
      |> to_char_list
      |> Enum.with_index
      |> Enum.map(fn {val, x} -> {{x, y}, val} end)
    end
  end
end
