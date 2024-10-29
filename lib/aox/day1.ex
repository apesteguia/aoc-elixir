defmodule Aox.Day1 do
  def solve do
    input = read_input()

    result1 =
      input
      |> Enum.reduce(0, fn
        {:positive, num}, acc -> acc + num
        {:negative, num}, acc -> acc - num
      end)

    IO.puts("Result of part 1 is: #{result1}")
  end

  defp read_input do
    input = File.cwd!() <> "/inputs/day1.txt"

    case File.read(input) do
      {:ok, contents} ->
        contents
        |> String.split("\n", trim: true)
        |> Enum.map(&parse_line/1)

      {:error, _} ->
        IO.puts("Error: No se pudo leer el archivo de entrada")
        []
    end
  end

  defp parse_line(line) do
    cond do
      String.starts_with?(line, "+") ->
        {:positive, String.to_integer(String.trim_leading(line, "+"))}

      String.starts_with?(line, "-") ->
        {:negative, String.to_integer(String.trim_leading(line, "-"))}

      true ->
        {:unknown, line}
    end
  end
end
