defmodule Mix.Tasks.Start do
  @shortdoc "Start Dungeon Crawl Application"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    # Mix.shell().info("Hello, Elixir")
    DungeonCrawl.CLI.Main.start_game
  end
end
