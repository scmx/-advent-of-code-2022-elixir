defmodule Adventofcode.Day07NoSpaceLeftOnDevice do
  use Adventofcode

  alias __MODULE__.{Parser, Pwd, State}

  def part_1(input) do
    input
    |> Parser.parse()
    |> then(&(&1.folder_sizes))
    |> Map.values
    |> Enum.filter(&(&1 <= 100000))
    |> Enum.sum
  end

  def part_2(input) do
    state = Parser.parse(input)
    target = 30000000 - 70000000 + state.folder_sizes["/"]
    state.folder_sizes
    |> Map.values
    |> Enum.filter(&(&1 >= target))
    |> Enum.sort
    |> hd
  end

  defmodule State do
    @enforce_keys []
    defstruct pwd: "/", hist: [], fs: %{}, file_sizes: %{}, folder_sizes: %{}

    def new, do: %__MODULE__{}

    def mkdir(state, name) do
      keys = Pwd.parts(state.pwd) ++ [name]
      %{state | fs: put_in(state.fs, keys, %{})}
    end

    def touch(state, name, size) do
      keys = Pwd.parts(state.pwd) ++ [name]
      file_sizes = Map.put(state.file_sizes, Pwd.down(state.pwd, name), size)
      %{state | fs: put_in(state.fs, keys, nil), file_sizes: file_sizes}
    end

    def find_folder_sizes(state) do
      state.file_sizes
      |> Enum.flat_map(&do_find_folder_size/1)
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
      |> Enum.map(&{elem(&1, 0), Enum.sum(elem(&1, 1))})
      |> Map.new
      |> then(&%{state | folder_sizes: &1})
    end

    defp do_find_folder_size({pwd, size}) do
      case Pwd.up(pwd) do
        "/" -> [{"/", size}]
        rest -> [{rest, size} | do_find_folder_size({rest, size})]
      end
    end
  end

  defmodule Pwd do
    def down(pwd, name), do: pwd <> name <> "/"

    def up(pwd) do
      pwd
      |> parts
      |> Enum.drop(-1)
      |> Enum.join("/")
      |> Kernel.<>("/")
    end

    def parts(pwd) do
      pwd
      |> String.split("/")
      |> Enum.reject(&(&1 == ""))
    end
  end

  defmodule Parser do
    def parse(input) do
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.reduce(State.new, &reduce/2)
      |> State.find_folder_sizes
    end

    defp reduce("$ " <> cmd, acc) do
      cmd
      |> run(acc)
      |> then(&(%{&1 | hist: [cmd | &1.hist]}))
    end

    defp reduce("dir " <> name, acc) do
      State.mkdir(acc, name)
    end

    defp reduce(file_info, acc) do
      [size, name] = String.split(file_info)
      State.touch(acc, name, String.to_integer(size))
    end

    defp run("cd /" <> path, acc), do: %{acc | pwd: "/#{path}"}
    defp run("cd ..", acc), do: %{acc | pwd: Pwd.up(acc.pwd)}
    defp run("cd " <> path, acc), do: %{acc | pwd: Pwd.down(acc.pwd, path)}
    defp run("ls", acc), do: acc
  end
end
