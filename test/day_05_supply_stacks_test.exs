defmodule Adventofcode.Day05SupplyStacksTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day05SupplyStacks

  alias Adventofcode.Day05SupplyStacks.{Parser}

  @example"""
      [D]    
  [N] [C]    
  [Z] [M] [P]
   1   2   3 

  move 1 from 2 to 1
  move 3 from 1 to 3
  move 2 from 2 to 1
  move 1 from 1 to 2
  """

  # @example2"""
  # """

  describe "part_1/1" do
    test "the top crates are C in stack 1, M in stack 2, and Z in stack 3" do
      assert "CMZ" = @example |> part_1()
    end

    test_with_puzzle_input do
      assert "ZSQVCCJLL" = puzzle_input() |> part_1()
    end
  end

  describe "part_2/1" do
    test "the CrateMover 9001 has put the crates in a totally different order: MCD" do
      assert "MCD" = @example |> part_2()
    end

    test_with_puzzle_input do
      assert "QZFJRWHGS" = puzzle_input() |> part_2()
    end
  end

  describe "Parser.parse/1" do
    test "parses input" do
      assert [
        [["N", "Z"], ["D", "C", "M"], ["P"]],
        [[1, 2, 1], [3, 1, 3], [2, 2, 1], [1, 1, 2]]
      ] = @example |> Parser.parse()
    end
  end
end
