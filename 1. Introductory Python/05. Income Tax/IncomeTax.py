# calculate tax on income
income = float(input('Enter your taxable income: '))

if income <= 18200:
    tax_on_income = 'None'

elif income <= 37000:
    tax_on_income = (income - 18200) * 0.19

elif income <= 90000:
    tax_on_income = 3572 + (income - 37000) * 0.325
    
elif income <= 180000:
    tax_on_income = 20797 + (income - 90000) * 0.37

else:
    tax_on_income = 54097 + (income - 180000) * 0.45

print('Your tax on income is:', tax_on_income)
