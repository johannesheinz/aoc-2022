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

  def nextStep(step, [previous_head, previous_tail, result_set]) do
    next_head = RopeBridge.nextHead(step, previous_head)
    next_tail = RopeBridge.nextTail(next_head, previous_tail)

    # IO.inspect([step, next_head, next_tail])
    result_set = result_set |> MapSet.put(next_tail)

    [next_head, next_tail, result_set]
  end

  def nextHead(step, {x, y}) do
    case step do
      "U" -> {x, y + 1}
      "D" -> {x, y - 1}
      "R" -> {x + 1, y}
      "L" -> {x - 1, y}
    end
  end

  def nextTail({x_head, y_head}, {x_tail, y_tail}) do
    cond do
      x_head == x_tail and y_head == (y_tail + 2) -> {x_tail, y_tail + 1}
      x_head == x_tail and y_head == (y_tail - 2) -> {x_tail, y_tail - 1}
      x_head == (x_tail + 2) and y_head == y_tail -> {x_tail + 1, y_tail}
      x_head == (x_tail - 2) and y_head == y_tail -> {x_tail - 1, y_tail}
      x_head == (x_tail + 2) -> {x_tail + 1, y_head}
      x_head == (x_tail - 2) -> {x_tail - 1, y_head}
      y_head == (y_tail + 2) -> {x_head, y_tail + 1}
      y_head == (y_tail - 2) -> {x_head, y_tail - 1}
      true -> {x_tail, y_tail}
    end
  end

end


filename = Utils.getFilename()
lines = Utils.readFile(filename)

total_steps = Enum.reduce(lines, [], &RopeBridge.parseSteps/2)

[_, _, visited_places] = total_steps
  |> Enum.reduce([{0, 0}, {0, 0}, MapSet.new()], &RopeBridge.nextStep/2)

# IO.inspect(visited_places)

IO.puts(String.duplicate("-", 40))
IO.puts(" RESULT: #{MapSet.size(visited_places)}")
IO.puts(String.duplicate("-", 40))
