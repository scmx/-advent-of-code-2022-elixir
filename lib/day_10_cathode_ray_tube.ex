defmodule Adventofcode.Day10CathodeRayTube do
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
    @enforce_keys []
    defstruct cycles: 1, registers: %{x: 1}, program: [], done: false

    def new(program), do: %__MODULE__{program: program}

    def add_cycles(state, cycles) do
      %{state | cycles: state.cycles + cycles}
    end
  end

  defmodule Part1 do
    def solve(state) do
      state
      |> Stream.iterate(&run/1)
      |> Stream.drop(19)
      |> Stream.take_while(&Enum.any?(&1.program))
      |> Stream.take_every(40)
      |> Enum.map(&(&1.cycles * &1.registers.x))
      |> Enum.sum
    end

    defp run(state = %{program: []}) do 
      %{state | done: true}
    end

    defp run(state = %{program: [:noop | tail]}) do
      %{state | cycles: state.cycles + 1, program: tail}
    end

    defp run(state = %{program: [{:addx, n} | tail]}) do
      registers = %{x: state.registers.x + n}
      %{state | cycles: state.cycles + 1, program: tail, registers: registers}
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
      |> Enum.flat_map(&parse_line/1)
    end

    defp parse_line("noop"), do: [:noop]

    defp parse_line("addx " <> n), do: [:noop, {:addx, String.to_integer(n)}]
  end
end
