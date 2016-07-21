import sys
import os
from PySide import QtGui, QtCore
import subprocess
from bs4 import BeautifulSoup


rp = os.path.dirname(os.path.realpath(__file__))
hkxCliJar = os.path.join(rp, 'hkxpack-cli.jar')

if os.path.exists(hkxCliJar) != True:
    print "ERROR! Could not find hkxpack-cli.jar file. You need to drop this gui file in the same folder as hkxpack-cli.jar file! Otherwise it won't work."

css = '''
'''

class TestListView(QtGui.QListWidget):

    fileDropped = QtCore.Signal(list)

    def __init__(self, type, parent=None):
        super(TestListView, self).__init__(parent)
        self.setAcceptDrops(True)
        self.setIconSize(QtCore.QSize(72, 72))

    def dragEnterEvent(self, event):
        if event.mimeData().hasUrls:
            event.accept()
        else:
            event.ignore()

    def dragMoveEvent(self, event):
        if event.mimeData().hasUrls:
            event.setDropAction(QtCore.Qt.CopyAction)
            event.accept()
        else:
            event.ignore()

    def dropEvent(self, event):
        if event.mimeData().hasUrls:
            event.setDropAction(QtCore.Qt.CopyAction)
            event.accept()
            links = []
            for url in event.mimeData().urls():
                links.append(str(url.toLocalFile()))
            self.fileDropped.emit(links)
        else:
            event.ignore()

class MainForm(QtGui.QMainWindow):
    def __init__(self, parent=None):
        super(MainForm, self).__init__(parent)

        self.mainWidget = QtGui.QWidget()
        self.mainLayout = QtGui.QVBoxLayout()
        self.mainWidget.setLayout(self.mainLayout)

        self.view = TestListView(self)
        self.view.fileDropped.connect(self.fileDropped)

        self.byLbl = QtGui.QLabel("GUI made by ShadeAnimator.")

        self.viewlabel = QtGui.QLabel("Drag and drop files here:")

        #region Pack Unpack Groupbox
        self.groupBox = QtGui.QGroupBox("Action")

        self.unpackRB = QtGui.QRadioButton("&Unpack")
        self.packRB = QtGui.QRadioButton("&Pack")

        self.unpackRB.setChecked(True)


        vbox = QtGui.QVBoxLayout()
        vbox.addWidget(self.unpackRB)
        vbox.addWidget(self.packRB)
        vbox.addStretch(1)
        self.groupBox.setLayout(vbox)
        #endregion
        self.pb = QtGui.QProgressBar()

        self.button = QtGui.QPushButton("Process")
        self.button.clicked.connect(self.convertXmlHkx)

        self.getTxtButton = QtGui.QPushButton("Generate Rig TXT from skeleton.hkx\\xml")
        self.getTxtButton.clicked.connect(self.generateRigTxt)

        self.remove = QtGui.QPushButton("Remove selected")
        self.remove.clicked.connect(self.removeSelected)

        self.clear = QtGui.QPushButton("Clear view")
        self.clear.clicked.connect(self.clearView)

        self.mainLayout.addWidget(self.viewlabel)
        self.mainLayout.addWidget(self.view)
        #self.mainLayout.addWidget(self.groupBox)
        self.mainLayout.addWidget(self.button)
        self.mainLayout.addWidget(self.getTxtButton)
        self.mainLayout.addWidget(self.remove)
        self.mainLayout.addWidget(self.clear)
        self.mainLayout.addWidget(self.pb)

        self.setCentralWidget(self.mainWidget)

        self.setWindowTitle("hkxpack GUI")


        self.setStyleSheet(css)

    def fileDropped(self, l):
        for url in l:
            if os.path.exists(url):
                item = QtGui.QListWidgetItem(url, self.view)
                item.setStatusTip(url)

    def convertXmlHkx (self, action = 'pack'):
        self.pb.setMaximum(self.view.count())
        self.pb.setValue(0)
        for i in range (self.view.count()):
            file = self.view.item(i).text()
            fileExtension = file.split('.')[-1]

            if fileExtension == "hkx" or fileExtension == "HKX":
                print ">>> Converting", file, "to xml"
                subprocess.call(['java', '-jar', hkxCliJar, 'unpack', file])

            elif fileExtension == "xml" or fileExtension == "XML":
                print "<<< Converting", file, "to hkx"
                subprocess.call(['java', '-jar', hkxCliJar, 'pack', file])

            else:
                print "File", file, "is not hkx or xml. Skipped."

            self.pb.setValue(i+1)

    def generateRigTxt(self):
        self.pb.setMaximum(self.view.count())
        self.pb.setValue(0)
        for i in range (self.view.count()):
            file = self.view.item(i).text()
            fileExtension = file.split('.')[-1]

            #if the file is hkx, we need to convert it to xml first.
            if fileExtension == "hkx" or fileExtension == "HKX":
                print ">>> Converting", file, "to xml"
                subprocess.call(['java', '-jar', hkxCliJar, 'unpack', file])
                file = file.replace('.hkx', '.xml').replace('.HKX', '.XML')

            #read xml and extract data
            print "Reading file..."
            with open(file, 'r') as fileData:
                soup = BeautifulSoup(fileData.read(), 'xml')

            skeleton = soup.find('hkparam', {"name":"bones"})
            bones = []
            for child in skeleton.contents:
                childSoup = BeautifulSoup(str(child), 'xml')
                boneNameParam = childSoup.find('hkparam', {"name":"name"})
                if boneNameParam != None:
                    bone = str(boneNameParam).split('"name">')[1].split('</hkparam>')[0]
                    bones.append(bone)

            #generate txt
            output = '[HAVOK SKELETON DEFINITION FILE]\n\n[BONES START]'
            for bone in bones:
                output += "\n"+str(bone)

            output += "\n[END]"

            with open(file.replace('.xml', '.txt').replace('.XML', '.TXT'), 'w') as newFile:
                newFile.write(output)

            self.pb.setValue(i+1)

    def clearView(self):
        self.view.clear()

    def removeSelected(self):
        for item in self.view.selectedItems():
            self.view.takeItem(self.view.row(item))

def main():
    app = QtGui.QApplication(sys.argv)
    form = MainForm()
    form.show()
    app.exec_()

if __name__ == '__main__':
    main()