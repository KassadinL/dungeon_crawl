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
    # {chosen, _} = Integer.parse(answer)
    case Integer.parse(answer) do
      {chosen, _} -> chosen - 1
      :error -> choose_one_more_time()
    end
    # chosen - 1
  end

  defp choose_one_more_time do
    answer = Shell.prompt("It's time to choose~\nGive me your answer\n")
    parse_answer(answer)
  end

end
