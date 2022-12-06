defmodule Adventofcode.Day06TuningTroubleTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day06TuningTrouble

  @example "mjqjpqmgbljsphdztnvjfqwrcgsmlb"

  describe "part_1/1" do
    test "your subroutine should report the value 7" do
      assert 7 = @example |> part_1()
    end

    test_with_puzzle_input do
      assert 1876 = puzzle_input() |> part_1()
    end
  end

  describe "part_2/1" do
    test "start-of-message marker is just like a start-of-packet marker, except it consists of 14 distinct characters" do
      assert 19 = @example |> part_2()
    end

    test_with_puzzle_input do
      assert 2202 = puzzle_input() |> part_2()
    end
  end
end
