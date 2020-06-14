import tkinter

class ProgramGUI: # define a ProgramGUI class
    def __init__(self):        
        self.main = tkinter.Tk() # create the main window

        self.main.title('My Awesome App')
        self.main.geometry('300x100')
        self.main.resizable(width=False, height=False)
        self.main.iconbitmap('cat.ico')
        
        self.main.configure(bg='SkyBlue2', cursor='circle')

        self.main.attributes('-alpha', 0.75)
        self.main.attributes('-topmost', True)

        # if you uncomment the line below, use Alt+F4 to close the program
        # self.main.attributes('-fullscreen', True)
     
        
        tkinter.mainloop()

gui = ProgramGUI() # create a ProgramGUI object
