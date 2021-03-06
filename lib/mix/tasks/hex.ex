defmodule Mix.Tasks.Hex do
  use Mix.Task

  @shortdoc "Print hex help information"

  @moduledoc """
  Prints hex tasks and their information.

  `mix hex`
  """

  def run(args) do
    {_opts, args, _} = OptionParser.parse(args)
    Hex.start

    case args do
      [] -> general()
      _ ->
        Mix.raise "Invalid arguments, expected: mix hex"
    end
  end

  defp general() do
    Hex.Shell.info "Hex v" <> Hex.version
    Hex.Shell.info "Hex is a package manager for the Erlang ecosystem."
    line_break()

    if Version.match?(System.version, ">= 1.1.0-dev") do
      Hex.Shell.info "Available tasks:"
      line_break()
      Mix.Task.run("help", ["--search", "hex."])
      line_break()
    end

    Hex.Shell.info "Further information can be found here: https://hex.pm/docs/tasks"
  end

  def line_break(), do: Hex.Shell.info ""
end
