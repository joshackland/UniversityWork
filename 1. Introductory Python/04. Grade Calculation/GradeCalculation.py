# calculate grade from mark
mark = float(input('Enter your mark: '))
exam_pass = input('Did you pass your exam? (y/n): ').lower()

if exam_pass == 'y':
    if mark >= 80:
        grade = 'HD (High Distinction)'
    
    elif mark >= 70:
        grade = 'D (Distinction)'
    
    elif mark >= 60:
        grade = 'CR (Credit)'
    
    elif mark >= 50:
        grade = 'C (Pass)'
    
    else:
        grade = 'N (Fail)'
else:
    grade = 'N (Fail)'

print('Your grade is:', grade)
