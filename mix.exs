defmodule MetaweatherProject.MixProject do
  use Mix.Project

  def project do
    [
      app: :metaweather_project,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:decimal, "~> 2.0"},
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2"},
      {:mock, "~> 0.3.0", only: :test}
    ]
  end
end
