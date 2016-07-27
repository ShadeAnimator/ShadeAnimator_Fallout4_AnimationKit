rollout F4_Animation_Kit "F4AK Rig Connector (by ShadeAnimator)" width:328 height:304
(
	-- DEFINING UI
	GroupBox grp1 "Rig" pos:[8,8] width:312 height:264
	GroupBox grp2 "Connection" pos:[16,24] width:296 height:232
	progressBar pb1 "ProgressBar" pos:[8,280] width:312 height:11 color:(color 0 200 0)
	label lbl1 "These buttons allow you to connect and disconnect the F4 skeleton to and from the control rig. Don't forget that you always have to DISCONNECT first. By default two rigs are available: F4CAT_ and Bip_. Refer to the guide for more info." pos:[24,47] width:280 height:70
	edittext prefix_edt "Prefix" text:"F4CAT_" pos:[22,120] width:280 height:24
	button connect_btn "CONNECT" pos:[24,176] width:280 height:32
	button disconnect_btn "DISCONNECT" pos:[24,216] width:280 height:32
	checkbox keepOffsetChk "Keep Initial Offset (Maintain Offset)" pos:[24,152] width:272 height:16

	
	-- FUNCTIONS
	-- Here are all the workflow functions, which actually do stuff.
	-- Select array function
	function selectArray arr=
	(
		clearSelection()
		i = 0
		for obj in arr do (
			if i == 0 then 
			(
				select obj
			)
			else
			(
				selectmore obj
			)
		i = i+1				
		)
	)
	
	-- function to select hierarchy
	function selectHierarchy =
	 (
		 for p in selection do
		 (
			 if p.children != undefined do
			 (
			 selectmore p.children
			 )
		 )
	 )

	-- function to add rotation list and orientation constraint into it. Can work with multiple targets.
	fn addOrientationConstraint boneToOrient targetList maintainOffset =
	(
		if classof boneToOrient.rotation.controller != rotation_list do (
			boneToOrient.rotation.controller = rotation_list ()
			count = boneToOrient.rotation.controller.getCount()
			if count >= 2 do 
				(
					if boneToOrient.rotation.controller[2] != undefined do (
						boneToOrient.rotation.controller.delete 2
					)
				)
		)

		boneToOrient.rotation.controller.Available.controller = orientation_constraint ()
		boneToOrient.rotation.controller[2].relative = maintainOffset 

		boneToOrient.rotation.controller[2].appendTarget targetList[1] 100.0
		if targetList.count >= 2 then
		(
			for i=2 to targetList.count do
			(
				boneToOrient.rotation.controller.appendTarget targetList[i] 0.0
			)
		)
	)

	-- function to remove rotation list and orientation constraint into it. Can work with multiple targets.
	fn removeOrientationConstraint boneToOrient =
	(
		if classof boneToOrient.rotation.controller == rotation_list do (
			count = boneToOrient.rotation.controller.getCount()
			if count >= 2 do 
				(
				if boneToOrient.rotation.controller[2] != undefined do 
					(
					boneToOrient.rotation.controller.delete 2
					)
				)
		)
	)
	
	-- same for position constraint
	fn addPositionConstraint boneToOrient targetList maintainOffset =
	(
		if classof boneToOrient.position.controller != position_list do (
			boneToOrient.position.controller = position_list ()
			count = boneToOrient.position.controller.getCount()
			if count >= 2 do 
				(
					if boneToOrient.position.controller[2] != undefined do (
						boneToOrient.position.controller.delete 2
					)
				)
		)

		boneToOrient.position.controller.Available.controller = position_constraint ()
		boneToOrient.position.controller[2].relative = maintainOffset 

		boneToOrient.position.controller[2].appendTarget targetList[1] 100.0
		if targetList.count >= 2 then
		(
			for i=2 to targetList.count do
			(
				boneToOrient.position.controller.appendTarget targetList[i] 0.0
			)
		)
	)

	-- same for position constraint
	fn removePositionConstraint boneToOrient =
	(
		if classof boneToOrient.position.controller == position_list do (
			count = boneToOrient.position.controller.getCount()
			if count >= 2 do 
				(
				if boneToOrient.position.controller[2] != undefined do 
					(
					boneToOrient.position.controller.delete 2
					)
				)
		)
	)

	-- Go through the selected objects, find objects with prefixes and connect them.
	-- This function can be changed to use some sort of smart workflow, to define which constraints it should apply to the given joints. Right now it is hard-coded to work with the Human skeleton, and may also theoretically work with any other similar skeleton in the game. The only hard-coded thing right now is applying PositionConstraints for Pevlis, and dealing with UpperTwists for Arms.
	fn connectF4ToCAT mode prefix maintainOffset =
	(
		undo on (
			print "STARTING"
			
			-- Gather objects into an array to work with independently from selection.
			objs = #()

			for obj in selection do (
				append objs obj
			)

			notConstrained = #()
			pb1.value = 0
			i = 0
			
			-- iterate through all objects and do magic... kidding, no magic here. 
			for obj in objs do (
			
				-- Skip Camera Control, because script fails if there are spaces in joint names. Add "or obj.name != "object name" for any other object if you need to skip it"
				if obj.name != "Camera Control" do (
					-- Define target name based on the object name
					targetName = prefix+obj.name
					-- Some MaxScript trickery to get an object by name from the string variable, god I want Python integration... But it's only in 2017, more or less complete...
					execute("targetObj = $" + targetName)
					
					-- If targetObj exists
					if targetObj != undefined then 
						(
						-- From the code should be more or less obvious.
							if mode == "connect" do (
								addOrientationConstraint obj #(targetObj) maintainOffset
								if obj.name == "Pelvis" do (
									addPositionConstraint obj #(targetObj) maintainOffset
									addOrientationConstraint $COM #(targetObj) maintainOffset
									addPositionConstraint $COM #(targetObj) maintainOffset
								)
								
								if obj.name == "RArm_UpperArm" do
								(
									addOrientationConstraint $RArm_UpperTwist1 #(targetObj) maintainOffset
								)
								if obj.name == "LArm_UpperArm" do
								(
									addOrientationConstraint $RArm_UpperTwist1 #(targetObj) maintainOffset
								)
							)
							if mode == "disconnect" do (
								removeOrientationConstraint obj
								if obj.name == "Pelvis" do (
									removePositionConstraint obj
									removeOrientationConstraint $COM
									removePositionConstraint $COM
								)
								if obj.name == "RArm_UpperArm" do
								(
									removeOrientationConstraint $RArm_UpperArm
								)
								if obj.name == "LArm_UpperArm" do
								(
									removeOrientationConstraint $LArm_UpperArm
								)
							)
						)
					else  
						(
						-- Collect joints which are not constarint to print them after the fact, so you can check it.
						append notConstrained obj.name
						)
					
					-- Progress bar, which is not working during script work, convenient!
					i = i+1
					pb1.value = i/objs.count*100
				)
			)
			
			-- Append all notConstrained objects into one string, and print it
			constraintString = ""
			for obj in notConstrained do
			(
				constraintString = constraintString+obj+", "
			)
			
			print ("No CAT rig joints found for following nodes:")
			print constraintString
		)
	)
	
	-- UI FUNCTIONS
	-- Function for button presses and UI inputs.
	
	on connect_btn pressed do
	(
		--Remember old selection
		oldSelection = #()
		for obj in selection do 
			(
			append oldSelection obj
			)
			
		-- Do the trick
		select $Root
		
		selectHierarchy()
		
		connectF4ToCAT "connect" prefix_edt.text keepOffsetChk.checked
		-- restore selection
		selectArray oldSelection
		)
		
	-- not documented, since it's the same as above, just another mode.
	on disconnect_btn pressed do
	(
		oldSelection = #()
		for obj in selection do 
			(
			append oldSelection obj
			)
			
		select $Root
		selectHierarchy()
		connectF4ToCAT "disconnect" prefix_edt.text keepOffsetChk.checked
		
		selectArray oldSelection
		
		)
)
createDialog  F4_Animation_Kit      

--Created by ShadeAnimator. Enjoy!

                                                                                                                            