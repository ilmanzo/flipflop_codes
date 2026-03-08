defmodule FlipflopCodes.Puzzle1Test do
  use ExUnit.Case
  alias FlipflopCodes.Puzzle1

    test "solves the puzzle part 1 for examples folder" do
      assert Puzzle1.part1("examples") == 24
    end
  
    test "solves the puzzle part 2 for examples folder" do
      assert Puzzle1.part2("examples") == 16
    end
  
    test "solves the puzzle part 3 for examples folder" do
      assert Puzzle1.part3("examples") == 19
    end
  
    test "scores individual bananas correctly" do
      assert Puzzle1.score_banana("banana") == 3
      assert Puzzle1.score_banana("banenanana") == 5
      assert Puzzle1.score_banana("bananana") == 4
      assert Puzzle1.score_banana("bananananana") == 6
    end
  
    test "solves the puzzle for inputs folder" do
      score1 = Puzzle1.part1("inputs")
      assert is_integer(score1)
      
      score2 = Puzzle1.part2("inputs")
      assert is_integer(score2)
  
      score3 = Puzzle1.part3("inputs")
      assert is_integer(score3)
    endend
