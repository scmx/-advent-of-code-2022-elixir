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
    # test "" do
    #   assert 1337 = @example |> part_2()
    # end

    # test "" do
    #   assert 1337 = @example2 |> part_2()
    # end

    # test_with_puzzle_input do
    #   assert 1337 = puzzle_input() |> part_2()
    # end
  end

  describe "Parser.parse/1" do
    @tag :skip
    test "parses input" do
      assert [1337] = @example |> Parser.parse()
    end
  end
end
