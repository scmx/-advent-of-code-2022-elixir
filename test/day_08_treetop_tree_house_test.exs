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

  # @example2"""
  # """

  describe "part_1/1" do
    test "how many trees are visible from outside the grid?" do
      assert 21 == @example |> part_1()
    end

    test_with_puzzle_input do
      assert 1708 = puzzle_input() |> part_1()
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
    test "parses input" do
      assert %Adventofcode.Day08TreetopTreeHouse.State{
              grid: %{{0, 0} => 51, {0, 1} => 50, {0, 2} => 54, {0, 3} => 51, {0, 4} => 51, {1, 0} => 48, {1, 1} => 53, {1, 2} => 53, {1, 3} => 51, {1, 4} => 53, {2, 0} => 51, {2, 1} => 53, {2, 2} => 51, {2, 3} => 53, {2, 4} => 51, {3, 0} => 55, {3, 1} => 49, {3, 2} => 51, {3, 3} => 52, {3, 4} => 57, {4, 0} => 51, {4, 1} => 50, {4, 2} => 50, {4, 3} => 57, {4, 4} => 48},
              max: %{x: 4, y: 4}
      } = @example |> Parser.parse() |> State.new
    end
  end
end
