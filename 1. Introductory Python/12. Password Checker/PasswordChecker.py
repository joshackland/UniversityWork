def checkPassword(pword):
    specialChars = '\'~!#$%^*()_+-={}|[]\\:<>?,./'

    if (len(pword) >= 8 and len(pword) <= 16):
        if any(l.islower() for l in pword):
            if any(l.isupper() for l in pword):
                if any(l.isdigit() for l in pword):
                    if any(l in specialChars for l in pword):
                        return True
    return False

password = input('Enter your password: ')

if checkPassword(password):
    print('Your password is valid.')
else:
    print('Your password is not valid.')