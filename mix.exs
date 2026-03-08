defmodule FlipflopCodes.MixProject do
  use Mix.Project

  def project do
    [
      app: :flipflop_codes,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [
      "2025": &run_2025/1
    ]
  end

  defp run_2025(args) do
    Mix.Task.run("app.start")

    modules =
      case args do
        [] ->
          [
            {"demo", FlipflopCodes.Demo},
            {"puzzle1", FlipflopCodes.Puzzle1},
            {"puzzle2", FlipflopCodes.Puzzle2}
          ]

        [name | _] ->
          case name do
            "demo" -> [{"demo", FlipflopCodes.Demo}]
            "puzzle1" -> [{"puzzle1", FlipflopCodes.Puzzle1}]
            "puzzle2" -> [{"puzzle2", FlipflopCodes.Puzzle2}]
            _ -> Mix.raise("Unknown module: #{name}")
          end
      end

    Enum.each(modules, fn {name, module} ->
      IO.puts("=== Running #{name} ===")
      IO.puts("--- Examples ---")
      module.run(["examples"])
      IO.puts("--- Inputs ---")
      module.run(["inputs"])
      IO.puts("")
    end)
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
