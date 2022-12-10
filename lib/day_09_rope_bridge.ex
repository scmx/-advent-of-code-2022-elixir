defmodule Adventofcode.Day09RopeBridge do
  use Adventofcode

  alias __MODULE__.{Parser, Part1, Printer, State}

  def part_1(input) do
    input
    |> Parser.parse()
    |> Part1.solve(2)
  end

   def part_2(input) do
     input
     |> Parser.parse()
     |> Part1.solve(10)
   end

  defmodule State do
    @enforce_keys [:knots]
    defstruct knots: [], visited: MapSet.new([{0, 0}])

    def new(knot_count) do 
      %__MODULE__{knots: List.duplicate({0, 0}, knot_count)}
    end
  end

  defmodule Part1 do
    def solve(instruction, knot_count) do
      instruction
      |> Enum.reduce(State.new(knot_count), &apply_instruction/2)
      |> then(&MapSet.size(&1.visited))
    end

    defp apply_instruction({dir, steps}, state) do
      dir
      |> List.duplicate(steps)
      |> Enum.reduce(state, &move_head/2)
      # |> Printer.print
    end

    defp move_head(dir, state = %{knots: [head | tail]}) do
      head
      |> add_pos(dir)
      |> move_tail(tail)
      |> update_state(state)
    end

    defp move_tail(head, tail) do
      {head, Enum.map_reduce(tail, head, &move_knot/2)}
    end

    defp move_knot(knot, last) do
      last
      |> sub_pos(knot)
      |> follow
      |> add_pos(knot)
      |> then(&{&1, &1})
    end

    defp update_state({head, {tail, last}}, state) do
      %{state | knots: [head | tail], visited: MapSet.put(state.visited, last)}
    end

    defp add_pos({x1, y1}, {x2, y2}), do: {x1 + x2, y1 + y2}

    defp sub_pos({x1, y1}, {x2, y2}), do: {x1 - x2, y1 - y2}

    defp follow({xd, yd}) when abs(xd) <= 1 and abs(yd) <= 1, do: {0, 0}
    defp follow({xd, yd}), do: {clamp(xd), clamp(yd)}

    defp clamp(0), do: 0
    defp clamp(n), do: div(n, abs(n))
  end

  defmodule Parser do
    def parse(input) do
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&String.split(&1, " "))
      |> Enum.map(&parse_line/1)
    end

    defp parse_line([dir, steps]) do
      {parse_dir(dir), String.to_integer(steps)}
    end

    defp parse_dir("U"), do: {0, -1}
    defp parse_dir("L"), do: {-1, 0}
    defp parse_dir("R"), do: {1, 0}
    defp parse_dir("D"), do: {0, 1}
  end

  defmodule Printer do
    def print(state) do
      xr = -10..10
      yr = -10..10
      IO.puts("")
      Enum.map_join(yr, "\n", fn y ->
        Enum.map_join(xr, "", fn x ->
          index = Enum.find_index(state.knots, &(&1 == {x, y}))
          cond do
            index == 0 -> "H"
            index in 1..9 -> index
            MapSet.member?(state.visited, {x, y}) -> "#"
            :else -> "."
          end
        end)
      end)
      |> IO.puts
      state
    end
  end
end
