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
    DungeonCrawl.CLI.HeroChoice.start()
  end

  defp crawl(character, rooms) do
    Shell.info("")
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")
    Shell.info("")

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
  defp handle_action_result({character, action_id}) do
    case action_id do
      :rest -> take_a_sleep(character)
      _ -> Shell.info("No time to sleep?\nOk...")
    end

    crawl(character, DungeonCrawl.Room.all())
  end

  defp take_a_sleep(_character) do
    alias Mix.Shell.IO, as: Shell

    Shell.info("Take a nap.")
    # Shell.info("You will recover 3 hit points.")
    Process.sleep(1000)
    Shell.info("Open your eyes, this is a new day.")
    Shell.prompt("Press Enter to continue your adventure.")
    # character.hit_point = max(character.hit_point + 3, character.max_hit_point)
    # character
  end
end
