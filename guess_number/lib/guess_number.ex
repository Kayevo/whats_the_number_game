defmodule GuessNumber do
  use Application

  def start(_, _) do
    run()
    {:ok, self()}
  end

  def run() do
    IO.puts("Welcome do the Guess The Number Game")
  end
end
