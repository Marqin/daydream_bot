# Daydream Bot

Discord bot for WoW guild I'm member.

It's written in Elixir and it's answers are laggy, because BNet API is slow.

wow_api_library: https://github.com/Marqin/blizz_ex/  
discord_library: https://github.com/rmcafee/discord_ex/

## Usage

0. Install Elixir 1.3
1. Rename `/config/secret.exs.example` to `/config/secret.exs` and fill it.
2. Get dependencies - `mix deps.get`
3. Run bot - `iex -S mix`

First startup will be longer, because it will compile all dependencies.

If you want to hot-reload bot code go to your open iex and run `recompile()` in it.

## Commands

`.help` - help message  
`.info` - basic info about bot  
`.heal` - list guild healers that are 110lvl  
`.tank` - list guild tanks that are 110lvl  
`.dps` - list guild dps that are 110lvl
