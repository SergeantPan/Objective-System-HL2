// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local SubObjective = ""
	local CurObjMarker = 0
	local ThumpersDisabled = 0

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Coast12Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	ThumpersDisabled = 0
	SubObjective = ""
	SubObjSpot = nil
	SubObjSpot2 = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_coast_12" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

	local Alpha = Color( GetConVar("ObjFontColorR"):GetInt(), GetConVar("ObjFontColorG"):GetInt(), GetConVar("ObjFontColorB"):GetInt(), GetConVar("ObjFontColorA"):GetInt() )

	local Width = GetConVar("ObjSysTextXPos"):GetFloat()
	local Height = GetConVar("ObjSysTextYPos"):GetFloat()

	local ply = LocalPlayer()

	local XPos = math.Round(tostring(ply:GetPos().x), 0)
	local YPos = math.Round(tostring(ply:GetPos().y), 0)
	local ZPos = math.Round(tostring(ply:GetPos().z), 0) + 3

// Start the objective stuff
	draw.DrawText( "Current Objectives:", "ObjSysBig", ScrW() * Width, ScrH() * Height, Alpha, 0 )
	draw.DrawText( "__________________", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.01), Alpha, 0 )

if GetConVar("ObjSysResetOnDeath"):GetInt() == 1 and ply:Alive() then
if CurObjective == DeathObjective then
	RunConsoleCommand("ResetObjectives", "0")
end
end
if !ply:Alive() then
	CurObjective = DeathObjective
else
	CurObjective = ActiveObjective
end

if CurObjMarker == 0 then
	ActiveObjective = "- Reach Nova Prospekt"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed"
	CurObjMarker = 1
end
if CurObjMarker == 33 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

if SubObjective != "" then
	draw.DrawText( "Side Objectives:", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.15), Alpha, 0 )
	draw.DrawText( "__________________", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.16), Alpha, 0 )
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )
	draw.DrawText( SubObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.17), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(4569, -10179, 321)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4410, 4815) and YPos == math.Clamp(YPos, -10215, -9988) )
	SubObjTriggerSpot2 = ( XPos == math.Clamp(XPos, 4529, 4637) and YPos == math.Clamp(YPos, -11063, -11017) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(4573, -9193, 343)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4087, 5090) and YPos == math.Clamp(YPos, -9232, -8959) )
	SubObjSpot2 = nil
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = nil
	SubObjSpot2 = Vector(4644, -8286, 610)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(4917, -7571, 303)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3622, 5587) and YPos == math.Clamp(YPos, -7631, -7219) )
	SubObjTriggerSpot2 = ( XPos == math.Clamp(XPos, 4589, 4699) and YPos == math.Clamp(YPos, -8295, -8254) )
end
if CurObjMarker == 5 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(3628, -6042, 448)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(4343, -5433, 373)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3788, 5788) and YPos == math.Clamp(YPos, -5571, -5153) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 3500, 3862) and YPos == math.Clamp(YPos, -6150, -5841) )
end
if CurObjMarker == 7 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(2787, -4224, 715)
	SubObjSpot2 = Vector(4452, -4264, 627)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(4609, -3625, 340)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4066, 5870) and YPos == math.Clamp(YPos, -3694, -3373) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 2670, 3028) and YPos == math.Clamp(YPos, -4393, -4176) )
	SubObjTriggerSpot2 = ( XPos == math.Clamp(XPos, 4410, 4506) and YPos == math.Clamp(YPos, -4262, -4219) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(4595, -3615, 342)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4101, 5623) and YPos == math.Clamp(YPos, -3639, -3506) )
	SubObjSpot = nil
	SubObjSpot2 = nil
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(4982, -1344, 396)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3214, 5959) and YPos == math.Clamp(YPos, -1621, -1242) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(5117, 126, 302)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3812, 6819) and YPos == math.Clamp(YPos, 68, 72) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(3358, 789, 507)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3078, 3521) and YPos == math.Clamp(YPos, 259, 1141) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(2639, -270, 686)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2254, 2991) and YPos == math.Clamp(YPos, -337, -69) )
end
if CurObjMarker == 14 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(3060, -1092, 740)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(2141, -351, 692)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2070, 2240) and YPos == math.Clamp(YPos, -357, -280) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 3048, 3352) and YPos == math.Clamp(YPos, -1198, -985) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(1990, 257, 692)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1959, 2036) and YPos == math.Clamp(YPos, 192, 345) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 3048, 3352) and YPos == math.Clamp(YPos, -1198, -985) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(1696, 637, 692)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1648, 1757) and YPos == math.Clamp(YPos, 606, 656) )
	SubObjSpot = nil
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(1889, 1442, 692)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1280, 2240) and YPos == math.Clamp(YPos, 1406, 1532) )
end
if CurObjMarker == 19 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(1323, 1561, 608)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(2147, 2261, 692)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2048, 2255) and YPos == math.Clamp(YPos, 2212, 2295) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 1088, 1496) and YPos == math.Clamp(YPos, 1475, 1792) )
end
if CurObjMarker == 21 then
	CurObjSpot = Vector(3205, 3139, 784)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2994, 3472) and YPos == math.Clamp(YPos, 3072, 3213) )
