defmodule Adventofcode.Day10CathodeRayTube do
  use Adventofcode

  alias __MODULE__.{Parser, Part1, State}

  def part_1(input) do
    input
    |> Parser.parse()
    |> State.new
    |> Part1.solve()
    |> Stream.take_while(&Enum.any?(&1.program))
    |> Stream.take_every(40)
    |> Enum.map(&(&1.cycles * &1.x))
    |> Enum.sum
  end

  def part_2(input) do
    input
    |> Parser.parse()
    |> State.new
    |> Part1.solve()
    |> Enum.take(222)
    |> then(&(Enum.at(&1, -1).output))
  end

  defmodule State do
    @enforce_keys []
    defstruct cycles: 1, x: 1, program: [], output: ""

    def new(program), do: %__MODULE__{program: program}

    def add_cycles(state, cycles) do
      %{state | cycles: state.cycles + cycles}
    end
  end

  defmodule Part1 do
    def solve(state) do
      state
      |> Stream.iterate(&iterate/1)
      |> Stream.drop(19)
    end

    defp iterate(state) do
      sprite = (state.x - 1)..(state.x + 1)
      index = rem(state.cycles - 1, 40)
      text = if index in sprite, do: "#", else: "."
      text = text <> if index == 39, do: "\n", else: ""
      run(%{state | output: state.output <> text})
    end

    defp run(state = %{program: []}), do: state

    defp run(state = %{program: [:noop | tail]}) do
      %{state | cycles: state.cycles + 1, program: tail}
    end

    defp run(state = %{program: [{:addx, n} | tail]}) do
      %{state | cycles: state.cycles + 1, program: tail, x: state.x + n}
    end
  end

  defmodule Parser do
    def parse(input) do
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.flat_map(&parse_line/1)
    end

    defp parse_line("noop"), do: [:noop]

    defp parse_line("addx " <> n), do: [:noop, {:addx, String.to_integer(n)}]
  end
end
