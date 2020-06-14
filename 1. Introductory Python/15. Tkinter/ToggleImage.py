import tkinter

class ProgramGUI: # define a ProgramGUI class
    def __init__(self):        
        self.main = tkinter.Tk() # create the main window

        self.main.title('Toggle Image')
        self.main.resizable(width=False, height=False)
        
        self.image = tkinter.PhotoImage(file='image1.png')
        self.imgLabel = tkinter.Label(self.main, image=self.image)
        self.imgLabel.pack()

        self.button = tkinter.Button(self.main, text='Toggle Image', command=self.toggle)
        self.button.pack(fill='x') 
        
        tkinter.mainloop()
        

    def toggle(self): # toggle which image file is shown
        if self.image.cget('file') == 'image1.png':
            self.image.configure(file='image2.png')
        else:
            self.image.configure(file='image1.png')


gui = ProgramGUI() # create a ProgramGUI object
