defmodule Mix.Tasks.Start do
  @shortdoc "Start Dungeon Crawl Game"
  @moduledoc "Printed when user requests `mix help start`"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    # Mix.shell().info("Hello, Elixir")
    DungeonCrawl.CLI.Main.start_game
  end
end
