defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press Enter to continue")
    chosen_hero = hero_choice()
    rooms = DungeonCrawl.Room.all()
    crawl(chosen_hero, rooms)
  end

  defp welcome_message do
    Shell.info("== Dungeon Crawl ===")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find the exit.")
  end

  defp hero_choice do
    hero = DungeonCrawl.CLI.HeroChoice.start()
    %{hero | name: "You"}
  end

  defp crawl(%{hit_points: 0}, _rooms) do
    # Shell.prompt("")
    Shell.info("... ...")
    Shell.info("Unfortunately your wounds are too many to keep walking.")
    Shell.info("You fall onto the floor without strength to carry on.")
    Shell.info("Game over!")
    Shell.prompt("Press Enter to end this adventure.")
  end
  defp crawl(character, rooms) do
    Shell.info("")
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")
    Shell.info("")
    Shell.info(DungeonCrawl.Character.current_status(character))

    rooms
    |> Enum.random
    |> DungeonCrawl.CLI.RoomActionsChoice.start
    |> trigger_action(character)
    |> handle_action_result
  end

  defp trigger_action({room, action}, character) do
    Shell.info("")
    room.trigger.run(character, action)
  end

  defp handle_action_result({_, :exit}) do
    Shell.info("You found the exit. Congratulations~")
  end
  defp handle_action_result({character, _action_id}) do
    crawl(character, DungeonCrawl.Room.all())
  end

end
