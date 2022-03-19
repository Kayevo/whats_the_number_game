defmodule GuessNumber do
  use Application

  def start(_, _) do
    run()
    {:ok, self()}
  end

  def run() do
    IO.puts("Welcome do the Guess The Number Game.")

    IO.gets("Pick the game difficult level (1, 2 or 3): ")
    |> Integer.parse()
    |> validateLevel()
    |> IO.inspect()
  end

  def validateLevel(:error) do
    IO.puts("Invalid level.")
    run()
  end

  def validateLevel({intLevel, _}), do: intLevel
end
