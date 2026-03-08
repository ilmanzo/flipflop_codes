defmodule FlipflopCodes.Demo do
  @moduledoc """
  Reads the demo.txt file from the given folder and outputs various calculations.
  """

  @doc """
  Runs the puzzle parts for a given folder.
  """
  def run(args \\ []) do
    FlipflopCodes.Utils.run(args, [&part1/1, &part2/1, &part3/1])
  end

  @doc """
  Reads the file from the given folder and outputs the sum.
  """
  def part1(folder \\ "examples") do
    FlipflopCodes.Utils.stream!(folder, "demo.txt")
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  @doc """
  Reads the file from the given folder and outputs the average.
  """
  def part2(folder \\ "examples") do
    numbers =
      FlipflopCodes.Utils.stream!(folder, "demo.txt")
      |> Enum.map(&String.to_integer/1)

    count = length(numbers)
    if count == 0, do: 0, else: round(Enum.sum(numbers) / count)
  end

  @doc """
  Reads the file from the given folder and outputs the combined number.
  """
  def part3(folder \\ "examples") do
    numbers =
      FlipflopCodes.Utils.stream!(folder, "demo.txt")
      |> Enum.map(&String.to_integer/1)

    count = length(numbers)

    most_common_number =
      if count == 0 do
        0
      else
        numbers
        |> Enum.frequencies()
        |> Enum.max_by(fn {_, freq} -> freq end)
        |> elem(0)
      end

    least_common_digit =
      if count == 0 do
        0
      else
        numbers
        |> Enum.flat_map(fn n -> Integer.digits(abs(n)) end)
        |> Enum.frequencies()
        |> Enum.min_by(fn {_, freq} -> freq end)
        |> elem(0)
      end

    if count == 0 do
      0
    else
      String.to_integer("#{most_common_number}#{least_common_digit}")
    end
  end
end
