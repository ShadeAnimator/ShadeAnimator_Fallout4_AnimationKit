Thanks to JoshNZ for initial setup, which allowed me to dig it further.
Thanks to everyone else from loverslab.com who helped.

RIGHT NOW THIS KIT IS IN ALPHA VERSION.
Not everything is fleshed out yet. For example not all bones are supported for animation.

If you're new to animations for Fallout and TES, I suggest you spending a few minutes and reading this carefully first.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TOOLS AND FILES INCLUDED \ INTRO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This Kit is designed to have everything you need to start making animations for Fallout4, with a few remarks and exceptions.

So, this kit has:
* 3ds max scenes for max 2013-2015, ready for rigging
* 3ds max scenes for max 2013-2015 with RIGs ready for animation (COMING)
* HavokContentTools preset and rig files (WIP)
* HKXPACK with UI to convert hkx to xml and xml to hkx (by DexesTTP)
* niftools plugin for 3ds max

Now, you also NEED TO FIND:
* HavokContentTools 2014 (last I know of, it has plugins for max 2012-2015)
* 3ds max (obviously :D)


NOVICE NOTICE:

Not included, but really needed is some basic knowledge of 3ds max and rigging and animating. If you never rigged and animated anything before, all this might be very overwhelming for you, but for anyone who has at least some rigging and animation experience, and even better - some realization of how 3d animation works in general - all this should be really easy to follow.

If you want to start animating for Fallout4 or any other game, but you have no experience with animation and rigging, I'd suggest you starting with someting else first. But if you absolutely sure that you want to make animations for FO4 (or need to), then I'd sugget you first going through some tutorials.

I may suggest Digital Tutors, tutorials like intro to 3ds max, rigging (preferably not CAT or Biped but tutorials about making custom rigs, they will give you the understanding you need.) and animation.

IMPORTANT!

These tools are here, just to make it easier to start animating. But this Kit may contain OLDER VERSIONS of programs and tools, like hkxpack and niftools, and I STRONGLY RECOMMEND you visiting their development pages and getting updated versions:

 https://github.com/niftools/
 https://github.com/Dexesttp/hkxpack
 
 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
BASIC WORKFLOW
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The basic workflow is this:

1. You either make a copy of one of the supplied scenes, or reference them into a new 3ds max scene. Either way, just preferably don't mess with original files, or have a backup somewhere.

2. You make your animation however you like. Don't change the hierarchy of objects under the Root, and don't touch the CharacterBumper and given mesh objects. You can use constraints, you can constraint those objects to other objects, etc etc, anything that does not break the hierarchy. Only the names and hierachy is important.

3. To export you go to Havok Content Tools menu - Export.

4. Here you should already have the right preset loaded, but just to be sure, go File - Load Configuration File and point it to HCT_Preset.hko file which comes with this Kit

5. Click on Create Skeletons filter in the list to the right. To the right of it you should now see this filter's settings.

6. In the Build Rig, you need to select From File and pick the Fallout4Rig_byShadeAnimator.txt. Sometimes you may have to refresh it, by choosing some other option, then From File again. And selecting a file. It will just load the list of bones and their order from that file. This is also the list of bones which will have animation on them. But it's really easy to break this file, because order and names are important, so you can experiment with it, but carefully.

7. Go to Write to Platform filter.

8. In the filename chose the destination for your new hkx file to save it to.

Click Run Configuration. Or Run Configurations, whatever  button you like most.

Now, if there were no errors, you should have your fresh animation file! Yay!

If there were errors, check these steps again, and if you still can't export your file... Well, you can try finding ShadeAnimator on loverslab.com and asking him for help.


HINT:
Any MESH object in 3ds max scene, is there just for preview purposes. It won't be exported with animation. Max scene files come with a few meshes included, you can Hide and show them however you like. For example there is a CBBE body which might be more pleasant to look at while animating. Also there are a few hair styles. And you can import more meshes. How? Described in another section of this text.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TESTING ANIMATIONS IN THE GAME
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You may have to add this to the Fallout4Custom.ini inside the /MyDocuments/My Games/Fallout4 folder:

	[Archive]
	bInvalidateOlderFiles=1
	sResourceDataDirsFinal=
	
