defmodule Adventofcode.Day02RockPaperScissorsTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day02RockPaperScissors

  alias Adventofcode.Day02RockPaperScissors.{Parser}

  @example"""
  A Y
  B X
  C Z
  """

  describe "part_1/1" do
    test "In this example, if you were to follow the strategy guide, you would get a total score of 15 (8 + 1 + 6)" do
      assert 15 = @example |> part_1()
    end

    test_with_puzzle_input do
      assert 8392 = puzzle_input() |> part_1()
    end
  end

  describe "part_2/1" do
    test "" do
      assert 12 = @example |> part_2()
    end

    test_with_puzzle_input do
      assert 10116 = puzzle_input() |> part_2()
    end
  end

  describe "Parser.parse/1" do
    test "parses input" do
      assert [[:A, :Y], [:B, :X], [:C, :Z]] = @example |> Parser.parse()
    end
  end
end
