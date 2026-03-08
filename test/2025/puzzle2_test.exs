defmodule FlipflopCodes.Puzzle2Test do
  use ExUnit.Case

  alias FlipflopCodes.Puzzle2

  test "part1 returns the correct max height for the example" do
    assert Puzzle2.part1("examples") == 6
  end

  test "part2 returns the correct cumulative max height for the example" do
    assert Puzzle2.part2("examples") == 15
  end

  test "part3 returns the correct height using Fibonacci for the first example" do
    assert Puzzle2.part3("examples") == 4
  end

  test "part3 returns the correct height using Fibonacci for the second example" do
    graphemes = String.graphemes("^^^^^^^^^^^^vvvvvvvvv^")
    assert Puzzle2.solve_part3(graphemes) == 144
  end
end
