from subprocess import call
import os

rp = os.path.dirname(os.path.realpath(__file__))
call(["pyinstaller", os.path.join(rp, "hkxpack_based_tools_ui.py"), "--onefile", "--distpath", rp])