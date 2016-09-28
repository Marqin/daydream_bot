defmodule DaydreamBot.Bot.CommandHandler do

  alias DiscordEx.RestClient.Resources.Channel

  def handle({"info", _}, data, state) do
    info =
"""
```haskell
DaydreamBot made by Marqin
bot_code: https://github.com/Marqin/daydream_bot/
wow_api_library: https://github.com/Marqin/blizz_ex/
discord_library: https://github.com/rmcafee/discord_ex/
```
"""
    Channel.send_message(state[:rest_client], data["channel_id"], %{content: info})
  end

  def handle({"help", _}, data, state) do
    info =
"""
```haskell
Commands:
.help - this message
.info - basic info about this bot
.heal - list guild healers that are 110lvl
.tank - list guild tanks that are 110lvl
.dps - list guild dps that are 110lvl
```
"""
    Channel.send_message(state[:rest_client], data["channel_id"], %{content: info})
  end

  def handle({"heal", _}, data, state) do
    healers = Enum.join(get_members("HEALING"), ", ")
    Channel.send_message(state[:rest_client], data["channel_id"], %{content: healers})
  end

  def handle({"tank", _}, data, state) do
    tanks = Enum.join(get_members("TANK"), ", ")
    Channel.send_message(state[:rest_client], data["channel_id"], %{content: tanks})
  end

  def handle({"dps", _}, data, state) do
    dps = Enum.join(get_members("DPS"), ", ")
    Channel.send_message(state[:rest_client], data["channel_id"], %{content: dps})
  end

  def handle(_, _, _) do
    :noop
  end

  defp get_members(role) do
    case BlizzEx.WoW.Guild.get("burning-legion", "Daydream", "members") do
      {:ok, data} ->
        Enum.filter_map(
          data["members"],
          &(get_role(&1) == role and get_level(&1) == 110),
          &(get_name(&1))
        )
      _ -> []
    end
  end

  defp get_name(character) do
    character["character"]["name"]
  end

  defp get_level(character) do
    character["character"]["level"]
  end

  defp get_role(character) do
    # roles: HEALING, TANK, DPS
    character["character"]["spec"]["role"]
  end
end
