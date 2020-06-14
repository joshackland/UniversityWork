import math

#Fahrenheit to Celcius
fahrenheit = float(input('Enter a temperature in fahrenheit: '))
celcius = round((fahrenheit - 32)*5/9, 2)
print(fahrenheit,'fahrenheit is',celcius,'celcius')

#Area of circle
radius = float(input('Enter a radius: '))
area_of_circle = round(math.pi * radius**2, 2)
print('a circle with a radius of',radius,'has an area of',area_of_circle)

#BMI
weight = float(input('Enter a wight in kilograms: '))
height = float(input('Enter a height in metres: '))
bmi = round(weight / height ** 2, 2)
print('with a weight of',weight,'kg and a height of',height,
      'm, you have a BMI of',bmi)

#Interest
amount = float(input('Enter a currency ammount: '))
annual_interest = float(input('Enter the annual interest rate: '))
time = float(input('Enter a time in years: '))

interest = round(amount * (annual_interest / 100) * time, 2)
print('with an amount of',amount,' an annual interest rate of',annual_interest,
      ' and a duration of',time,'in years. the interest rate is',interest)
