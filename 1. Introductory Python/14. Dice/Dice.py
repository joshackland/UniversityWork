import random # we'll need the random module to roll the dice

class DicePile:

    def __init__(self, initQuantity, initSides,  rollOnCreate = False): # constructor
        self.setQuantity(initQuantity)
        self.setSides(initSides)   
        self.__rollCount = 0    
        self.rolled = False

        if rollOnCreate:
            self.roll()

    def __str__(self): # generate a string representation of the object
        if self.rolled:
            resultString = str(self.__results) 
        else:
            resultString = 'not rolled' 
      
        return self.dicescription() + ': ' + resultString + ' (roll count: ' + str(self.__rollCount) + ')'


    def roll(self): # roll the dice
        self.__results = [] # set results to empty list

        for i in range(self.__quantity): # generate random numbers and add to results list
            self.__results.append(random.randint(1, self.__sides)) 
        
        self.__rollCount += 1
        self.rolled = True

    def dicescription(self):
        return str(self.__quantity) + 'd' + str(self.__sides)

    def maxTotal(self):
        return self.__sides * self.__rollCount

    def getAverage(self):
        if self.rolled:
            return sum(self.__results) / self.__quantity
        else:
            return None

    def sortResults(self):
        if self.rolled:
            self.__results.sort()

    def getResults(self): # get results list (None if not rolled)
        return self.__results

    def getQuantity(self): # get quantity attribute
        return self.__quantity

    def getSides(self): # get sides attribute
        return self.__sides

    def getRollCount(self):
        return self.__rollCount

    def setQuantity(self, newQuantity): # set quantity attribute
        if int(newQuantity) < 1:
            raise ValueError('dice quantity cannot be less than 1')
        else:
            self.__quantity = int(newQuantity)
            self.__results = None

    def setSides(self, newSides): # set sides attribute
        if int(newSides) < 2:
            raise ValueError('dice sides cannot be less than 2')
        else:
            self.__sides = int(newSides)
            self.__results = None

myDice = DicePile(4, 6, True)
print(myDice)
myDice.sortResults()
print(myDice.getResults())