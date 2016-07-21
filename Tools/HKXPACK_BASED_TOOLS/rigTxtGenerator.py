import sys
import os
from PySide import QtGui, QtCore
import subprocess

rp = os.path.dirname(os.path.realpath(__file__))
hkxCliJar = os.path.join(rp, 'hkxpack-cli.jar')

if os.path.exists(hkxCliJar) != True:
    print "ERROR! Could not find hkxpack-cli.jar file. You need to drop this gui file in the same folder as hkxpack-cli.jar file! Otherwise it won't work."