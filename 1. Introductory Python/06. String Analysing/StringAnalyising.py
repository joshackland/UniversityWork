user_input = input('Type something: ')

if user_input.isupper():
    print('Is upper!')

elif user_input.islower():
    print('Is lower!')

if user_input.isalpha():
    print('Is alphabetical!')

elif user_input.isdigit():
    print('Is digits!')

elif user_input.isspace():
    print('Is white space!')

if user_input.startswith('sh'):
    print('Starts with sh!')

if user_input.endswith('p'):
    print('Ends with p!')

if user_input.count('e') >= 2:
    print('Has more than 1 e!')

print('the character length of input is',len(user_input))