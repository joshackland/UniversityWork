# Name:  Josh Ackland
# Student Number:  10444729

# Import the json module to allow us to read and write data in JSON format.
import json

# This function repeatedly prompts for input until an integer is entered.
def inputInt(prompt):
    while True:        
        try:
            user_input = int(input(prompt))
        except:
            continue            
        return user_input

# This function repeatedly prompts for input until a float is entered.
def inputFloat(prompt):
    while True:        
        try:
            user_input = float(input(prompt))
        except:
            continue            
        return user_input

# This function repeatedly prompts for input until something other than whitespace is entered.
def inputSomething(prompt):
    while True:        
        user_input = input(prompt).strip()

        if len(user_input) > 0:
            return user_input

# This function opens "data.txt" in write mode and writes the data to it in JSON format.
def saveData(dataList):
    file = open('data.txt', 'w')
    json.dump(dataList, file)
    file.close()


try:
    file = open('data.txt','r')
    data = json.load(file)
    file.close()
except (FileNotFoundError, json.decoder.JSONDecodeError):
    data = []


print('Welcome to the Fruit Test Admin Program.')

while True:
    print('\nChoose [a]dd, [l]ist, [s]earch, [v]iew, [d]elete or [q]uit.')
    choice = input('> ')
        
    if choice == 'a':
        fruit = {}
        fruit['name'] = inputSomething('Enter name of fruit: ')
        print('In 100 grams of',fruit['name'],', how many...')
        fruit['calories'] = inputFloat('Calories are there?: ')
        fruit['fibre'] = inputFloat('Grams of fibre are there?: ')
        fruit['sugar'] = inputFloat('Grams of sugar are there?: ')
        fruit['vitamin_c'] = inputFloat('Milligrams of Vitamin C are there?: ')

        data.append(fruit)
        saveData(data)
    
    elif choice == 'l':
        for index, fruit in enumerate(data, start=1):
            print(str(index) + ')',fruit['name'])

    elif choice == 's':
        search = inputSomething('Enter search term: ')

        for index, fruit in enumerate(data):
            if search in fruit['name']:
                print(str(index) + ')',fruit['name'])

    elif choice == 'v':
        index = inputInt('Fruit number to view: ')
        fruit = data[index-1]

        print('Nutritional information for 100 grams of',fruit['name'],':')
        print('\tCalories:',fruit['calories'])
        print('\tFibre:',fruit['fibre'],'grams')
        print('\tSugar:',fruit['sugar'],'grams')
        print('\tVitamin C:',fruit['vitamin_c'],'milligrams')

    elif choice == 'd':
        index = inputInt('Fruit number to delete: ')

        if index > len(data):
            print('Invalid index number')
        else:
            del data[index-1]
            saveData(data)
            print('Fruit deleted')
 
    elif choice == 'q':
        print("Goodbye!")
        break

    else:
        print('invalid choice')