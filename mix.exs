defmodule Lingua.MixProject do
  use Mix.Project

  @version "0.2.0"

  def project do
    [
      app: :lingua,
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      description: description(),
      test_coverage: [tool: ExCoveralls],
      package: package(),
      deps: deps()
    ]
  end

  defp description do
    "An Elixir wrapper around the Rust Lingua language detection library."
  end

  defp package do
    [
      maintainers: ["Josh Rotenberg"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/joshrotenberg/lingua_ex"},
      name: :lingua,
      files: [
        "lib",
        "mix.exs",
        "README.md",
        "LICENSE",
        "native/lingua_nif/Cargo.*",
        "native/lingua_nif/src",
        "checksum-*.exs"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:rustler_precompiled, "~> 0.6.2"},
      {:rustler, "~> 0.29.1", optional: true},
      {:credo, "~> 1.5.5", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.14.0", only: :test},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end
end
