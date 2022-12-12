defmodule Adventofcode.Day11MonkeyInTheMiddleTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day11MonkeyInTheMiddle

  alias Adventofcode.Day11MonkeyInTheMiddle.{Parser}

  @example"""
  Monkey 0:
    Starting items: 79, 98
    Operation: new = old * 19
    Test: divisible by 23
      If true: throw to monkey 2
      If false: throw to monkey 3

  Monkey 1:
    Starting items: 54, 65, 75, 74
    Operation: new = old + 6
    Test: divisible by 19
      If true: throw to monkey 2
      If false: throw to monkey 0

  Monkey 2:
    Starting items: 79, 60, 97
    Operation: new = old * old
    Test: divisible by 13
      If true: throw to monkey 1
      If false: throw to monkey 3

  Monkey 3:
    Starting items: 74
    Operation: new = old + 3
    Test: divisible by 17
      If true: throw to monkey 0
      If false: throw to monkey 1
  """

  describe "part_1/1" do
    test "after 20 rounds" do
      assert 10605 = @example |> part_1()
    end

    test_with_puzzle_input do
      assert 78678 = puzzle_input() |> part_1()
    end
  end

  describe "part_2/1" do
    test "" do
      assert 2713310158 = @example |> part_2()
    end

    test_with_puzzle_input do
      assert 15333249714 = puzzle_input() |> part_2()
    end
  end

  describe "Parser.parse/1" do
    test "parses input" do
      assert [
              %{items: [79, 98], operator: :*, factor: 19, divisor: 23, target1: 2, target2: 3},
              %{items: [54, 65, 75, 74], operator: :+, factor: 6, divisor: 19, target1: 2, target2: 0},
              %{items: [79, 60, 97], operator: :*, factor: :old, divisor: 13, target1: 1, target2: 3},
              %{items: [74], operator: :+, factor: 3, divisor: 17, target1: 0, target2: 1}
      ] = @example |> Parser.parse() |> Map.values
    end
  end
end
