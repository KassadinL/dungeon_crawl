defmodule DungeonCrawl.Room.Trigger do
  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Acion

  @callback run(Character.t, Acion.t) :: {Character.t, atom}
end
