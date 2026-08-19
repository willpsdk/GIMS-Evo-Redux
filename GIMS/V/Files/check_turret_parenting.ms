(
	local Names = #("turret_1base","seat_dside_r","turret_1barrel","weapon_1a","turret_grip_r","turret_grip_l","ammobelt")
	for N in Names do (
		local Obj = GetNodeByName N
		if Obj == undefined then
			format "%: OBJECT NOT FOUND IN SCENE\n" N
		else (
			local ParentName = (if Obj.Parent == undefined then "<none - top level>" else Obj.Parent.Name)
			local HasSkin = false
			for M in Obj.Modifiers where (ClassOf M == Skin) do HasSkin = true
			format "%  ->  Parent: %   |  HasSkinModifier: %\n" N ParentName HasSkin
		)
	)
)
