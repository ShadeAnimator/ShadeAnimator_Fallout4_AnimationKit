Havok 2 FBX Converter 0.1a
=============================

Utility to convert Havok 2014-1-0 x32 files to FBX 2014.2.1

Support
---------------------
- x32 .hkt / .hkx / .xml

Usage
---------------------
- Files to be converted must be on Version 2014-1-0 x32!
- Verfiy using Havok Content Tools before trying to convert

- Run havok2fbx.exe -hk_skeleton PATH -hk_anim PATH -fbx PATH
	- hk_skeleton 	= The skeleton base to use
	- hk_anim		= Animation to load with the skeleton ( optional )
	- fbx			= path and filename for exported fbx, uses input filename if not specified ( optional )

Credits
---------------------
- Autodesk, Inc. ( FBX SDK )
- Havok.com Inc. ( HAVOK Public SDK x32 )
- Ken Shoemake ( Euler/Quat Code Snippet )
- Figment ( Animation loading code idea/snippet from hkxcmd )
- Highflex ( Creator of havok2fbx tool )

Licensing
---------------------
- Check LICENSE.txt