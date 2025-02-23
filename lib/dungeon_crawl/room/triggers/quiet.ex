defmodule DungeonCrawl.Room.Triggers.Quiet do
  @behaviour DungeonCrawl.Room.Trigger
  def run(character, action) do
    case action.id do
      :rest -> {character, :rest}
      _ -> {character, action.id}
    end
    # {character, :rest}
  end
end
