defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action
  defstruct id: nil, label: nil

  def forward, do: %Action{id: :forward, label: "Move forward."}
  def backward, do: %Action{id: :backward, label: "Move backward. You are thirsty for battle."}
  def rest, do: %Action{id: :rest, label: "Take a better look and rest."}
  def search, do: %Action{id: :search, label: "Search for room."}

  defimpl String.Chars do
    def to_string(action), do: action.label
  end

  @type t :: %Action{id: atom, label: String.t}
end
