defmodule DaydreamBot.Bot do

  alias DiscordEx.Client.Helpers.MessageHelper

  def handle_message(payload, state) do
    prefix = Application.get_env(:daydream_bot, :cmd_prefix)
    parsed_cmd = MessageHelper.msg_command_parse(payload, prefix)
    DaydreamBot.Bot.CommandHandler.handle(parsed_cmd, payload.data, state)
  end

end
