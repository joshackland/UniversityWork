import json

students = {60254: 'John Smith', 60255: 'Gert Hans-Dyer', 60256: 'Sun Po',60257: 'Bort Woods', 60258: 'Andrew Butters', 60259: 'Betty Ho',60260: 'Jonah Smithers', 60261: 'Sha Po', 60262: 'Jane Smitt'}

usernames = {}

for number, student in students.items():
    name = student.split()
    username = name[0][0].lower()

    for letter in name[1]:
        if len(username) < 5:
            if letter != '-':
                username += letter.lower()
        else:
            break

    username = username.ljust(5, '0')

    dupeNum = 1

    while username in usernames.values():
        if username + str(dupeNum) not in usernames.values():
            username += str(dupeNum)
        
        dupeNum += 1

    
    usernames[number] = username



print(usernames)

file = open('usernames.json', 'w')
json.dump(usernames, file, indent=4)
file.close()