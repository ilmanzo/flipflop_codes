defmodule FlipflopCodes.Puzzle5Test do
  use ExUnit.Case
  alias FlipflopCodes.Puzzle5

  @example "ABccksiPiBAksP"

  test "count_steps/1 with example input" do
    assert @example |> Puzzle5.parse() |> Puzzle5.count_steps() == 38
  end

  test "get_not_visited/1 with example input" do
    assert @example |> Puzzle5.parse() |> Puzzle5.get_not_visited() == "Bc"
  end

  test "count_powered_steps/1 with example input" do
    assert @example |> Puzzle5.parse() |> Puzzle5.count_powered_steps() == -6
  end

  test "part1/1 with example input" do
    assert Puzzle5.part1("examples") == 38
  end

  test "part2/1 with example input" do
    assert Puzzle5.part2("examples") == "Bc"
  end

  test "part3/1 with example input" do
    assert Puzzle5.part3("examples") == -6
  end
end
