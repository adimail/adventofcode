floor = 0
counter = 1

content = open("input.txt", "r").read()

for char in content:
    if char == "(":
        floor += 1
    elif char == ")":
        floor -= 1

    if floor == -1:
        print(counter)

    counter += 1

print(floor)
