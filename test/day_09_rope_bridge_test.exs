defmodule Adventofcode.Day09RopeBridgeTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day09RopeBridge

  alias Adventofcode.Day09RopeBridge.{Parser}

  @example"""
  R 4
  U 4
  L 3
  D 1
  R 4
  D 1
  L 5
  R 2
  """

  # @example2"""
  # """

  describe "part_1/1" do
    test "" do
      assert 13 = @example |> part_1()
    end

    # test "" do
    #   assert 1337 = @example2 |> part_1()
    # end

    test_with_puzzle_input do
      assert 6026 = puzzle_input() |> part_1()
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
      assert [{{1, 0}, 4},
{{0, -1}, 4},
{{-1, 0}, 3},
{{0, 1}, 1},
{{1, 0}, 4},
{{0, 1}, 1},
{{-1, 0}, 5},
{{1, 0}, 2}] = @example |> Parser.parse()
    end
  end
end
