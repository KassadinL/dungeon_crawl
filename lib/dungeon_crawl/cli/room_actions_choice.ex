defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.CLI.BaseCommands

  def start(room) do
    Shell.info("")
    Shell.info(room.description)

    room_actions = room.actions
    find_action_by_index = &Enum.at(room_actions, &1)

    chosen_action =
      room_actions
      |> Enum.map(&(&1.label))
      |> BaseCommands.display_options
      |> BaseCommands.generate_question
      |> Shell.prompt
      |> BaseCommands.parse_answer
      |> find_action_by_index.()

    {room, chosen_action}
  end
end
