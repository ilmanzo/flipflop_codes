defmodule FlipflopCodes.Puzzle1 do
  @moduledoc """
  Solves Puzzle 1: calculating the score of bananas based on syllables.
  """

  @doc """
  Reads the puzzle1.txt file from the given folder and returns the total score.
  """
  def run(args \\ []) do
    folder =
      case args do
        [folder_name] -> folder_name
        _ -> "examples"
      end

    IO.puts("Part 1: #{part1(folder)}")
    IO.puts("Part 2: #{part2(folder)}")
    IO.puts("Part 3: #{part3(folder)}")
  end

  @doc """
  Reads the puzzle1.txt file from the given folder and returns the total score.
  """
  def part1(folder \\ "examples") do
    FlipflopCodes.Input.stream!(folder, "puzzle1.txt")
    |> Stream.map(&score_banana/1)
    |> Enum.sum()
  end

  @doc """
  Reads the puzzle1.txt file from the given folder and returns the total score ignoring odd scores.
  """
  def part2(folder \\ "examples") do
    FlipflopCodes.Input.stream!(folder, "puzzle1.txt")
    |> Stream.map(&score_banana/1)
    |> Stream.reject(fn score -> rem(score, 2) != 0 end)
    |> Enum.sum()
  end

  @doc """
  Reads the puzzle1.txt file from the given folder and returns the total score excluding bananas with "ne".
  """
  def part3(folder \\ "examples") do
    FlipflopCodes.Input.stream!(folder, "puzzle1.txt")
    |> Stream.reject(&String.contains?(&1, "ne"))
    |> Stream.map(&score_banana/1)
    |> Enum.sum()
  end

  @doc """
  Calculates the score for a single banana string.
  Counts occurrences of "ba", "na", and "ne" (the banena substitute).
  """
  def score_banana(banana) do
    ~r/(ba|na|ne)/
    |> Regex.scan(banana)
    |> length()
  end
end
