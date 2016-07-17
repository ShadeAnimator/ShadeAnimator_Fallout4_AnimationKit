Thanks to JoshNZ for initial setup, which allowed me to dig it further.
Thanks to everyone else from loverslab.com who helped.



### Testing Animations in the game ###

You may have to add this to the Fallout4Custom.ini inside the /MyDocuments/My Games/Fallout4 folder:

[Archive]
bInvalidateOlderFiles=1
sResourceDataDirsFinal=

Then the tested and working way to test it is to export animation as PoseA_JetUse.hkx and  put it into this folder:

steamapps\common\Fallout 4\Data\Meshes\Actors\Character\Animations\MT\Neutral

Then, in the game, open console with ~, and type:

player.playidle IdleUseJet