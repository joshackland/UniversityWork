def print_heading(headingText, width):
    print('=' * width)
    print( '|' + headingText.center(width-2) + '|')
    print('=' * width)

print_heading('This is a test heading', 25)