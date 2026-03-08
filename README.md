# FlipflopCodes

FlipflopCodes is an Elixir project containing solutions to coding puzzles for the year 2025. It reads input files (from `examples` or `inputs` directories) and computes scores or answers for different parts of the puzzles.

## Running the Modules

The project uses a custom Mix alias to easily run the puzzle modules. You can run all modules or specify a single module to run.

To run all modules (which currently include `demo` and `puzzle1`):
```bash
mix 2025
```

To run a specific module, pass its name as an argument. For example, to run the `demo` module:
```bash
mix 2025 demo
```

To run the `puzzle1` module:
```bash
mix 2025 puzzle1
```

When you run a module, it will typically execute its logic against both the provided example inputs (`2025/examples/`) and the real puzzle inputs (`2025/inputs/`), outputting the results for each part of the puzzle.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `flipflop_codes` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:flipflop_codes, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/flipflop_codes>.
