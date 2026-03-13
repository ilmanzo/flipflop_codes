defmodule FlipflopCodes.Puzzle3 do
  @moduledoc """
  Solves Puzzle 3: finding the most frequent color.
  """

  @doc """
  Reads the puzzle3.txt file from the given folder and returns the most frequent color.
  """
  def part1(folder \\ "examples") do
    FlipflopCodes.Utils.stream!(folder, "puzzle3.txt")
    |> Enum.frequencies()
    |> Enum.max_by(fn {_color, count} -> count end)
    |> elem(0)
  end

  @doc """
  Reads the puzzle3.txt file from the given folder and returns the number of bushes labeled Green.
  """
  def part2(folder \\ "examples") do
    FlipflopCodes.Utils.stream!(folder, "puzzle3.txt")
    |> Enum.count(fn line -> label_bush(line) == :green end)
  end

  @doc """
  Determines the label of a bush given its RGB string.
  """
  def label_bush(rgb_string) do
    [r, g, b] = rgb_string |> String.split(",") |> Enum.map(&String.to_integer/1)

    cond do
      r == g or g == b or r == b -> :special
      r > g and r > b -> :red
      g > r and g > b -> :green
      b > r and b > g -> :blue
    end
  end

  @doc """
  Reads the puzzle3.txt file from the given folder and returns the total price points of all bushes.
  """
  def part3(folder \\ "examples") do
    FlipflopCodes.Utils.stream!(folder, "puzzle3.txt")
    |> Stream.map(&label_bush/1)
    |> Stream.map(&bush_price/1)
    |> Enum.sum()
  end

  @doc """
  Returns the price of a bush given its label.
  """
  def bush_price(label) do
    prices=%{
      red: 5,
      green: 2,
      blue: 4,
      special: 10
    }
    prices[label]
  end
end
