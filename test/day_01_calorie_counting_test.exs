defmodule Adventofcode.Day01CalorieCountingTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day01CalorieCounting

  alias Adventofcode.Day01CalorieCounting.{Parser}

  @example"""
  1000
  2000
  3000

  4000

  5000
  6000

  7000
  8000
  9000

  10000
  """

  # @example2"""
  # """

  describe "part_1/1" do
    test "Elf carrying the most Calories. In the example above, this is 24000" do
      assert 24000 = @example |> part_1()
    end

    # test "" do
    #   assert 1337 = @example2 |> part_1()
    # end

    test_with_puzzle_input do
      assert 70613 = puzzle_input() |> part_1()
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
      assert [1337] = @example |> Parser.parse()
    end
  end
end
