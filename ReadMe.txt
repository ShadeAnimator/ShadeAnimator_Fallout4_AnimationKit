Making animations for Fallout 4.
This thread is for animators and modders.

It is here to discuss animation tools, plugins and everything required to create animations for Fallout 4 mods, to convert them, to rig, skin character models, etc.


Unlike Skyrim, information about making animation for Fallout 4 is still under heavy research, however we've already made some progress. 


General Software information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[spoiler]
3ds max
It's the primary and most advanced package to work with Fallout4 animations so far. It has all the tools needed, all the plugins, and in some cases these plugins are more feature-full than in other software.

Main reason why it's currently the best solution for animations is that is has HavokContentTools and niftools plugins are compiled and available for it from the official niftools github repo.

+ HCT
+ Niftools Plugin


Maya
Maya may be the second tool in this list, because it also has HCT and niftools plugin, and can use same HCT presets. But it is much harder to find the right compiled niftools plugin. I did not find it yet, for Maya 2013-2015. If someone can compile it for Maya 2015, it would be perfect!

But since in fact niftools plugin is only required to import and export MESHES it should be possible to export meshes and joints as FBX into maya, and then work in it from there.

Blender
Bad news for blender users, it does not have HCT plugin available. Without it, currently it is not possible to export *.hkx animation files, until some third-party tool arrives.

However it should be possible to create a blender scene for animation and use it to animate, then export FBX animation, bring it into 3ds max, and export from there.


Universal
The real breakthrough can at some point come from DexesTTP with his hkx tools, he is basically working on a standalone COLLADA => HKX converter. COLLADA format is available for both max and maya, and, i'm not sure, but I think blender too. It will make the process of exporting animations as simple as exporting an animation file into collada format with built-in tools, and converting it with a converter.

Once the converter is ready it will be even possible to automate the process to just 1 button click, a script can then export an animation, and launch external converter to convert it into hkx, so it will look like it just exported into hkx :D
[/spoiler]


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3DS MAX
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



TOOLS AND FILES
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[spoiler]
I try to collect all the tools required to create animations here: 
https://github.com/ShadeAnimator/ShadeAnimator_Fallout4_AnimationKit

This Kit is designed to have everything you need to start making animations for Fallout4, with a few remarks and exceptions.

So, this kit has:
* 3ds max scenes for max 2013-2015, ready for rigging
* 3ds max scenes for max 2013-2015 with RIGs ready for animation (COMING)
* HavokContentTools preset and rig files (WIP)
* HKXPACK with UI to convert hkx to xml and xml to hkx (by DexesTTP)
* niftools plugin for 3ds max

Now, you also NEED TO FIND:
* HavokContentTools 2014 (last I know of, it has plugins for max 2012-2015. I can help you find these tools.)
* 3ds max (obviously :D)


IMPORTANT!

These tools are included in the Kit, just to make it easier to start animating. But this Kit may contain OLDER VERSIONS of programs and tools, like hkxpack and niftools, and I STRONGLY RECOMMEND you visiting their development pages and getting updated versions:

 https://github.com/niftools/
 https://github.com/Dexesttp/hkxpack

[/spoiler]

NOVICE NOTICE:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[spoiler]
Not included, but really needed is some basic knowledge of 3ds max and rigging and animating. If you never rigged and animated anything before, all this might be very overwhelming for you, but for anyone who has at least some rigging and animation experience, and even better - some realization of how 3d animation works in general - all this should be really easy to follow.

If you want to start animating for Fallout4 or any other game, but you have no experience with animation and rigging, I'd suggest you starting with someting else first. But if you absolutely sure that you want to make animations for FO4 (or need to), then I'd sugget you first going through some tutorials.

I may suggest Digital Tutors, tutorials like intro to 3ds max, rigging (preferably not CAT or Biped but tutorials about making custom rigs, they will give you the understanding you need.) and animation.
[/spoiler]

GLOSSARY
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[spoiler]
Just so we are on the same page. Here are some terms:

Rig - this can be a misquiding word, because it usually means not just one thing, but it includes a few things. Which are:
Skeleton - Skeleton is a collection of joints, in gamedev they usually have to have the same root and exist within the same hierarchy. The joints\bones are used to drive character mesh, which is skinned to them, some of the joints\bones, usually referred to as locators, can be used as 'sockets' to snap other meshes to in realtime, like weapon joints.

Basically joint is just a transform in space, and there is usually no real separation of joints or locators or nulls in game engines, only in 3d software, where they may have different properties and behaviour, only until you export them.

Skinning - Skinning is a process of bining character mesh's verticies to specific joints.

Control Rig - A collection of additional objects and constraints which are required to make it possible for an animator to animate the character comfortably. While you can just animate joints, this is not really the right way to work with animations. Rigs can be simple or complex, they can be considered programs even, because they follow same conventions usually.

So basically character control rig is the strings an animator uses to control the puppet, while the puppet it skeleton and skinned mesh. It is good idea to keep control rig and skeleton separately.

