defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  defstruct description: nil, actions: [], trigger: nil

  alias DungeonCrawl.Room.Action
  alias DungeonCrawl.Room.Triggers

  def all do
    [
      %Room{
        description: "You found a quiet place. Looks safe for a little nap.",
        actions: [Action.forward(), Action.rest()],
        trigger: Triggers.Quiet,
      },
      %Room{
        description: "You can see the light of day. You found the exit.",
        actions: [Action.forward()],
        trigger: Triggers.Exit,
      },
    ]
  end
end
