rollout F4_Animation_Kit "F4 Animation Kit (by ShadeAnimator)" width:328 height:368
(
	-- DEFINING UI
	GroupBox grp1 "CAT Rig" pos:[8,8] width:312 height:272
	GroupBox grp2 "Connection" pos:[16,24] width:296 height:248
	progressBar pb1 "ProgressBar" pos:[8,352] width:312 height:11 color:(color 0 200 0)
	label lbl1 "These buttons allow you to connect and disconnect the F4 skeleton to and from the control rig. It uses prefixes. Your control rig must have exact same naming as the F4 skeleton, but with some prefix, which you specify in the Prefix field. Don't forget that you always have to DISCONNECT first, then connect to a new rig." pos:[24,48] width:280 height:88
	edittext prefix_edt "Prefix" text:"F4CAT_" pos:[24,136] width:280 height:24
	button connect_btn "CONNECT" pos:[24,192] width:280 height:32
	button disconnect_btn "DISCONNECT" pos:[24,232] width:280 height:32
	checkbox keepOffsetChk "Keep Initial Offset (Maintain Offset)" pos:[24,168] width:272 height:16
	
	
	-- FUNCTIONS
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

	fn connectF4ToCAT mode prefix maintainOffset =
	(
		undo on (
			print "STARTING"
			objs = #()

			for obj in selection do (
				append objs obj
			)

			notConstrained = #()
			pb1.value = 0
			i = 0
			for obj in objs do (
				if obj.name != "Camera Control" do (
					targetName = prefix+obj.name
					execute("targetObj = $" + targetName)
					if targetObj != undefined then 
						(
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
									addOrientationConstraint $LArm_UpperArm #(targetObj) maintainOffset
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
						append notConstrained obj.name
						)

					i = i+1
					pb1.value = i/objs.count*100
				)
			)
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
	
	on connect_btn pressed do
	(
			select $Root
			selectHierarchy()
			connectF4ToCAT "connect" prefix_edt.text keepOffsetChk.checked
		)
	on disconnect_btn pressed do
	(
			select $Root
			selectHierarchy()
			connectF4ToCAT "disconnect" prefix_edt.text keepOffsetChk.checked
		)
)
createDialog  F4_Animation_Kit                                                             