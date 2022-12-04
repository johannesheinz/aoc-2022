#!/usr/bin/env python3

'''
Make sure that there's at least one newline at the end of the input file
'''

calories = []
current_calories = 0

input_lines = open("input.txt", "r")

for line in input_lines:
    if line.strip():
        current_calories += int(line)
    else:
        calories.append(current_calories)
        current_calories = 0

calories.sort()

print(len(calories))
print(calories[-3:])
print('-' * 20)
print(sum(calories[-3:]))
print('-' * 20)