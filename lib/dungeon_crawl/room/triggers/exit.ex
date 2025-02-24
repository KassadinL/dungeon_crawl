defmodule DungeonCrawl.Room.Triggers.Exit do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Room.Action

  def run(character, %Action{id: :backward}) do
    {character, :forward}
  end
  def run(character, %Action{id: :forward}) do
    {character, :exit}
  end
end
