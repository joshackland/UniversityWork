choice = int(input('1 for cm to inches, \n2 for inches to cm\n: '))

if choice == 1:
    CM_TO_INCH = 2.5387
    cm = float(input('Enter a measurement in inches: '))
    inches = round(cm * CM_TO_INCH, 2)
    print(cm,'cm is',inches,'inches')

elif choice == 2:
    INCH_TO_CM = 0.3939
    inches = float(input('Enter a measurement in inches: '))
    centimetres = round(inches * INCH_TO_CM, 2)
    print(inches,'inches is',centimetres,'centimetres')

else:
    print('invalid choice')
