defmodule Aox.Day2 do
  def solve do
    input = read_input()

    {twos, threes} =
      input
      |> Enum.reduce({0, 0}, fn string, {twos_acc, threes_acc} ->
        case count_letters(string) do
          {:two, :three} -> {twos_acc + 1, threes_acc + 1}
          {:two} -> {twos_acc + 1, threes_acc}
          {:three} -> {twos_acc, threes_acc + 1}
          _ -> {twos_acc, threes_acc}
        end
      end)

    IO.inspect(twos * threes)
  end

  defp read_input do
    input = File.cwd!() <> "/inputs/day2.txt"

    case File.read(input) do
      {:ok, data} -> String.split(data, "\n", trim: true)
      {:error, _} -> IO.puts("Error leyendo")
    end
  end

  defp count_letters(string) do
    string
    |> String.graphemes()
    |> Enum.frequencies()
    |> Map.values()
    |> make_list()
  end

  defp make_list(frequencies) do
    has_two = Enum.any?(frequencies, &(&1 == 2))
    has_three = Enum.any?(frequencies, &(&1 == 3))

    case {has_two, has_three} do
      {true, true} -> {:two, :three}
      {true, false} -> {:two}
      {false, true} -> {:three}
      _ -> {}
    end
  end
end
