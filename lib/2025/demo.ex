defmodule FlipflopCodes.Demo do
  @moduledoc """
  Reads the demo.txt file from the given folder and outputs the sum of all numbers.
  """

  @doc """
  Reads the file from the given folder (defaults to "examples") and outputs the sum.
  """
  def run(args \\ []) do
    folder =
      case args do
        [folder_name] -> folder_name
        _ -> "examples"
      end

    {sum, average, combined} = solve(folder)

    IO.puts("Sum: #{sum}")
    IO.puts("Average: #{average}")
    IO.puts("Combined: #{combined}")
  end

  @doc """
  Reads the file and returns a tuple with the sum, average, and combined number.
  """
  def solve(folder) do
    numbers =
      FlipflopCodes.Input.stream!(folder, "demo.txt")
      |> Enum.map(&String.to_integer/1)

    sum = Enum.sum(numbers)
    count = length(numbers)
    average = if count == 0, do: 0, else: round(sum / count)

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

    combined =
      if count == 0 do
        0
      else
        String.to_integer("#{most_common_number}#{least_common_digit}")
      end

    {sum, average, combined}
  end
end
