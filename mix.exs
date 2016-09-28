defmodule DaydreamBot.Mixfile do
  use Mix.Project

  def project do
    [app: :daydream_bot,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:discord_ex, :logger, :blizz_ex],
     mod: {DaydreamBot, []}]
  end

  defp deps do
    [{:discord_ex, git: "https://github.com/rmcafee/discord_ex.git"},
     {:blizz_ex, git: "https://github.com/marqin/blizz_ex.git"}]
  end
end