This may be needed for the Engine to use files not from archives.

Then the tested and working way to test it is to export animation as PoseA_JetUse.hkx and put it into this folder (you can create it yourself, or extract Animations archive and replace a file):

	steamapps\common\Fallout 4\Data\Meshes\Actors\Character\Animations\MT\Neutral

Then, in the game, open console with ~, and type:

	player.playidle IdleUseJet

And you should see your animation playing.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
IMPORTING NEW PREVIEW MESHES INTO EXISTING SCENE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This Animation Kit comes with a few basic meshes already. But sometimes you may need or just want to test your animations with some specific ones. Adding new meshes into 3ds max is simple, and you should have everything you need.

So, the tools you'll need are:

* 3ds max (obviously)
* nif plugin
* Archive2 or another extractor of Fallout4 archives.

While one build of nif plugin comes with max (and I strongly recommend to keep an eye on it's updates on github: https://github.com/niftools/ ), and you should already have it.

Archive2 however was not yet mentioned here. You can take it from CreationKit: <CreationKitRoot>\Tools\Archive2

Main mesh files are in this archive: Fallout4 - Meshes.ba2 inside the Data folder of Fallout4 installation.

All standard meshes are here: ..\Fallout 4\Data\Meshes\Actors\Character\CharacterAssets

* GETTING IT INTO MAX

Now, assuming you already have the rig or animation scene open, to get them into max, you just use File-Import. Select the file you want to import. Select the skeleton.nif at the bottom of the nif plugin import window, which should've opened after you selected a file and clicked Import. It may not be required, but just in case.

Now, UNTICK the Import Skeleton checkbox, since we're importing it into a scene 


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
HOW TO MAKE A RIG YOURSELF
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Well, there is really no magic here, and there just a few steps to importing the skeleton and mesh into max from scratch, and setting it up for export.

All you need to do, is import FemaleBody or MaleBody or whatever *.nif file you want using NifTools plugin. From this folder, from Meshes archive:

	Fallout 4\Data\Meshes\Actors\Character\CharacterAssets

You should also point it to the skeleton.nif file. This file you can find inside the Animations archive, same folder.

So just extract both Animation and Meshes archives and you should easily find those files.

And you import it with default settings. Now you can import additional meshes as discussed in another section of this text, if you need.

Now, setting it up for export.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
MANUAL RIG EXPORT SETUP PROCESS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Okay, so, to export animation for FO4 from max you need:

* max 2013-2015 (version is limited by HavokContentTools supported versions only so far)
* niftools plugin
* HavokContentTools 2014
* Rig.txt file (because automatic joint finding does not work properly)
* Preset for HCT which comes with this Kit

So far the most tricky process is getting the correct joints and their ORDER in the Rig.txt file. You can call this file hoever you want, it's just a plain TXT file with a few headers inside [square brackets], you can use my as example. I recommend editing it in Notepad++, since it treats line-changes a bit differently than Windows Notepad. But both should work, thats just paranoia :D 

I am almost 100% certain that the order of joints should be the same as it is inside the skeleton.hkx file. To view it, you can convert it into xml using hkxpack program, which comes with this Kit as well, thanks to DexesTTP. You should be able to get the order of joints from the xml file, as they are defined.

But not all joints should be included. So, trial and error, you can find the right combination, if you're trying to setup Rig.txt for some new skeleton. If you're using humanoid skeleton, I suggest you starting with a copy of the Fallout4Rig_byShadeAnimator.txt and extending it.

so, steps:

1. Setup rig.txt file.

2. Next, you need to go to Havok Content Tools - Export. In the new window go File -  Load Configuration Preset, and load the *.hko file included inside the HCT_Presets folder. 

3. Starting from here, click the Create Skeletons tab. And specify your rig txt file there. You may have to refresh it sometimes, by choosing another option then From File again.

4. Go to Write Platform tab (or list item rather), and select the output file location, where you want new file to be.


Thats all! Just 4 steps.