defmodule Adventofcode.Day04CampCleanupTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day04CampCleanup

  alias Adventofcode.Day04CampCleanup.{Parser}

  @example"""
  2-4,6-8
  2-3,4-5
  5-7,7-9
  2-8,3-7
  6-6,4-6
  2-6,4-8
  """

  describe "part_1/1" do
    test "how many assignment pairs does one range fully contain the other?" do
      assert 2 = @example |> part_1()
    end

    test_with_puzzle_input do
      assert 511 = puzzle_input() |> part_1()
    end
  end

  describe "part_2/1" do
    test "in this example, the number of overlapping assignment pairs is 4" do
      assert 4 = @example |> part_2()
    end

    test_with_puzzle_input do
      assert 821 = puzzle_input() |> part_2()
    end
  end

  describe "Parser.parse/1" do
    test "parses input" do
      assert [[2..4,6..8], [2..3, 4..5], [5..7, 7..9], [2..8, 3..7], [6..6, 4..6], [2..6, 4..8]] = @example |> Parser.parse()
    end
  end
end
