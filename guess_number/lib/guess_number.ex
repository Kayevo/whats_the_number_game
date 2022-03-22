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
    |> get_range()
    |> Enum.random()
    |> IO.inspect()
  end

  def validateLevel(:error) do
    IO.puts("Invalid level.")
    run()
  end

  def validateLevel({intLevel, _}), do: intLevel

  def get_range(level) do
    case level do
      1 ->
        1..10

      2 ->
        1..100

      3 ->
        1..1000

      _ ->
        IO.puts("Invalid level.")
        run()
    end
  end


end
