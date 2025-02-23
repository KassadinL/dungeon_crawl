defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  defstruct description: nil, actions: []

  alias DungeonCrawl.Room.Action

  def all do
    [
      %Room{
        description: "You found a quiet place. Looks safe for a little nap.",
        actions: [Action.forward(), Action.rest()],
      },
    ]
  end
end
