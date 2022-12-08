defmodule Adventofcode.Day08TreetopTreeHouseTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day08TreetopTreeHouse

  alias Adventofcode.Day08TreetopTreeHouse.{Parser, State}

  @example"""
  30373
  25512
  65332
  33549
  35390
  """

  describe "part_1/1" do
    test "how many trees are visible from outside the grid?" do
      assert 21 == @example |> part_1()
    end

    test_with_puzzle_input do
      assert 1708 = puzzle_input() |> part_1()
    end
  end

  describe "part_2/1" do
    test "this tree's scenic score is 8 (2 * 2 * 1 * 2); this is the ideal spot for the tree house" do
      assert 8 = @example |> part_2()
    end

    test_with_puzzle_input do
      assert 504000 = puzzle_input() |> part_2()
    end
  end

  describe "Parser.parse/1" do
    test "parses input" do
      assert %Adventofcode.Day08TreetopTreeHouse.State{
        grid: %{
          {0, 0} => 3,
          {0, 1} => 2,
          {0, 2} => 6,
          {0, 3} => 3,
          {0, 4} => 3,
          {1, 0} => 0,
          {1, 1} => 5,
          {1, 2} => 5,
          {1, 3} => 3,
          {1, 4} => 5,
          {2, 0} => 3,
          {2, 1} => 5,
          {2, 2} => 3,
          {2, 3} => 5,
          {2, 4} => 3,
          {3, 0} => 7,
          {3, 1} => 1,
          {3, 2} => 3,
          {3, 3} => 4,
          {3, 4} => 9,
          {4, 0} => 3,
          {4, 1} => 2,
          {4, 2} => 2,
          {4, 3} => 9,
          {4, 4} => 0
        },
        max: %{x: 4, y: 4}
      } = @example |> Parser.parse() |> State.new
    end
  end
end
