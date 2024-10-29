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

    IO.puts("Part1: ")
    IO.inspect(twos * threes)

    input
    |> Enum.map(fn x -> input |> Enum.map(fn c -> compare_two(x, c) end) end)
    |> Enum.filter(fn x ->
      case x do
        {true, _} -> true
        _ -> false
      end
    end)
    |> IO.inspect()
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

  defp compare_two(a, b) do
    str1 = a |> String.graphemes()
    str2 = b |> String.graphemes()

    case compare_aux(str1, str2, 0, "") do
      {true, str} -> {true, str}
      _ -> false
    end
  end

  defp compare_aux([], [], count, str) when count == 1, do: {true, str}
  defp compare_aux([], [], _, _), do: {false, ""}

  defp compare_aux([h1 | t1], [h2 | t2], count, str) do
    if count > 1 do
      {false, ""}
    else
      case h1 == h2 do
        true -> compare_aux(t1, t2, count, str <> h1)
        false -> compare_aux(t1, t2, count + 1, str)
      end
    end
  end
end
