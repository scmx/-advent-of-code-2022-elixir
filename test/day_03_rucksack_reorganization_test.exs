defmodule Adventofcode.Day03RucksackReorganizationTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day03RucksackReorganization

  alias Adventofcode.Day03RucksackReorganization.{Parser}

  @example"""
  vJrwpWtwJgWrhcsFMMfFFhFp
  jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
  PmmdzqPrVvPwwTWBwg
  wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
  ttgJtRGJQctTZtZT
  CrZsJsPPZsGzwwsLwLmpwMDw
  """

  # @example2"""
  # """

  describe "part_1/1" do
    test "the priority of the item type that appears in both compartments of each rucksack is 16 (p), 38 (L), 42 (P), 22 (v), 20 (t), and 19 (s); the sum of these is 157" do
      assert 157 = @example |> part_1()
    end

    # test "" do
    #   assert 1337 = @example2 |> part_1()
    # end

    test_with_puzzle_input do
      assert 7990 = puzzle_input() |> part_1()
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
    # test "parses input" do
    #   assert [1337] = @example |> Parser.parse()
    # end
  end
end
