import random

number = None
counter = 1

while number != 0:
    number = random.randint(0,10)
    print('Number',counter,'was',number)

    if number == 7:
        print('Lucky 7!')
    counter += 1