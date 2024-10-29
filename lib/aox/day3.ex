defmodule Aox.Day3 do
  def solve do
    input = read_input()
    input |> IO.inspect()
  end

  defp read_input do
    input = File.cwd!() <> "/inputs/day3.txt"

    case File.read(input) do
      {:ok, contents} -> contents |> String.split("\n", trim: true) |> Enum.map(&parse_input/1)
      {:error, _} -> IO.inspect(:error)
    end
  end

  defp parse_input(line) do
    line |> String.split(" ") |> Enum.map(fn x -> x end)
  end
end
