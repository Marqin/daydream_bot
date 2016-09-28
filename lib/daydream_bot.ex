defmodule DaydreamBot do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(DaydreamBot.Worker, [%{
        handler: DaydreamBot.Worker,
        token: Application.get_env(:daydream_bot, :discord_token)
      }]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DaydreamBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