end
if CurObjMarker == 22 then
	CurObjSpot = Vector(4550, 3865, 853)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4544, 4662) and YPos == math.Clamp(YPos, 3793, 3918) )
end
if CurObjMarker == 23 then
	CurObjSpot = Vector(4702, 4090, 868)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4652, 4764) and YPos == math.Clamp(YPos, 4064, 4096) )
end
if CurObjMarker == 24 then
	CurObjSpot = Vector(7694, 6272, 705)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7540, 7620) and YPos == math.Clamp(YPos, 5996, 6400) )
end
if CurObjMarker == 25 then
	CurObjSpot = Vector(9025, 7054, 688)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8852, 9305) and YPos == math.Clamp(YPos, 7051, 7138) )
end
if CurObjMarker == 26 then
	CurObjSpot = Vector(8566, 7824, 1121)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8468, 8688) and YPos == math.Clamp(YPos, 7775, 7859) )
end
if CurObjMarker == 27 then
	CurObjSpot = Vector(7949, 7191, 1329)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7748, 8155) and YPos == math.Clamp(YPos, 7038, 7426) )
end
if CurObjMarker == 28 then
	CurObjSpot = Vector(7073, 7740, 1429)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7016, 7133) and YPos == math.Clamp(YPos, 7657, 7805) )
end
if CurObjMarker == 29 then
	CurObjSpot = Vector(7636, 7717, 1842)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7490, 7812) and YPos == math.Clamp(YPos, 7539, 7766) and ZPos == math.Clamp(ZPos, 1800, 1850) )
end
if CurObjMarker == 30 then
	CurObjSpot = Vector(8900, 7729, 1700)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8791, 9002) and YPos == math.Clamp(YPos, 7524, 7847) and ZPos == math.Clamp(ZPos, 1600, 1700) )
end
if CurObjMarker == 31 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(8820, 8209, 1821)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 32 then
	CurObjSpot = Vector(9281, 8056, 2068)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 9205, 9356) and YPos == math.Clamp(YPos, 8005, 8196) and ZPos == math.Clamp(ZPos, 2044, 2193) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 8767, 8857) and YPos == math.Clamp(YPos, 8055, 8200) and ZPos == math.Clamp(ZPos, 1792, 1948) )
end
if CurObjMarker == 33 then
	CurObjTriggerSpot = nil
	CurObjSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = nil
end
if SubObjTriggerSpot2 and SubObjSpot2 != nil then
	SubObjSpot2 = nil
	ThumpersDisabled = ThumpersDisabled + 1
end
if ThumpersDisabled == 0 and CurObjMarker == 1 then
	SubObjSpot2 = Vector(4577, -11063, 595)
end
if ThumpersDisabled < 3 and CurObjMarker < 9 then
	SubObjective = "\n- Disable the Thumpers " .. ThumpersDisabled .. "/3\n>They prevent the Antlions from moving forward"
end
if ThumpersDisabled < 3 and CurObjMarker >= 9 then
	ThumpersDisabled = 4
	RemoveDelay = CurTime() + 5
	SubObjective = "\n- Disable the Thumpers - Objective Failed"
end
if ThumpersDisabled == 3 and CurObjMarker < 9 then
	ThumpersDisabled = 4
	RemoveDelay = CurTime() + 5
	SubObjective = "\n- Disable the Thumpers - Objective Complete"
end
if RemoveDelay < CurTime() then
	SubObjective = ""
end

cam.Start3D()
if CurObjSpot != nil then
	RoundedDistance = math.Round( ply:GetPos():Distance( CurObjSpot ) / 39.37, 0 )
if RoundedDistance < MarkerDistance then
	render.SetMaterial(Marker)
	render.DrawSprite( CurObjSpot, 14, 60, color_white )
end
end
if SubObjSpot != nil then
	RoundedDistance = math.Round( ply:GetPos():Distance( SubObjSpot ) / 39.37, 0 )
if RoundedDistance < MarkerDistance then
	render.SetMaterial(CuriosityMarker)
	render.DrawSprite( SubObjSpot, 14, 20, color_white )
end
end
if SubObjSpot2 != nil then
	RoundedDistance = math.Round( ply:GetPos():Distance( SubObjSpot2 ) / 39.37, 0 )
if RoundedDistance < MarkerDistance then
	render.SetMaterial(CuriosityMarker)
	render.DrawSprite( SubObjSpot2, 14, 20, color_white )
end
end
cam.End3D()

end // GetMap end
end)