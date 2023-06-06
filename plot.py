from pyqtgraph.Qt import QtGui, QtCore
import pyqtgraph as pg
from pyqtgraph.Qt import QtWidgets
from pyqtgraph.dockarea.Dock import Dock
from pyqtgraph.dockarea.DockArea import DockArea

app = pg.mkQApp("Payload data")
win = QtWidgets.QMainWindow()
win.setWindowTitle("Payload Plot")
win.resize(1000, 600)

area = DockArea()
win.setCentralWidget(area)

inputfile = open("log_0011.txt", "r") #Edit this line to select the file; file needs to be on the same directory
lines = inputfile.readlines()

CHANNEL_COUNT = 12 

#x = np.array([])
#y = np.array([])

x = []
y = []

for i in range(CHANNEL_COUNT):
    x.append([])
    y.append([])

for line in lines:
    if line[0] != '7' or line[-1] == '-' or len(line) <= 15:
        continue #Filler garbage message, skip 
    
    timestamp_str = ("0x"+line[3:9])
    timestamp = (int(timestamp_str, 16))
    
    channel_str = ("0x"+line[9:11])
    channel = (int(channel_str, 16))
   
    data_str = ("0x"+line[11:15])
    data = (int(data_str, 16))

    x[channel-1].append(timestamp) #assumes that the channel id is valid, will fail otherwise
    y[channel-1].append(data) #same as above

inputfile.close()

for i in range (len(x)):
    #bargraph = pg.BarGraphItem(x = x[i], height = y[i], width = 0.1, brush ='g')
    #plot = pg.plot()
    #plot.addItem(bargraph)

    #If you need a line graph instead, uncomment the above and comment out this snippet
    plot = pg.plot(x = x[i], y = y[i])

    dock = Dock("Dock: Channel " + str(i+1), size = (200,200), closable=True)
    dock.addWidget(plot)
    area.addDock(dock, "right")

win.show()

if __name__ == '__main__':
    pg.exec()
