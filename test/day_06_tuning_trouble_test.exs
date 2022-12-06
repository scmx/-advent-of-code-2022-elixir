defmodule Adventofcode.Day06TuningTroubleTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day06TuningTrouble

  @example "mjqjpqmgbljsphdztnvjfqwrcgsmlb"

  # @example2"""
  # """

  describe "part_1/1" do
    test "your subroutine should report the value 7" do
      assert 7 = @example |> part_1()
    end

    # test "" do
    #   assert 1337 = @example2 |> part_1()
    # end

    test_with_puzzle_input do
      assert 1876 = puzzle_input() |> part_1()
    end
  end

  describe "part_2/1" do
    test "" do
      assert 1337 = @example |> part_2()
    end

    # test "" do
    #   assert 1337 = @example2 |> part_2()
    # end

    test_with_puzzle_input do
      assert 1337 = puzzle_input() |> part_2()
    end
  end

  # describe "Parser.parse/1" do
  #   test "parses input" do
  #     assert [1337] = @example |> Parser.parse()
  #   end
  # end
end
