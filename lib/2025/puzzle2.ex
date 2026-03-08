defmodule FlipflopCodes.Puzzle2 do
  @moduledoc """
  Solves Puzzle 2: calculating the maximum height of a rollercoaster.
  """

  @doc """
  Runs the puzzle parts for a given folder.
  """
  def run(args \\ []) do
    FlipflopCodes.Utils.run(args, [&part1/1, &part2/1, &part3/1])
  end

  @doc """
  Reads the puzzle2.txt file from the given folder and returns the maximum height reached.
  """
  def part1(folder \\ "examples") do
    FlipflopCodes.Utils.stream!(folder, "puzzle2.txt")
    |> Enum.flat_map(&String.graphemes/1)
    |> Enum.reduce({0, 0}, fn
      "^", {current_height, max_height} ->
        new_height = current_height + 1
        {new_height, max(new_height, max_height)}

      "v", {current_height, max_height} ->
        {current_height - 1, max_height}

      _, acc ->
        acc
    end)
    |> elem(1)
  end

  @doc """
  Reads the puzzle2.txt file from the given folder and returns the maximum height reached
  with cumulative non-linear height changes.
  """
  def part2(folder \\ "examples") do
    FlipflopCodes.Utils.stream!(folder, "puzzle2.txt")
    |> Enum.flat_map(&String.graphemes/1)
    |> Enum.reduce({0, 0, nil, 0}, fn
      "^", {current_height, max_height, last_move, consecutive_count} ->
        count = if last_move == "^", do: consecutive_count + 1, else: 1
        new_height = current_height + count
        {new_height, max(new_height, max_height), "^", count}

      "v", {current_height, max_height, last_move, consecutive_count} ->
        count = if last_move == "v", do: consecutive_count + 1, else: 1
        new_height = current_height - count
        {new_height, max(new_height, max_height), "v", count}

      _, acc ->
        acc
    end)
    |> elem(1)
  end

  @doc """
  Reads the puzzle2.txt file from the given folder and returns the maximum height reached
  using the Fibonacci sequence for consecutive movements.
  """
  def part3(folder \\ "examples") do
    FlipflopCodes.Utils.stream!(folder, "puzzle2.txt")
    |> Enum.flat_map(&String.graphemes/1)
    |> solve_part3()
  end

  @doc """
  Solves part 3 given a list of graphemes. This is exposed for easier testing.
  """
  def solve_part3(graphemes) do
    graphemes
    |> Enum.filter(&(&1 in ["^", "v"]))
    |> Enum.chunk_by(& &1)
    |> Enum.map(fn chunk -> {hd(chunk), length(chunk)} end)
    |> Enum.reduce({0, 0}, fn {dir, count}, {current_height, max_height} ->
      change = fib(count)
      new_height = if dir == "^", do: current_height + change, else: current_height - change
      {new_height, max(new_height, max_height)}
    end)
    |> elem(1)
  end

  defp fib(n), do: fib(n, 0, 1)
  defp fib(0, a, _b), do: a
  defp fib(n, a, b), do: fib(n - 1, b, a + b)
end
