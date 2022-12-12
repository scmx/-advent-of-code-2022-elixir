defmodule Adventofcode.Day11MonkeyInTheMiddle do
  use Adventofcode

  alias __MODULE__.{Monkey, Parser, Part1, State}

  def part_1(input) do
    input
    |> Parser.parse()
    |> State.new_part1
    |> Part1.solve(20)
  end

  def part_2(input) do
    input
    |> Parser.parse()
    |> State.new_part2
    |> Part1.solve(10000)
  end

  defmodule State do
    @enforce_keys [:monkeys, :relief]
    defstruct round: 0, monkeys: [], divisor: 3, relief: nil

    def new_part1(monkeys) do 
      %__MODULE__{monkeys: monkeys, relief: &div(&1, 3)}
    end

    def new_part2(monkeys) do 
      lcm = monkeys |> Map.values |> Enum.map(&(&1.divisor)) |> Enum.product
      %__MODULE__{monkeys: monkeys, relief: &rem(&1, lcm)}
    end
  end

  defmodule Monkey do
    @enforce_keys [:id, :items, :operator, :factor, :divisor, :target1, :target2]
    defstruct id: 0, items: [], operator: :+, factor: :old, divisor: 1, target1: 0, target2: 0, inspections: 0

    def new(id, items, operator, factor, divisor, target1, target2) do
      %__MODULE__{
        id: id, items: items, operator: operator, factor: factor,
        divisor: divisor, target1: target1, target2: target2
      }
    end
  end

  defmodule Part1 do
    def solve(state, rounds) do
      state
      |> Stream.iterate(&solve_round/1)
      |> Enum.at(rounds)
      |> then(&Map.values(&1.monkeys))
      |> Enum.sort_by(&(&1.inspections), :desc)
      |> Enum.take(2)
      |> Enum.map(&(&1.inspections))
      |> Enum.reduce(&Kernel.*/2)
    end
    def solve_round(state) do
      state.monkeys
      |> Map.keys
      |> Enum.reduce(state, &solve_turn/2)
      |> then(&%{&1 | round: &1.round + 1})
    end

    defp solve_turn(index, state) do
      monkey = state.monkeys[index]
      state = Enum.reduce(monkey.items, state, &solve_item(index, &2, &1))
      inspections = monkey.inspections + length(monkey.items)
      monkey = %{monkey | items: [], inspections: inspections}
      %{state | monkeys: Map.put(state.monkeys, index, monkey)}
    end

    defp solve_item(index, state, old) do
      m = state.monkeys[index]
      factor = if m.factor == :old, do: old, else: m.factor
      new = apply(Kernel, m.operator, [old, factor])
      level = state.relief.(new)
      id = if rem(level, m.divisor) == 0, do: m.target1, else: m.target2
      m2 = state.monkeys[id]
      m2 = %{m2 | items: m2.items ++ [level]}
      %{state | monkeys: Map.put(state.monkeys, id, m2)}
    end
  end

  defmodule Parser do
    def parse(input) do
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.chunk_every(7)
      |> Enum.map(&parse_group/1)
      |> Enum.map(&{&1.id, &1})
      |> Map.new
    end

    defp parse_group([a, b, c, d, e, f | _]) do
      [id] = scan_ints(a)
      items = scan_ints(b)
      [operator, factor] = parse_operation(c)
      [divisor] = scan_ints(d)
      [target1, target2] = scan_ints(e <> f)
      Monkey.new(id, items, operator, factor, divisor, target1, target2)
    end

    defp scan_ints(text) do
      ~r/\d+/
      |> Regex.scan(text) 
      |> List.flatten
      |> Enum.map(&String.to_integer/1)
    end

    defp parse_operation(text) do
      [operator, factor | _] = text |> String.split |> Enum.drop(4)
      [String.to_atom(operator), parse_factor(factor)]
    end

    defp parse_factor("old"), do: :old
    defp parse_factor(factor), do: String.to_integer(factor)
  end
end
