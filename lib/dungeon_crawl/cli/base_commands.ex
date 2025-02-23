defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} -> Shell.info("#{index} - #{option}") end)

    options
  end

  def generate_question(options) do
    Shell.info("")
    # IO.inspect(options, label: "generate_question receives: ")
    options = Enum.join(1..Enum.count(options), ", ")
    "Which one to choose? [#{options}]\n"
  end

  def parse_answer(answer) do
    {chosen, _} = Integer.parse(answer)
    chosen - 1
  end

end
