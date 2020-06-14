laptimesList = []
lap = 1
while True:
    lapTime = input('Enter lap time ' + str(lap) + ' (“x” to end): ')
    if lapTime.lower() == 'x':
        break

    laptimesList.append(float(lapTime))
    lap = lap + 1
print('Slowest Lap Time:', max(laptimesList))
print('Fastest Lap Time:', min(laptimesList))
print('Average Lap Time:', sum(laptimesList) / len(laptimesList))