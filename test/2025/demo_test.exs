defmodule FlipflopCodes.DemoTest do
  use ExUnit.Case
  alias FlipflopCodes.Demo

  test "solves the demo for examples folder" do
    assert Demo.solve("examples") == {474, 43, 690}
  end

  test "solves the demo for inputs folder" do
    # You would need to put the expected sum and average for the inputs folder here if known.
    # For now, we'll just test that it runs without crashing and returns a tuple of numbers.
    {sum, average, combined} = Demo.solve("inputs")
    assert is_integer(sum)
    assert is_integer(average)
    assert is_integer(combined)
  end
end
