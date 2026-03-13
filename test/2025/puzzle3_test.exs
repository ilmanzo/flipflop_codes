defmodule FlipflopCodes.Puzzle3Test do
  use ExUnit.Case

  alias FlipflopCodes.Puzzle3

  test "part1 returns the most frequent color for the example" do
    assert Puzzle3.part1("examples") == "10,20,30"
  end

  test "label_bush identifies colors and special bushes correctly" do
    assert Puzzle3.label_bush("30,20,10") == :red
    assert Puzzle3.label_bush("10,30,20") == :green
    assert Puzzle3.label_bush("10,20,30") == :blue
    assert Puzzle3.label_bush("10,50,10") == :special
    assert Puzzle3.label_bush("50,10,50") == :special
    assert Puzzle3.label_bush("10,10,10") == :special
  end

  test "part2 returns the number of Green bushes for the example" do
    # The example data has no Green bushes, so the answer is 0.
    assert Puzzle3.part2("examples") == 0
  end

  test "bush_price returns correct prices" do
    assert Puzzle3.bush_price(:red) == 5
    assert Puzzle3.bush_price(:green) == 2
    assert Puzzle3.bush_price(:blue) == 4
    assert Puzzle3.bush_price(:special) == 10
  end

  test "part3 returns the total price points for the example" do
    assert Puzzle3.part3("examples") == 37
  end
end
