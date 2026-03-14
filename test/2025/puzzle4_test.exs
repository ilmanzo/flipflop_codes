defmodule FlipflopCodes.Puzzle4Test do
  use ExUnit.Case
  alias FlipflopCodes.Puzzle4

  test "solves the puzzle part 1 for examples folder" do
    assert Puzzle4.part1("examples") == 24
  end

  test "solves the puzzle part 2 for examples folder" do
    assert Puzzle4.part2("examples") == 12
  end

  test "solves the puzzle part 3 for examples folder" do
    assert Puzzle4.part3("examples") == 9
  end

  test "solves the puzzle for inputs folder" do
    score1 = Puzzle4.part1("inputs")
    assert is_integer(score1)

    score2 = Puzzle4.part2("inputs")
    assert is_integer(score2)

    score3 = Puzzle4.part3("inputs")
    assert is_integer(score3)
  end
end
