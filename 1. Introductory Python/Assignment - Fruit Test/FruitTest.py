# Name:  Josh Ackland
# Student Number:  10444729

# This file is provided to you as a starting point for the "fruit_test.py" program of Assignment 2
# of Programming Principles in Semester 1, 2019.  It aims to give you just enough code to help ensure
# that your program is well structured.  Please use this file as the basis for your assignment work.
# You are not required to reference it.


# Import the required modules.
import tkinter
import tkinter.messagebox
import json
import random


class ProgramGUI:

    def __init__(self):
        self.main = tkinter.Tk()
        self.main.title('Fruit Test')

        try:
            file = open('data.txt','r')
            self.data = json.load(file)
            file.close()
        except (FileNotFoundError, json.decoder.JSONDecodeError):            
            self.main.destroy()
            tkinter.messagebox.showerror('Missing/Invalid File', 'Missing/Invalid File!')
            return
        
        if len(self.data) < 2:
            self.main.destroy()
            tkinter.messagebox.showerror('Not Enough Fruit', 'Not enough fruit!')
            return

        self.components = ['calories','fibre','sugar','vitamin_c']

        self.lblQuestion = tkinter.Label(self.main)
        self.lblQuestion.pack()

        self.buttonFrame = tkinter.Frame(self.main)
        tkinter.Button(self.buttonFrame, text='True', command=lambda: self.checkAnswer(True)).pack(side='left', padx=(10,0))
        tkinter.Button(self.buttonFrame, text='False', command=lambda: self.checkAnswer(False)).pack(side='left', padx=(10,0))
        self.buttonFrame.pack(pady=(10,6))

        self.showQuestion()

        tkinter.mainloop()
        
    
    def showQuestion(self):
        self.fruit = random.sample(self.data, 2)
        self.fruit_component = random.choice(self.components)

        self.lblQuestion['text'] = '100 grams of {} contains more {} than 100 grams of {}.'.format(self.fruit[0]['name'], self.fruit_component.replace('_',' ').title(), self.fruit[1]['name'])
        

    def checkAnswer(self, answer):
        if (self.fruit[0][self.fruit_component] > self.fruit[1][self.fruit_component]) == answer:
            tkinter.messagebox.showinfo('Correct!', 'You got it right.')
        else:
            tkinter.messagebox.showerror('Incorrect!', 'You got it wrong.')
        self.showQuestion()


gui = ProgramGUI()
