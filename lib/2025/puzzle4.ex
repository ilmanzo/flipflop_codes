defmodule FlipflopCodes.Puzzle4 do
  @moduledoc """
  Solves Puzzle 4: calculating the total steps taken to collect trash on a beach.
  """

  @doc """
  Reads the puzzle4.txt file from the given folder and returns the total steps for part 1.
  """
  def part1(folder \\ "examples") do
    folder
    |> parsed_stream()
    |> calculate_steps(&manhattan_distance/2)
  end

  @doc """
  Reads the puzzle4.txt file from the given folder and returns the total steps for part 2.
  """
  def part2(folder \\ "examples") do
    folder
    |> parsed_stream()
    |> calculate_steps(&chebyshev_distance/2)
  end

  @doc """
  Reads the puzzle4.txt file from the given folder and returns the total steps for part 3.
  """
  def part3(folder \\ "examples") do
    folder
    |> parsed_stream()
    |> Enum.sort_by(fn coord -> manhattan_distance({0, 0}, coord) end)
    |> calculate_steps(&chebyshev_distance/2)
  end

  defp parsed_stream(folder) do
    FlipflopCodes.Utils.stream!(folder, "puzzle4.txt")
    |> Stream.map(&parse_coord/1)
  end

  defp calculate_steps(coords, distance_fn) do
    coords
    |> Enum.reduce({0, {0, 0}}, fn coord, {total_steps, curr_coord} ->
      distance = distance_fn.(curr_coord, coord)
      {total_steps + distance, coord}
    end)
    |> elem(0)
  end

  defp manhattan_distance({x1, y1}, {x2, y2}) do
    abs(x1 - x2) + abs(y1 - y2)
  end

  defp chebyshev_distance({x1, y1}, {x2, y2}) do
    max(abs(x1 - x2), abs(y1 - y2))
  end

  defp parse_coord(line) do
    [x, y] = String.split(line, ",")
    {String.to_integer(String.trim(x)), String.to_integer(String.trim(y))}
  end
end
