defmodule GuessNumber do
  use Application

  def start(_, _) do
    run()
    {:ok, self()}
  end

  def run() do
    IO.puts("Welcome do the Guess The Number Game.")

    IO.gets("Pick the game difficult level (1, 2 or 3): ")
    |> validateLevel()
    |> generateSecretNum()
    |> IO.inspect()
    |> play()
  end

  def play(secretNum, isFinishGame, attemps) when isFinishGame == true do
    IO.puts("The secret number is: #{secretNum}. And you attemp #{attemps} tines")
  end

  def play(secretNum, isFinishGame, attemps) when isFinishGame == false do
    pickedNum = IO.gets("Try guess the number: ")
    pickedNum = validatePickedNum(pickedNum)

    attemps = attemps + 1

    if(isRigthSecretNum(pickedNum, secretNum)) do
      play(secretNum, true, attemps)
    else
      play(secretNum, isFinishGame, attemps)
    end
  end

  def play(secretNum) do
    play(secretNum, false, 0)
  end

  def isRigthSecretNum(pickedNum, secretNum) do
    if(pickedNum == secretNum) do
      true
    else
      false
    end
  end

  def validatePickedNum(:error) do
    IO.puts("Invalid number.")
    run()
  end

  def validatePickedNum({pickedNum, _}), do: pickedNum

  def validatePickedNum(data) do
    data
    |> Integer.parse()
    |> validatePickedNum()
  end

  def validateLevel({intLevel, _}) do
    if(intLevel < 1 or intLevel > 3) do
      IO.puts("Invalid level.")
      run()
    else
      intLevel
    end
  end

  def validateLevel(:error) do
    IO.puts("Invalid level.")
    run()
  end

  def validateLevel(data) do
    data
    |> Integer.parse()
    |> validateLevel()
  end

  def generateSecretNum(level) do
    level
    |> getRange()
    |> Enum.random()
  end

  def getRange(level) do
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
