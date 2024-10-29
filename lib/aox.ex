defmodule Aox do
  def main(day) when is_integer(day) do
    case day do
      1 -> Aox.Day1.solve()
      _ -> IO.puts("No solved yet")
    end
  end
end