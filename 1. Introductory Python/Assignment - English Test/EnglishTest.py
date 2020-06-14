# Import the random module to allow us to select words and questions at random.
import random
import math

# Counts how many letters there are in a word
def count_letters(word):
    return len(word)

# Counts all the vowels in a word
def count_vowels(word):
    vowels = 0
    for letter in word:
        if letter in 'aeiouAEIOU':
            vowels += 1
    return(vowels)

# Counts how many consanents there are in a word
def count_consanents(word):
    consanents = 0
    for letter in word:
        if letter not in 'aeiouAEIOU':
            consanents += 1
    return(consanents)

# Returns the letter in the nth position
def letter_position_of_word(word, position):
    return word[position-1]

# displays whether user guess was correct
def is_user_guess_correct(userGuess, correctAnswer):
    if(userGuess == correctAnswer):
        print('Correct!\n')        
        return True
    else:
        print('Incorrect! Correct answer was ' + str(correctAnswer) + '\n')
        return False

# Create a list of words to choose from for the test.
candidateWords = ['HELLO', 'GOODBYE', 'NAME', 'DAY', 'NIGHT', 'HOUR', 'POTATO', 'BIG', 'SMALL', 'GOOD', 'BAD', 'YES', 'NO', 'HOUSE', 'QUESTION', 'BALLOON', 'CAT', 'DUCK', 'PIGEON', 'POSTER', 'TELEVISION', 'SPY', 'RIPPLE', 'SUBSTANTIAL', 'SNOW', 'MAGNET', 'TOWEL', 'WALKING', 'SPEAKER', 'UNCHARACTERISTICALLY']

# https://stackoverflow.com/questions/9647202/ordinal-numbers-replacement#20007730
ordinal = lambda n: "%d%s" % (n,"tsnrhtdd"[(math.floor(n/10)%10!=1)*(n%10<4)*n%10::4])

while True:
    score = 0
    print('Welcome to English Tester Pro!\n')

    #user chooses how many words the test will contain
    while True:
        wordAmount = int(input('How many words would you like this test to contain? '))

        if wordAmount > 0 and wordAmount < len(candidateWords):
             break

    wordList = random.sample(candidateWords, wordAmount)

    for index, word in enumerate(wordList):
        print('Word ' + str(index+1) + '/' + str(len(wordList)) + ': ' + word)

        randomQuestion = random.randint(1,4)

        if(randomQuestion == 1):
            print('How many letters does the word ' + word + ' contain?')
            userGuess = int(input())

            correctAnswer = count_letters(word)
            userGuess = is_user_guess_correct(userGuess, correctAnswer)

        elif(randomQuestion == 2):
            print('How many vowels does the word ' + word + ' contain?')
            userGuess = int(input())

            correctAnswer = count_vowels(word)
            userGuess = is_user_guess_correct(userGuess, correctAnswer)

        elif(randomQuestion == 3):
            print('How many consonants does the word ' + word + ' contain?')
            userGuess = int(input())

            correctAnswer = count_consanents(word)
            userGuess = is_user_guess_correct(userGuess, correctAnswer)

        elif(randomQuestion == 4):
            randomLetter = random.randrange(1,len(word)+1)
            print('What is the ' + ordinal(randomLetter) +' letter of the word ' + word)
            userGuess = input().upper()

            correctAnswer = letter_position_of_word(word, randomLetter)
            userGuess = is_user_guess_correct(userGuess, correctAnswer)

        if userGuess == True:
            score += 1

    print('Game Over. Your score is ' + str(score) + '/' + str(len(wordList)))

    while True:
        playAgain = input('Do you want to play again? (Y/N) ')

        if playAgain in 'yYnN':
            break
    
    if playAgain in 'nN':
        break