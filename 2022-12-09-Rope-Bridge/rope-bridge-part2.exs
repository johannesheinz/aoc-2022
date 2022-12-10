#! /usr/bin/env elixir

defmodule Utils do
  def getFilename() do
    cli_args = System.argv()
    if length(cli_args) > 0, do: Enum.at(cli_args, 0), else: "input.txt"
  end

  def readFile(filename) do
    IO.puts("Reading from #{filename}...\n")

    case File.read(filename) do
      {:error, reason} -> IO.puts("[ERROR] Could not read fronm #{filename}: #{reason}")
      {:ok, body} -> body |> String.split("\n", trim: true)
    end
  end

end


defmodule RopeBridge do

  def parseSteps(line, total_steps) do
    elements = String.split(line, " ", trim: true)
    direction = Enum.at(elements, 0)
    amount = String.to_integer(Enum.at(elements, 1))

    list = Enum.reduce(1..amount, [], fn(_, acc) -> [direction | acc] end)
    total_steps ++ list
  end

  def nextStep(step, [previous_positions, result_set]) do

    previous_head = previous_positions |> Enum.at(9)
    next_head = RopeBridge.nextHead(step, previous_head)

    IO.inspect([previous_head, step, next_head])

    previous_positions = Enum.reduce(1..9, [next_head], fn(index, next_positions) ->
      next_ancestor = next_positions |> Enum.at(0)
      previous_position = previous_positions |> Enum.at(9 - index)
      next_position = RopeBridge.nextDescendant(next_ancestor, previous_position)

      [next_position | next_positions]
    end)

    # IO.inspect([step, previous_positions])
    next_tail = previous_positions |> Enum.at(0)
    result_set = result_set |> MapSet.put(next_tail)

    [previous_positions, result_set]
  end

  def nextHead(step, {x, y}) do
    case step do
      "U" -> {x, y + 1}
      "D" -> {x, y - 1}
      "R" -> {x + 1, y}
      "L" -> {x - 1, y}
    end
  end

  def nextDescendant({x_ancestor, y_ancestor}, {x, y}) do
    cond do
      x_ancestor == x and y_ancestor == (y + 2) -> {x, y + 1}
      x_ancestor == x and y_ancestor == (y - 2) -> {x, y - 1}
      x_ancestor == (x + 2) and y_ancestor == y -> {x + 1, y}
      x_ancestor == (x - 2) and y_ancestor == y -> {x - 1, y}
      x_ancestor == (x + 2) and y_ancestor == (y + 2) -> {x + 1, y + 1}
      x_ancestor == (x + 2) and y_ancestor == (y - 2) -> {x + 1, y - 1}
      x_ancestor == (x - 2) and y_ancestor == (y + 2) -> {x - 1, y + 1}
      x_ancestor == (x - 2) and y_ancestor == (y - 2) -> {x - 1, y - 1}
      x_ancestor == (x + 2) -> {x + 1, y_ancestor}
      x_ancestor == (x - 2) -> {x - 1, y_ancestor}
      y_ancestor == (y + 2) -> {x_ancestor, y + 1}
      y_ancestor == (y - 2) -> {x_ancestor, y - 1}
      true -> {x, y}
    end
  end

end


filename = Utils.getFilename()
lines = Utils.readFile(filename)

total_steps = Enum.reduce(lines, [], &RopeBridge.parseSteps/2)

[_, visited_places] = total_steps
  |> Enum.reduce([[{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}], MapSet.new()], &RopeBridge.nextStep/2)

# IO.inspect(visited_places)

IO.puts(String.duplicate("-", 40))
IO.puts(" RESULT: #{MapSet.size(visited_places)}")
IO.puts(String.duplicate("-", 40))
