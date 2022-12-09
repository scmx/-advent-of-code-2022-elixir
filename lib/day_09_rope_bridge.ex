defmodule Adventofcode.Day09RopeBridge do
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
    defstruct head: {0, 0}, tail: {0, 0}, tail_visited: MapSet.new([{0, 0}])

    def new, do: %__MODULE__{}
  end

  defmodule Part1 do
    def solve(instructions, state \\ State.new) do
      instructions
      |> Enum.reduce(state, &move/2)
      |> print
      |> then(&MapSet.size(&1.tail_visited))
    end

    defp move({_dir, 0}, state), do: state
    defp move({dir, steps}, state) do
      # print(state)
      head = move_pos(state.head, dir)
      tail = follow(head, state.tail)
      tail_visited = MapSet.put(state.tail_visited, tail)
      state = %{state | head: head, tail: tail, tail_visited: tail_visited}
      move({dir, steps - 1}, state)
    end

    defp move_pos({x, y}, {xd, yd}), do: {x + xd, y + yd}

    defp follow({xh, yh}, {xt, yt} = tail) do
      case {abs(xh - xt), abs(yh - yt)} do
        {0, 1} -> tail
        {1, 0} -> tail
        {1, 1} -> tail
        _ -> tail |> move_pos({abs_1(xh - xt), abs_1(yh - yt)})
      end
    end

    defp abs_1(0), do: 0
    defp abs_1(n), do: div(n, abs(n))

    defp print(state) do
      visited = state.tail_visited
      # [xl, yl] = state.tail_visited |> Enum.map(&Tuple.to_list/1) |> Enum.zip_with(& &1)
      # xr = Enum.min(xl)..Enum.max(xl)
      # yr = Enum.min(yl)..Enum.max(yl)
      xr = -10..10
      yr = -10..10
      IO.puts("")
      Enum.map_join(yr, "\n", fn x ->
        Enum.map_join(xr, "", fn y ->
          cond do
            {x, y} == state.head -> "H"
            {x, y} == state.tail -> "T"
            MapSet.member?(visited, {x, y}) -> "#"
            :else -> "."
          end
        end)
      end)
      |> IO.puts
      state
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
end
