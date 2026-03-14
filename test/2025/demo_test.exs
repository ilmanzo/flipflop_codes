defmodule FlipflopCodes.DemoTest do
  use ExUnit.Case
  alias FlipflopCodes.Demo

  test "solves part 1 for examples folder" do
    assert Demo.part1("examples") == 474
  end

  test "solves part 2 for examples folder" do
    assert Demo.part2("examples") == 43
  end

  test "solves part 3 for examples folder" do
    assert Demo.part3("examples") == 690
  end

  test "solves the demo for inputs folder" do
    if File.exists?("2025/inputs/demo.txt") do
      assert is_integer(Demo.part1("inputs"))
      assert is_integer(Demo.part2("inputs"))
      assert is_integer(Demo.part3("inputs"))
    end
  end
end
