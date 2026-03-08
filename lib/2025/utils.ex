defmodule FlipflopCodes.Utils do
  @moduledoc """
  Utility functions for reading inputs and running puzzles.
  """

  @doc """
  Runs the puzzle parts for a given folder, taking a list of three functions.
  """
  def run(args \\ [], funs) do
    folder =
      case args do
        [folder_name] -> folder_name
        _ -> "examples"
      end

    [fun1, fun2, fun3] = funs
    IO.puts("Part 1: #{fun1.(folder)}")
    IO.puts("Part 2: #{fun2.(folder)}")
    IO.puts("Part 3: #{fun3.(folder)}")
  end

  @doc """
  Streams lines from the given file in the specified folder (e.g. "examples" or "inputs").
  Removes trailing whitespace and skips empty lines.
  """
  def stream!(folder, filename) do
    path = "2025/#{folder}/#{filename}"

    unless File.exists?(path) do
      Mix.raise("""
      Input file not found: #{path}

      Because puzzle inputs are not committed to the repository, you must provide them manually.
      Please create this file and paste your puzzle input into it before running the module.
      """)
    end

    path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.reject(&(&1 == ""))
  end
end
