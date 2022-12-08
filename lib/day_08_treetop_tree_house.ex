defmodule Adventofcode.Day08TreetopTreeHouse do
  use Adventofcode

  alias __MODULE__.{Parser, Part1, Part2, State}

  def part_1(input) do
    input
    |> Parser.parse()
    |> State.new
    |> Part1.solve()
  end

  def part_2(input) do
    input
    |> Parser.parse()
    |> State.new
    |> Part2.solve()
  end

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
  end

  defmodule Part2 do
    def solve(state) do
      state.grid
      |> Enum.map(fn {pos, val} -> {pos, count_visible(state, pos, val)} end)
      |> Map.new
      |> Map.values
      |> Enum.max
    end

    defp count_visible(state = %{max: max}, {px,py} = pos, val) do
      [
        do_count(state, pos, val, py..0, &{px, &1}),
        do_count(state, pos, val, py..max.y, &{px, &1}),
        do_count(state, pos, val, px..0, &{&1, py}),
        do_count(state, pos, val, px..max.x, &{&1, py}),
      ] |> Enum.reduce(&(&1 * &2))
    end

    defp do_count(state, pos, val, range, fun_get_pos) do
      range
      |> Enum.map(fun_get_pos)
      |> Enum.reject(&(&1 == pos))
      |> Enum.map(&state.grid[&1])
      |> Enum.reduce_while(0, &count(&1, val, &2))
    end

    defp count(tree, house, acc) when tree >= house, do: {:halt, acc + 1}
    defp count(_tree, _house, acc), do: {:cont, acc + 1}
  end

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
      |> to_charlist
      |> Enum.with_index
      |> Enum.map(fn {val, x} -> {{x, y}, val - ?0} end)
    end
  end
end
