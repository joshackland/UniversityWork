#inches to centimetres
INCH_TO_CM = 0.3939
inches = float(input('Enter a measurement in inches: '))
centimetres = round(inches * INCH_TO_CM, 2)
print(inches,'inches is',centimetres,'centimetres')

#feet to metres
FEET_TO_METRES = 3.281
feet = float(input('Enter a measurement in feet: '))
metres = round(feet * FEET_TO_METRES, 2)
print(feet,'feet is',metres,'metres')

