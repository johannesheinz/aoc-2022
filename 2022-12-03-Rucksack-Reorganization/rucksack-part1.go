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

func main() {
	input := readInput(os.Args)

	totalScore := 0

	for _, line := range input {

		// fmt.Printf("totalScore before: %d\n", totalScore)

		// check data integrety
		if len(line)%2 != 0 {
			error := fmt.Sprintf("line size is not even: %d for %s", len(line), line)
			panic(error)
		}

		compartmentOne := line[:len(line)/2]
		compartmentTwo := line[len(line)/2:]

		var isContainedInFirstCompartment [52]bool

		for _, char := range compartmentOne {
			index := getAsciiScore(char)
			isContainedInFirstCompartment[index-1] = true
		}

		for _, char := range compartmentTwo {
			index := getAsciiScore(char)
			if isContainedInFirstCompartment[index-1] {
				totalScore += index
				// use only once
				isContainedInFirstCompartment[index-1] = false
			}
		}

		// fmt.Printf("totalScore after: %d\n\n", totalScore)
	}

	fmt.Printf("Total score: %d\n", totalScore)

}
