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

  @example2"""
  R 5
  U 8
  L 8
  D 3
  R 17
  D 10
  L 25
  U 20
  """

  describe "part_1/1" do
    test "there are 13 positions the tail visited at least once" do
      assert 13 = @example |> part_1()
    end

    test_with_puzzle_input do
      assert 6026 = puzzle_input() |> part_1()
    end
  end

  describe "part_2/1" do
    test "tail never moves, and so it only visits 1 position" do
      assert 1 = @example |> part_2()
    end

    test "the tail (9) visits 36 positions" do
      assert 36 = @example2 |> part_2()
    end

    test_with_puzzle_input do
      assert 2273 = puzzle_input() |> part_2()
    end
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
