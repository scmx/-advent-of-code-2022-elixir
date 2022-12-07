defmodule Adventofcode.Day07NoSpaceLeftOnDeviceTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day07NoSpaceLeftOnDevice

  @example"""
  $ cd /
  $ ls
  dir a
  14848514 b.txt
  8504156 c.dat
  dir d
  $ cd a
  $ ls
  dir e
  29116 f
  2557 g
  62596 h.lst
  $ cd e
  $ ls
  584 i
  $ cd ..
  $ cd ..
  $ cd d
  $ ls
  4060174 j
  8033020 d.log
  5626152 d.ext
  7214296 k
  """

  # @example2"""
  # """

  describe "part_1/1" do
    test "" do
      assert 95437 = @example |> part_1()
    end

    # test "" do
    #   assert 1337 = @example2 |> part_1()
    # end

    test_with_puzzle_input do
      assert 1297159 = puzzle_input() |> part_1()
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
end
