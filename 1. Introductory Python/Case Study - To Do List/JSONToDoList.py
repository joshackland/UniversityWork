# This file is provided as a starting point for the Mini Project in Module 7 of Programming Principles.
# See the PDF document provided with this file for details of what the project entails.

import json # Import the "json" module to read and write JSON-formatted text.
FILENAME = 'jsonlist.txt' # Define the filename used to store the list.


# This function opens/creates the text in write mode and writes the data to it in JSON format.
def saveData(dataList):
    file = open(FILENAME, 'w')
    json.dump(dataList, file,)
    file.close()


# Here is where you should try to load existing data from the text file.  To do this...
try:
    file = open(FILENAME, 'r')
    data = json.load(file)
    file.close()
except (FileNotFoundError, ValueError):
    data = []

while True: # This endless loop displays the list and prompts the user for a command.

    if len(data) < 0:
        print('no items')
    else:
        print('To Do List: ')
        for i, item in enumerate(data, start=1):
            print(str(i) + ') ' + item.rstrip())

    # Display instructions for the possible commands.
    print('\nType "a" to add an item.')
    print('Type "d" to delete an item.')
    print('Type "x" to exit.')

    command = input('> ') # Prompt the user to enter a command.

    # If the command is "a" (add)...
    if command == 'a':
        item = input('Enter an item to the list: ')
        data.append(item)
        saveData(data)

    # If the command is "d" (delete)...
    elif command == 'd':
        try:
            index = int(input('Enter the number of an item to delete: '))
            index -= 1
            del data[index]
            saveData(data)
        except (ValueError, IndexError):
            print('invalid item number')

    # If the command is "x" (exit)...
    elif command == 'x':
        # Print a "goodbye" message and break out of the loop to end the program.
        print('Goodbye!')
        break

    # If the command is anything else...
    else:
        print('Invalid Command!')

