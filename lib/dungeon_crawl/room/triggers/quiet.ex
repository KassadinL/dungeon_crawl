defmodule DungeonCrawl.Room.Triggers.Quiet do
  @behaviour DungeonCrawl.Room.Trigger

  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Room.Action

  @sleep_recover_HP 3
  def run(character, %Action{id: :rest}) do
    Shell.info("Take a nap.")
    Shell.info(DungeonCrawl.Character.current_status(character))
    Shell.info("You will recover #{@sleep_recover_HP} hit point.")
    Process.sleep(1000)
    Shell.info("Open your eyes, this is a new day.")
    Shell.prompt("Press Enter to continue your adventure.")
    updated_char = DungeonCrawl.Character.heal(character, @sleep_recover_HP)
    Shell.info(DungeonCrawl.Character.current_status(updated_char))

  {updated_char, :forward}
end
  def run(character, %Action{id: :forward}) do
    Shell.info("No time to sleep?\nOk...")

    {character, :forward}
  end
end
