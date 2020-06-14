# --- getList(filename), returns a list of strings ---
# (open/create file and return lines of text as a list of strings)
def getList(filename):
    f = open(filename, 'r') # this line is a placeholder
    data = f.readlines()
    f.close()
    return data

# --- showList(data), returns nothing ---
# (receive list of strings and display them, or "nothing in list" message)
def showList(data):
    for i, item in enumerate(data, start=1):
        print(str(i) + ') ' + item.rstrip())
    return

# --- addToList(filename, data), returns a list of strings ---
# (prompt for an item to add to the list of strings and append to the file)
def addToList(filename, data):
    item = input('Add: ')
    data.append(item)
    f = open(filename, 'a')
    f.write(item + '\n')
    f.close()
    print('Item added to list')

    data = getList(filename)

    return data

# --- deleteFromList(filename, data), returns a list of strings ---
# (prompt for item number to delete from the list of strings and write list to the file)
def deleteFromList(filename, data):
    item = int(input('Item number to delete: '))
    data.remove(data[item-1])
    f = open(filename, 'w')
    f.writelines("%s" % item for item in data)
    f.close()

    return data

# --- main part of program ---
FILENAME = 'txtlist.txt' # define the filename used to store the list
lineList = getList(FILENAME) # call the getList function to read the file into a list

while True: # this endless loop displays the list and prompts the user for a command

    showList(lineList) # call showList to show the current content of the list

    # show the instructions for the possible commands - [a]dd, [d]elete, e[x]it
    print('\nType "a" to add an item.')

    if len(lineList) > 0: # only show the delete instruction if the list has items
        print('Type "d" to delete an item.')

    print('Type "x" to exit.')

    command = input('> ') # prompt for a command

    # if "a", calladdToList to prompt for item and add to list
    if command == 'a': 
        lineList = addToList(FILENAME, lineList)

    # if "d", call deleteFromList to prompt for item number and delete from list        
    elif command == 'd' and len(lineList) > 0:
        lineList = deleteFromList(FILENAME, lineList)

    elif command == 'x': # if "x", break out of the loop to end the program
        print('Goodbye!')
        break

    else: # if anything else, show an error message
        print('Invalid command.\n')