In 3ds max there are 3 ways to create Control Rig:
1. Creating Custom Control Rig, using bones, constraints, and objects and other tools available in max.
2. Using CAT - CharacterAnimationToolkit, built-in plugin in max, which allows you to easily create a rig for any character, and includes some animation tools, like mirroring, pose saving, etc.
3. Using Biped - less feature-full and older built-in plugin for max, which allows you to quickly rig a humanoid character.

Rig File - this is something specific to Fallout4 and Skyrim, rig file is a txt file required by Havok Content Tools to define the joints and their order upon export.
[/spoiler]

BASIC WORKFLOW
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[spoiler]
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
[/spoiler]

TESTING ANIMATIONS IN THE GAME
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[spoiler]
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
[/spoiler]


ANNOTATIONS (UNTESTED YET)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[spoiler]
Anotations allow you to trigger different events at specific animation frames, through animation. This is usually used for sounds (footsteps for example), showing\hiding stuff (showing and hiding Phycho jet model in char's arm for example), and some other things.

To add annoations to your animation:

If you are using your own scene:

1. Select Root joint.
2. Open DopeSheet.
3. Select Root joint there.
4. Go to - Edit - Note Track - Add (note that in earlier max versions location of this button was different)

If you're using scenes shipped with SAAnimationKit, this track should already exist there.

To add annotation:

1. Keys - Add Keys tool
2. Click wherever you want to place a key
3. Exit this tool
4. Right click and write your annotation

Now they should export. If not, try ticking Annotations in Prune Type filter.

List of annotations is currently unknown to me.

Process is similar to the one shown in this video: https://vimeo.com/113225958
From here: http://www.loverslab.com/topic/39996-3ds-max-skyrim-video-animation-tutorial/
[/spoiler]

IMPORTING NEW PREVIEW MESHES INTO EXISTING SCENE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[spoiler]
This Animation Kit comes with a few basic meshes already. But sometimes you may need or just want to test your animations with some specific ones. Adding new meshes into 3ds max is simple, and you should have everything you need.

So, the tools you'll need are:

* 3ds max (obviously)
* nif plugin
* Archive2 or another extractor of Fallout4 archives.

While one build of nif plugin comes with max (and I strongly recommend to keep an eye on it's updates on github: https://github.com/niftools/ ), and you should already have it.

Archive2 however was not yet mentioned here. You can take it from CreationKit: <CreationKitRoot>\Tools\Archive2

Main mesh files are in this archive: Fallout4 - Meshes.ba2 inside the Data folder of Fallout4 installation.

All standard meshes are here: ..\Fallout 4\Data\Meshes\Actors\Character\CharacterAssets

GETTING IT INTO MAX

Now, assuming you already have the rig or animation scene open, to get them into max, you just use File-Import. Select the file you want to import. Select the skeleton.nif at the bottom of the nif plugin import window, which should've opened after you selected a file and clicked Import. It may not be required, but just in case.

Now, UNTICK the Import Skeleton checkbox, since we're importing it into a scene 

[/spoiler]

HOW TO IMPORT SKELETON FOR ANIMATION YOURSELF
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[spoiler]
Well, there is really no magic here, and there just a few steps to importing the skeleton and mesh into max from scratch, and setting it up for export.

All you need to do, is import FemaleBody or MaleBody or whatever *.nif file you want using NifTools plugin. From this folder, from Meshes archive:

Fallout 4\Data\Meshes\Actors\Character\CharacterAssets

You should also point it to the skeleton.nif file. This file you can find inside the Animations archive, same folder.

So just extract both Animation and Meshes archives and you should easily find those files.

And you import it with default settings. Now you can import additional meshes as discussed in another section of this text, if you need.

Now, setting it up for export.
[/spoiler]

MANUAL RIG EXPORT SETUP PROCESS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[spoiler]
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
[/spoiler]

Why 3ds max? Why these versions?
[spoiler]

Currently we are limited with the tools available. 3ds max everything required, for latest possible versions, and the most updated ones.

HCT2014 is available for Max and Maya 2012-2016. It is not available for blender.

niftools has it's most advanced and developed plugin for max only.

VERSIONS
You can use any of these versions to work with Fallout4 Animations:
3ds Max 2013
3ds Max 2014
3ds Max 2015

They all have HCT and niftools plugins support. 3ds max 2016 and 2017 are not supported by available HCT, and probably won't be anytime soon, since HCT's future is unknown, because Microsoft bought it recently.

I will be sticking with 3ds Max 2015, but Animation Kit will also include files for max 2013, which you'll be able to open in 2013 and 2014.

However I can't guarantee that I will save all files under for max 2013.
[/spoiler]

I will keep an eye on information about moving animation modding into Maya as well, but Blender guys have to research stuff themselves. I will, hovewer, add information about Blender to this header post, just send it to me, ill review it and post here.

