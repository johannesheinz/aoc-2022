#!/usr/bin/env python3

'''
Make sure that there's at least one newline at the end of the input file
'''

max_calories = 0
current_calories = 0

input_lines = open("input.txt", "r")

for line in input_lines:
    if line.strip():
        current_calories += int(line)
    else:
        if current_calories > max_calories:
            max_calories = current_calories
        # print(current_calories)
        current_calories = 0

print('-' * 20)
print(max_calories)
print('-' * 20)
