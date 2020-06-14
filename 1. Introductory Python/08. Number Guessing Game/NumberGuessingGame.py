import random

number = random.randint(1,100)
counter = 0

print('Welcome!')

while True:
    guess = int(input('Guess a number: '))
    counter += 1
    if guess == number:
        print(number,'is the correct number!')
        print('you guessed it in',counter,'try!')
        break
    elif guess > number:
        print('guess is too high!')
    elif guess < number:
        print('guess is too low!')

