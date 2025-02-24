defmodule DungeonCrawl.Room.Triggers.Enemy do
  @behaviour DungeonCrawl.Room.Trigger

  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Room.Action

  def run(character, %Action{id: :forward}) do
    enemy = Enum.random(DungeonCrawl.Enemies.all())

    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} wants to fight.")
    Shell.info("You have #{character.hit_points}/#{character.max_hit_points} HP")
    Shell.info("And the enemy has #{enemy.hit_points} HP.")
    Shell.info("You were prepared and attack first.")
    {updated_char, _enemy} = DungeonCrawl.Battle.fight(character, enemy)

    {updated_char, :forward}
  end
end
