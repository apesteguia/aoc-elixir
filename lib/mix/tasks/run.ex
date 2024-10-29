defmodule Mix.Tasks.MainRun do
  use Mix.Task

  def run(args) do
    case Enum.empty?(args) do
      true -> IO.puts("Determine the day\n")
      _ -> Aox.main(hd(args) |> String.to_integer())
    end
  end
end
