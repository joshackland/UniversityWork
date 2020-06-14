def inputInt(prompt, errormessage = 'invalid input'):
    while True:
        intVal = input(prompt)

        try:
            numResponse = int(intVal)            
            return numResponse
        except:
            print(errormessage)

def inputFloat(prompt, errormessage = 'invalid input'):
    while True:
        intVal = input(prompt)

        try:
            numResponse = float(intVal)            
            return numResponse
        except:
            print(errormessage)

value = inputInt('Enter your age: ', 'Enter age as an integer.')
print('Value is',value)