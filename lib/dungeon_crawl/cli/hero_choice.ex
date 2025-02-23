defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    # Shell.cmd("clear")
    Shell.info("")
    Shell.info("Start by choosing your hero:")

    heros = DungeonCrawl.Heroes.all()
    # find_hero_by_index = fn index -> Enum.at(heros, index) end
    find_hero_by_index = &Enum.at(heros, &1)

    heros
    |> Enum.map(&(&1.name))
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_hero_by_index.()
    |> confirm_hero

  end

  defp display_options(hero_names) do
    hero_names
    |> Enum.with_index(1)
    |> Enum.each(fn {hero_name, index} -> Shell.info("#{index} - #{hero_name}") end)

    hero_names
  end

  defp generate_question(options) do
    Shell.info("")
    # IO.inspect(options, label: "generate_question receives: ")
    options = Enum.join(1..Enum.count(options), ", ")
    "Which one to choose? [#{options}]\n"
  end

  defp parse_answer(answer) do
    {chosen, _} = Integer.parse(answer)
    chosen - 1
  end

  defp confirm_hero(chosen_hero) do
    # Shell.cmd("clear")
    # IO.inspect(chosen_hero, label: "confirm_hero receives: ")
    # Shell.info(chosen_hero.description)
    # Shell.info("You choose #{chosen_hero.name}")
    Shell.info("")
    Shell.info("You choose #{chosen_hero.name}\n#{chosen_hero.description}")
    if Shell.yes?("Confirm?") do
      Shell.info("")
      Shell.info("Ok, little #{String.downcase(chosen_hero.name)}.")
      Shell.info("So...let's start this adventure....")
    else
      start()
    end
  end
end
