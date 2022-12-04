package main

import (
	"fmt"
	"os"
	"strings"
)

// Checks error code and exits if necessary with an error message
func check(e error) {
	if e != nil {
		panic(e)
	}
}

// According to the game: a = 1 .. z = 26, A = 27 .. Z = 52
func getAsciiScore(ascii rune) int {
	asciiValue := int(ascii)

	if asciiValue > 96 {
		return asciiValue - 96
	} else {
		return asciiValue - 38
	}
}

// According to the game: a = 1 .. z = 26, A = 27 .. Z = 52
func getAsciiValue(score int) rune {
	if score == 1 {
		return 'a'
	} else if score == 2 {
		return 'b'
	} else if score == 3 {
		return 'c'
	} else if score == 4 {
		return 'd'
	} else if score == 5 {
		return 'e'
	} else if score == 6 {
		return 'f'
	} else if score == 7 {
		return 'g'
	} else if score == 8 {
		return 'h'
	} else if score == 9 {
		return 'i'
	} else if score == 10 {
		return 'j'
	} else if score == 11 {
		return 'k'
	} else if score == 12 {
		return 'l'
	} else if score == 13 {
		return 'm'
	} else if score == 14 {
		return 'n'
	} else if score == 15 {
		return 'o'
	} else if score == 16 {
		return 'p'
	} else if score == 17 {
		return 'q'
	} else if score == 18 {
		return 'r'
	} else if score == 19 {
		return 's'
	} else if score == 20 {
		return 't'
	} else if score == 21 {
		return 'u'
	} else if score == 22 {
		return 'v'
	} else if score == 23 {
		return 'w'
	} else if score == 24 {
		return 'x'
	} else if score == 25 {
		return 'y'
	} else if score == 26 {
		return 'z'
	} else if score == 27 {
		return 'A'
	} else if score == 28 {
		return 'B'
	} else if score == 29 {
		return 'C'
	} else if score == 30 {
		return 'D'
	} else if score == 31 {
		return 'E'
	} else if score == 32 {
		return 'F'
	} else if score == 33 {
		return 'G'
	} else if score == 34 {
		return 'H'
	} else if score == 35 {
		return 'I'
	} else if score == 36 {
		return 'J'
	} else if score == 37 {
		return 'K'
	} else if score == 38 {
		return 'L'
	} else if score == 39 {
		return 'M'
	} else if score == 40 {
		return 'N'
	} else if score == 41 {
		return 'O'
	} else if score == 42 {
		return 'P'
	} else if score == 43 {
		return 'Q'
	} else if score == 44 {
		return 'R'
	} else if score == 45 {
		return 'S'
	} else if score == 46 {
		return 'T'
	} else if score == 47 {
		return 'U'
	} else if score == 48 {
		return 'V'
	} else if score == 49 {
		return 'W'
	} else if score == 50 {
		return 'X'
	} else if score == 51 {
		return 'Y'
	} else if score == 52 {
		return 'Z'
	} else {
		return '-'
	}
}

func readInput(args []string) []string {
	// Get file name as command line parameter if it exists, e.g. 'test.txt'
	fileName := "input.txt"
	if len(args) > 1 {
		fileName = args[1]
	}

	// Debug print to check where we're reading from
	fmt.Println("Reading from " + fileName)
	fmt.Println()

	// Load data from file into memory
	data, err := os.ReadFile(fileName)
	check(err)

	// Return array of strings, each string contains a line from the input file
	return strings.Split(string(data), "\n")
}

func parseLine(line string) [52]bool {
	var isContainedInLine [52]bool

	for _, char := range line {
		index := getAsciiScore(char)
		isContainedInLine[index-1] = true
	}

	return isContainedInLine
}

func main() {
	input := readInput(os.Args)

	totalScore := 0

	// check data integrety
	if len(input)%3 != 0 {
		error := fmt.Sprintf("input size is not divisible by three: %d for %s", len(input), input)
		panic(error)
	}

	for i := 0; i < len(input); i = i + 3 {

		var isContainedInFirstLine = parseLine(input[i])
		var isContainedInSecondLine = parseLine(input[i+1])
		var isContainedInThirdLine = parseLine(input[i+2])

		for j := range isContainedInFirstLine {
			if isContainedInFirstLine[j] && isContainedInSecondLine[j] && isContainedInThirdLine[j] {
				fmt.Printf("Group %d with symbol %c and score: %d\n", (i/3)+1, getAsciiValue(j+1), j+1)
				totalScore += j + 1
			}
		}
	}

	fmt.Printf("\n------------------------------\nTotal score: %d\n", totalScore)
}
