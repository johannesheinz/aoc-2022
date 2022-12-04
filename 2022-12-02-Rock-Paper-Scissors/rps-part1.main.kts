#!/usr/bin/env kotlin

import java.io.File


enum class Choice(val score: Int) {
    ROCK(1), PAPER(2), SCISSORS(3), USELESS(-1)
}

fun mapInputToChoice(input: String) = when(input) {
    "A", "X" -> Choice.ROCK
    "B", "Y" -> Choice.PAPER
    "C", "Z" -> Choice.SCISSORS
    else -> Choice.USELESS
}

fun readInput(fileName: String)
    = File(fileName).useLines { it.toList() }

fun calculateScore(myInput: Choice, otherInput: Choice): Int {
    var myScore = 0
    when {
        myInput === otherInput -> myScore = 3 // draw
        (myInput === Choice.ROCK && otherInput === Choice.SCISSORS) || (myInput === Choice.PAPER && otherInput === Choice.ROCK) || (myInput === Choice.SCISSORS && otherInput === Choice.PAPER) -> myScore = 6 // win
    }

    return myScore + myInput.score
}

var scorePlayerOne = 0
var scorePlayerTwo = 0

val fileName = if (args.size >= 1) args[0] else "input.txt"
println("Reading from " + fileName)
println()
val input = readInput(fileName)

for (line in input) {
    val values = line.split(" ")
    val valueOne = mapInputToChoice(values[0])
    val valueTwo = mapInputToChoice(values[1])

    scorePlayerOne += calculateScore(valueOne, valueTwo)
    scorePlayerTwo += calculateScore(valueTwo, valueOne)
}

println("--- SCORES: -------------")
println(" Player 1: " + scorePlayerOne)
println(" Player 2: " + scorePlayerTwo)
