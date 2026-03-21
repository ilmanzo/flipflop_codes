defmodule FlipflopCodes.Puzzle5 do
  @moduledoc """
  Solves Puzzle 5: calculating train steps through tunnels, finding unvisited tunnels, and handling powered tunnels.
  """

  alias FlipflopCodes.Utils

  @doc """
  Reads the puzzle5.txt file from the given folder and returns the total steps.
  """
  def part1(folder \\ "examples") do
    parsed_stream(folder)
    |> Stream.map(&count_steps/1)
    |> Enum.sum()
  end

  @doc """
  Reads the puzzle5.txt file from the given folder and returns unvisited tunnels as a string.
  """
  def part2(folder \\ "examples") do
    parsed_stream(folder)
    |> Stream.map(&get_not_visited/1)
    |> Enum.join("\n")
  end

  @doc """
  Reads the puzzle5.txt file from the given folder and returns the total steps with powered tunnels rules.
  """
  def part3(folder \\ "examples") do
    parsed_stream(folder)
    |> Stream.map(&count_powered_steps/1)
    |> Enum.sum()
  end

  defp parsed_stream(folder) do
    Utils.stream!(folder, "puzzle5.txt")
    |> Stream.map(&parse/1)
  end

  @doc """
  Parses a tunnel sequence into a jump map for traversal.
  Returns `{jumps_map, sequence_length, original_sequence}`.
  """
  def parse(sequence) do
    positions =
      sequence
      |> String.to_charlist()
      |> Enum.with_index()
      |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))

    jumps =
      Enum.reduce(positions, %{}, fn {char_code, [p1, p2]}, acc ->
        dist = if char_code in ?A..?Z, do: -abs(p1 - p2), else: abs(p1 - p2)
        char = <<char_code>>

        acc
        |> Map.put(p1, %{char: char, dist: dist, next: p2 + 1})
        |> Map.put(p2, %{char: char, dist: dist, next: p1 + 1})
      end)

    {jumps, String.length(sequence), sequence}
  end

  def count_steps(parsed) do
    {steps, _visited} = walk(parsed, :normal)
    steps
  end

  def count_powered_steps(parsed) do
    {steps, _visited} = walk(parsed, :powered)
    steps
  end


  def get_not_visited({_jumps, _len, seq} = parsed) do
    {_steps, visited} = walk(parsed, :normal)

    uniques = seq |> String.graphemes() |> Enum.uniq()

    (uniques -- visited)
    |> Enum.join()
  end

  defp walk({jumps, len, _seq}, mode) do
    do_walk(0, jumps, len, mode, 0, [])
  end

  defp do_walk(idx, _jumps, len, _mode, steps, visited) when idx >= len do
    {steps, Enum.reverse(visited)}
  end

  defp do_walk(idx, jumps, len, mode, steps, visited) do
    jump = Map.fetch!(jumps, idx)
    step_val = if mode == :powered, do: jump.dist, else: abs(jump.dist)

    do_walk(jump.next, jumps, len, mode, steps + step_val, [jump.char | visited])
  end
end
