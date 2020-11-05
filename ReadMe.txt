Sorry to say, but this project was abandoned. Latest 'stable' version can be found on NexusMods here: https://www.nexusmods.com/fallout4/mods/16694
There's also an explanation as to why, but TLDR it kinda works as is, and I don't have neither time nor interest to work on it much more.

[size=6][color=#00ff00][b]Making animations for Fallout 4.[/b][/color][/size]
[i]This thread is for animators and modders.[/i]
 
[i]It is here to discuss animation tools, plugins and everything required to create animations for Fallout 4 mods, to convert them, to rig, skin character models, etc.[/i]
 
 
Unlike Skyrim, information about making animation for Fallout 4 is still under heavy research, however we've already made some progress. 
 
 
[color=#00ff00][size=5][b]General Software information[/b][/size][/color]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
[color=#00ff00][b]3ds max[/b][/color]
It's the primary and most advanced package to work with Fallout4 animations so far. It has all the tools needed, all the plugins, and in some cases these plugins are more feature-full than in other software.
 
Main reason why it's currently the best solution for animations is that is has HavokContentTools and niftools plugins are compiled and available for it from the official niftools github repo.
 
+ HCT
+ Niftools Plugin
 
 
[color=#00ff00][b]Maya[/b][/color]
Maya may be the second tool in this list, because it also has HCT and niftools plugin, and can use same HCT presets. But it is much harder to find the right compiled niftools plugin.[color=#ff0000][b] I did not find it yet, for Maya 2013-2015. If someone can compile it for Maya 2015, it would be perfect![/b][/color]
 
But since in fact niftools plugin is only required to import and export MESHES it should be possible to export meshes and joints as FBX into maya, and then work in it from there.
 
[b][color=#00ff00]Blender[/color][/b]
Bad news for blender users, it does not have HCT plugin available. Without it, currently it is not possible to export *.hkx animation files, until some third-party tool arrives.
 
However it should be possible to create a blender scene for animation and use it to animate, then export FBX animation, bring it into 3ds max, and export from there.
 
 
[color=#00ff00][b]Universal[/b][/color]
The real breakthrough can at some point come from [url=http://www.loverslab.com/topic/55609-hkxpackhkxanim-animations-in-fo4/][color=#00ff00]DexesTTP with his hkx tools[/color][/url], he is basically working on a standalone COLLADA => HKX converter. COLLADA format is available for both max and maya, and, i'm not sure, but I think blender too. It will make the process of exporting animations as simple as exporting an animation file into collada format with built-in tools, and converting it with a converter.
 
Once the converter is ready it will be even possible to automate the process to just 1 button click, a script can then export an animation, and launch external converter to convert it into hkx, so it will look like it just exported into hkx :D
 
[color=#00ff00][b]HavokContentTools 2014[/b][/color]
Can be obtained through other modders.
 
Required to create animations, was actually available for free from the official site. Until Microsoft bought them, and removed from the site. But they officially allow those people, who still have them, to keep using them. And while redistribution is not allowed by the license, you don't need to provide any license keys or anything to install the plugin, which really makes redistribution untraceable.
 
So while I'm not approving piracy, finding HCT2014 is possible.
---
 
 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[color=#00ffff][b][size=6]3DS MAX[/size][/b][/color]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 
 
[size=5][color=#00ff00][b]TOOLS AND FILES[/b][/color][/size]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
I try to collect all the tools required to create animations here: 
[size=4][b][url=https://github.com/ShadeAnimator/ShadeAnimator_Fallout4_AnimationKit][color=#008000]https://github.com/ShadeAnimator/ShadeAnimator_Fallout4_AnimationKit[/color][/url][/b][/size]
 
This Kit is designed to have everything you need to start making animations for Fallout4, with a few remarks and exceptions.
 
So, this kit has:
* 3ds max scenes for max 2013-2015, ready for rigging
* 3ds max scenes for max 2013-2015 with RIGs ready for animation (COMING)
* HavokContentTools preset and rig files (WIP)
* HKXPACK with UI to convert hkx to xml and xml to hkx (by DexesTTP)
* niftools plugin for 3ds max
 
Now, you also NEED TO FIND:
* HavokContentTools 2014 (last I know of, it has plugins for max 2012-2015. These tools can only be found through other modders as of now. So, ask people.)
* 3ds max (obviously :D)
 
 

[color=#ffd700][size=5]IMPORTANT![/size][/color]
 
These tools are included in the Kit, just to make it easier to start animating. But this Kit may contain OLDER VERSIONS of programs and tools, like hkxpack and niftools, and I STRONGLY RECOMMEND you visiting their development pages and getting updated versions:
 
[b][url=https://github.com/niftools/][color=#008000] https://github.com/niftools/[/color][/url][/b]
[b][color=#008000][url=https://github.com/Dexesttp/hkxpack] https://github.com/Dexesttp/hkxpack[/url][/color][/b]
 
Another version of 3ds max nif plugin, claimed to be better:
[url=https://github.com/figment/max_nif_plugin/releases]https://github.com/figment/max_nif_plugin/releases[/url]

 
---
 
[size=5][color=#00ff00][b]NOVICE NOTICE:[/b][/color][/size]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
Not included, but really needed is some basic knowledge of 3ds max and rigging and animating. If you never rigged and animated anything before, all this might be very overwhelming for you, but for anyone who has at least some rigging and animation experience, and even better - some realization of how 3d animation works in general - all this should be really easy to follow.
 
If you want to start animating for Fallout4 or any other game, but you have no experience with animation and rigging, I'd suggest you starting with someting else first. But if you absolutely sure that you want to make animations for FO4 (or need to), then I'd sugget you first going through some tutorials.
 
I may suggest Digital Tutors, tutorials like intro to 3ds max, rigging (preferably not CAT or Biped but tutorials about making custom rigs, they will give you the understanding you need.) and animation.
---
 
[size=5][color=#00ff00][b]GLOSSARY[/b][/color][/size]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
Just so we are on the same page. Here are some terms:
 
[color=#00ff00][b]Rig [/b][/color]- this can be a misquiding word, because it usually means not just one thing, but it includes a few things. Which are:
[indent=1][color=#00ff00]Skeleton [/color]- Skeleton is a collection of joints, in gamedev they usually have to have the same root and exist within the same hierarchy. The joints\bones are used to drive character mesh, which is skinned to them, some of the joints\bones, usually referred to as locators, can be used as 'sockets' to snap other meshes to in realtime, like weapon joints.[/indent]
[indent=1] [/indent]
[indent=1]Basically joint is just a transform in space, and there is usually no real separation of joints or locators or nulls in game engines, only in 3d software, where they may have different properties and behaviour, only until you export them.[/indent]
[indent=1] [/indent]
[indent=1][color=#00ff00]Skinning [/color]- Skinning is a process of bining character mesh's verticies to specific joints.[/indent]
[indent=1] [/indent]
[indent=1][color=#00ff00]Control Rig[/color] - A collection of additional objects and constraints which are required to make it possible for an animator to animate the character comfortably. While you can just animate joints, this is not really the right way to work with animations. Rigs can be simple or complex, they can be considered programs even, because they follow same conventions usually.[/indent]
[indent=1] [/indent]
[indent=1]So basically character control rig is the strings an animator uses to control the puppet, while the puppet it skeleton and skinned mesh. It is good idea to keep control rig and skeleton separately.[/indent]
[indent=1] [/indent]
[indent=1]In 3ds max there are 3 ways to create Control Rig:[/indent]
[indent=1]1. Creating Custom Control Rig, using bones, constraints, and objects and other tools available in max.[/indent]
[indent=1]2. Using CAT - CharacterAnimationToolkit, built-in plugin in max, which allows you to easily create a rig for any character, and includes some animation tools, like mirroring, pose saving, etc.[/indent]
[indent=1]3. Using Biped - less feature-full and older built-in plugin for max, which allows you to quickly rig a humanoid character.[/indent]
[indent=1] [/indent]
[indent=1][color=#00ff00]Rig File[/color] - this is something specific to Fallout4 and Skyrim, rig file is a txt file required by Havok Content Tools to define the joints and their order upon export.[/indent]
---
 
[color=#00ff00][b][size=5]BASIC WORKFLOW[/size][/b][/color]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
The basic workflow is this:
 
1. You either make a copy of one of the supplied scenes, or reference them into a new 3ds max scene. Either way, just preferably don't mess with original files, or have a backup somewhere.
 
2. You make your animation however you like. Don't change the hierarchy of objects under the Root, and don't touch the CharacterBumper and given mesh objects. You can use constraints, you can constraint those objects to other objects, etc etc, anything that does not break the hierarchy. Only the names and hierachy is important.
 
3. To export you go to Havok Content Tools menu - Export.
 
4. Here you should already have the right preset loaded, but just to be sure, go File - Load Configuration File and point it to HCT_Preset.hko file which comes with this Kit
 
5. Click on Create Skeletons filter in the list to the right. To the right of it you should now see this filter's settings.
 
6. In the Build Rig, you need to select From File and pick the Fallout4Rig_byShadeAnimator.txt. Sometimes you may have to refresh it, by choosing some other option, then From File again. And selecting a file. It will just load the list of bones and their order from that file. This is also the list of bones which will have animation on them. But it's really easy to break this file, because order and names are important, so you can experiment with it, but carefully.
 
7. Go to Write to Platform filter.
 
8. In the filename chose the destination for your new hkx file to save it to.
 
Click Run Configuration. Or Run Configurations, whatever  button you like most.
 
Now, if there were no errors, you should have your fresh animation file! Yay!
 
If there were errors, check these steps again, and if you still can't export your file... 
 
 
HINT:
Any MESH object in 3ds max scene, is there just for preview purposes. It won't be exported with animation. Max scene files come with a few meshes included, you can Hide and show them however you like. For example there is a CBBE body which might be more pleasant to look at while animating. Also there are a few hair styles. And you can import more meshes. How? Described in another section of this text.
---
 
[color=#00ff00][b][size=5]TESTING ANIMATIONS IN THE GAME[/size][/b][/color]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
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
---
 
 

[color=#00ff00][size=5][b]ANNOTATIONS (UNTESTED YET)[/b][/size][/color]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
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

---
 
[b][color=#00ff00][size=5]IMPORTING NEW PREVIEW MESHES INTO EXISTING SCENE[/size][/color][/b]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
This Animation Kit comes with a few basic meshes already. But sometimes you may need or just want to test your animations with some specific ones. Adding new meshes into 3ds max is simple, and you should have everything you need.
 
So, the tools you'll need are:
 
* 3ds max (obviously)
* nif plugin
* Archive2 or another extractor of Fallout4 archives.
 
While one build of nif plugin comes with max (and I strongly recommend to keep an eye on it's updates on github: [url=https://github.com/niftools/]https://github.com/niftools/[/url] ), and you should already have it.
 
Archive2 however was not yet mentioned here. You can take it from CreationKit: <CreationKitRoot>\Tools\Archive2
 
Main mesh files are in this archive: Fallout4 - Meshes.ba2 inside the Data folder of Fallout4 installation.
 
All standard meshes are here: ..\Fallout 4\Data\Meshes\Actors\Character\CharacterAssets
 
[color=#00ff00][size=5]GETTING IT INTO MAX[/size][/color]
 
Now, assuming you already have the rig or animation scene open, to get them into max, you just use File-Import. Select the file you want to import. Select the skeleton.nif at the bottom of the nif plugin import window, which should've opened after you selected a file and clicked Import. It may not be required, but just in case.
 
Now, UNTICK the Import Skeleton checkbox, since we're importing it into a scene 
 
---
 
[color=#00ff00][size=5]HOW TO IMPORT SKELETON FOR ANIMATION YOURSELF AND CREATE A RIG.TXT FILE[/size][/color]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
Well, there is really no magic here, and there just a few steps to importing the skeleton and mesh into max from scratch, and setting it up for export.
First you need to extract two archives: Meshes and Animations. They have everything you need for animations.
 
All you need to do, is import two files. First is the mesh *.nif files, and second is the skeleton.nif files, which is unique for each creature.
Using Deathclaw as example, you can find them here:
\Fallout 4\Data\Meshes\Actors\Deathclaw\Deathclaw.nif (Mesh)
\Fallout 4\Data\Meshes\Actors\Deathclaw\CharacterAssets\skeleton.nif
 
You will also need a skeleton.hkx file to get the order of joints for rig.txt. (Rig.txt is just a txt file you load into HCT as a preset of a rig, you can name it however you want).
\Fallout 4\Data\Meshes\Actors\Deathclaw\CharacterAssets\skeleton.hkx
 
The path convention is the same for all creatures. Or at least it should be. If not, try using logic and locating these files :)
 
And you import it with default settings. Now you can import additional meshes as discussed in another section of this text, if you need.
 
[color=#00ff00][b]To create a rig.txt:[/b][/color]
You can use my tool, which is on git, under HKXPACK_BASED_TOOLS
Give it a skeleton.hkx and press generate rig.txt, it will do the rest.
 
You can do it manually. Convert skeleton.hkx to xml using hkxpack, and then find the "bones" there, and create the following file:
[HAVOK SKELETON DEFINITION FILE]
 
[BONES START]
Bone
Bone
Bone
[BONES END]
 
just replace Bone Bone Bone with your joints.
 
Now, thats not all. 
 
Open your scene, go to Havok Export, and try to load the rig.txt file under the Create Skeletons filter. It will probably show a few errors, saying that it can't find some joints. It's common.
 
First, check if there are joints in your scene named in CAPS. Like commonly, Weapon is called WEAPON. Renamed them in your scene to match the naming from the rig.txt file.
 
Then, if there are still missing joints, if you think they are not sagnificant for animation - you can just create a joints anywhere in the hierarchy with the name of a missing joints.
 
Otherwise you may have to check other nif files for those joints. For example for human I had to import pistol and dummy weapons to get all the joints needed. But for creatures you will probably only need to create, say, a Camera joint, it should not be an issue really.
 
Thats all.
 
 
Now, setting it up for export.
---
 
[color=#00ff00][b][size=5]MANUAL RIG EXPORT SETUP PROCESS[/size][/b][/color]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
Okay, so, to export animation for FO4 from max you need:
 
* max 2013-2015 (version is limited by HavokContentTools supported versions only so far)
* niftools plugin
* HavokContentTools 2014
* Rig.txt file (because automatic joint finding does not work properly)
* Preset for HCT which comes with this Kit
 
So far the most tricky process WAS getting the correct joints and their ORDER in the Rig.txt file. You can call this file hoever you want, it's just a plain TXT file with a few headers inside [square brackets], you can use my as example. I recommend editing it in Notepad++, since it treats line-changes a bit differently than Windows Notepad. But both should work, thats just paranoia :D
 
I am almost 100% certain that the order of joints should be the same as it is inside the skeleton.hkx file. To view it, you can convert it into xml using hkxpack program, which comes with this Kit as well, thanks to DexesTTP. You should be able to get the order of joints from the xml file, as they are defined.
 
You an also use my tool, it is on git, under HKXPACK_BASED_TOOLS, exe and py versions. It will extract all the data from hkx or xml (by converting hkx to xml first) and create a txt file.
 
so, steps:
 
1. Setup rig.txt file.
 
2. Next, you need to go to Havok Content Tools - Export. In the new window go File -  Load Configuration Preset, and load the *.hko file included inside the HCT_Presets folder. 
 
3. Starting from here, click the Create Skeletons tab. And specify your rig txt file there. You may have to refresh it sometimes, by choosing another option then From File again.
 
4. Go to Write Platform tab (or list item rather), and select the output file location, where you want new file to be.
 
 
Thats all! Just 4 steps.
---
 
[color=#00ff00][b]Why 3ds max? Why these versions?[/b][/color]
---
 
Currently we are limited with the tools available. 3ds max everything required, for latest possible versions, and the most updated ones.
 
HCT2014 is available for Max and Maya 2012-2016. It is not available for blender.
 
niftools has it's most advanced and developed plugin for max only.
 
[color=#00ff00][b]VERSIONS[/b][/color]
You can use any of these versions to work with Fallout4 Animations:
3ds Max 2013
3ds Max 2014
3ds Max 2015
 
They all have HCT and niftools plugins support. 3ds max 2016 and 2017 are not supported by available HCT, and probably won't be anytime soon, since HCT's future is unknown, because Microsoft bought it recently.
 
I will be sticking with 3ds Max 2015, but Animation Kit will also include files for max 2013, which you'll be able to open in 2013 and 2014.
 
However I can't guarantee that I will save all files under for max 2013.
---
 
I will keep an eye on information about moving animation modding into Maya as well, but Blender guys have to research stuff themselves. I will, hovewer, add information about Blender to this header post, just send it to me, ill review it and post here.
 
 
 
[size=5][color=#00ff00][b]Need help with animations for your mod? Contact me.[/b][/color][/size]
[size=5][color=#00ff00][b]ShadeAnimator[/b][/color][/size]
---
I'm open and friendly. Feel free to approach me with ideas of your mods. If I like the idea and have time for it, I will help you with animations. If I don't have time, I will at least help you with consult to the extent of my abilities. Simple as that.
---
