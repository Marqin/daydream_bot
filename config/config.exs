use Mix.Config

config :porcelain, goon_warn_if_missing: false

config :daydream_bot, cmd_prefix: "."

config :blizz_ex, locale: "en_GB"
config :blizz_ex, url: "https://eu.api.battle.net/"

import_config "secret.exs"
