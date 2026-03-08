defmodule FlipflopCodes.Input do
  @moduledoc """
  Helper module for reading input files, avoiding redundant file loading logic.
  """

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
