defmodule Adventofcode.Day10CathodeRayTubeTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day10CathodeRayTube

  alias Adventofcode.Day10CathodeRayTube.{Parser}

  @example"""
  noop
  addx 3
  addx -5
  """

  @example2"""
  addx 15
  addx -11
  addx 6
  addx -3
  addx 5
  addx -1
  addx -8
  addx 13
  addx 4
  noop
  addx -1
  addx 5
  addx -1
  addx 5
  addx -1
  addx 5
  addx -1
  addx 5
  addx -1
  addx -35
  addx 1
  addx 24
  addx -19
  addx 1
  addx 16
  addx -11
  noop
  noop
  addx 21
  addx -15
  noop
  noop
  addx -3
  addx 9
  addx 1
  addx -3
  addx 8
  addx 1
  addx 5
  noop
  noop
  noop
  noop
  noop
  addx -36
  noop
  addx 1
  addx 7
  noop
  noop
  noop
  addx 2
  addx 6
  noop
  noop
  noop
  noop
  noop
  addx 1
  noop
  noop
  addx 7
  addx 1
  noop
  addx -13
  addx 13
  addx 7
  noop
  addx 1
  addx -33
  noop
  noop
  noop
  addx 2
  noop
  noop
  noop
  addx 8
  noop
  addx -1
  addx 2
  addx 1
  noop
  addx 17
  addx -9
  addx 1
  addx 1
  addx -3
  addx 11
  noop
  noop
  addx 1
  noop
  addx 1
  noop
  noop
  addx -13
  addx -19
  addx 1
  addx 3
  addx 26
  addx -30
  addx 12
  addx -1
  addx 3
  addx 1
  noop
  noop
  noop
  addx -9
  addx 18
  addx 1
  addx 2
  noop
  noop
  addx 9
  noop
  noop
  noop
  addx -1
  addx 2
  addx -37
  addx 1
  addx 3
  noop
  addx 15
  addx -21
  addx 22
  addx -6
  addx 1
  noop
  addx 2
  addx 1
  noop
  addx -10
  noop
  noop
  addx 20
  addx 1
  addx 2
  addx 2
  addx -6
  addx -11
  noop
  noop
  noop
  """

  describe "part_1/1" do
    test "" do
      assert 0 = @example |> part_1()
    end

    test "The sum of these signal strengths is 13140." do
      assert 13140 = @example2 |> part_1()
    end

    test_with_puzzle_input do
      assert 12740 = puzzle_input() |> part_1()
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

  @tag :skip
  describe "Parser.parse/1" do
    test "parses input" do
      assert [1337] = @example |> Parser.parse()
    end
  end
end
