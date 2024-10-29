defmodule Aox do
  def main(day) when is_integer(day) do
    case day do
      1 -> Aox.Day1.solve()
      2 -> Aox.Day2.solve()
      3 -> Aox.Day3.solve()
      _ -> IO.puts("No solved yet")
    end
  end
end
