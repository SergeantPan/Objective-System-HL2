// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local SubObjective = ""

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Ravenholm01AObj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjective = ""
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_town_01a" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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

if !ply:Alive() then
	CurObjective = DeathObjective
else
	CurObjective = ActiveObjective
end
if GetConVar("ObjSysResetOnDeath"):GetInt() == 1 and ply:Alive() then
if CurObjective == DeathObjective then
	RunConsoleCommand("ResetObjectives", "0")
end
end

if CurObjMarker == 0 then
	ActiveObjective = "- Find a way out of Ravenholm"
	DeathObjective = "- Find a way out of Ravenholm - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 8 or CurObjMarker == 25 then // Final number
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

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(154, -283, -3244)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 126, 184) and YPos == math.Clamp(YPos, -329, -247))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-101, -316, -3242)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -131, -65) and YPos == math.Clamp(YPos, -583, -238) )
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-346, -538, -3456)
	SubObjective = "\n- There's something behind those barrels"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-23, 1265, -3628)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -191, -1) and YPos == math.Clamp(YPos, 1216, 1339) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -501, -393) and YPos == math.Clamp(YPos, -671, -513))
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-334, 961, -3260)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -403, -266) and YPos == math.Clamp(YPos, 895, 1015) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -501, -393) and YPos == math.Clamp(YPos, -671, -513))
end
if CurObjMarker == 6 then
	CurObjTriggerSpot = nil
	SubObjective = string.gsub(SubObjective, "barrels", "barrels - Objective Failed")
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-1040, 981, -3324)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1078, -822) and YPos == math.Clamp(YPos, 926, 1016) )
end
if CurObjMarker == 8 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end
if CurObjMarker == 9 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(1343, -542, -3648)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(992, -564, -3691)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 835, 1088) and YPos == math.Clamp(YPos, -612, -340))
	CurObjTriggerSpotSpecial = (XPos == math.Clamp(XPos, 722, 816) and YPos == math.Clamp(YPos, -1336, -1225))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 1308, 1387) and YPos == math.Clamp(YPos, -582, -520))
end
if CurObjTriggerSpotSpecial and CurObjMarker == 10 then
	CurObjMarker = 12
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(512, -508, -3684)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 503, 584) and YPos == math.Clamp(YPos, -575, -439))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 1308, 1387) and YPos == math.Clamp(YPos, -582, -520))
end
if CurObjMarker == 12 then
	ActiveObjective = "- Find a way out of Ravenholm\n- Find a way to disable the electricity"
	DeathObjective = "- Find a way out of Ravenholm - Objective Failed\n- Find a way to disable the electricity - Objective Failed"
	CurObjSpot = Vector(826, -1280, -3756)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 722, 816) and YPos == math.Clamp(YPos, -1336, -1225))
	SubObjSpot = nil
	SubObjSpot2 = Vector(331, -584, -3434)
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(254, -908, -3500)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 220, 288) and YPos == math.Clamp(YPos, -952, -864) and ZPos > -3540)
end
if CurObjMarker == 14 then
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
	SubObjSpot = Vector(455, -1472, -3480)
	SubObjective = "\n- That vent might lead to something useful"
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(556, -660, -3468)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 500, 551) and YPos == math.Clamp(YPos, -713, -617))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 641, 747) and YPos == math.Clamp(YPos, -1664, -1600))
end
if CurObjMarker == 16 then
	CurObjTriggerSpot = nil
	SubObjSpot2 = nil
	ActiveObjective = "- Find a way out of Ravenholm\n- Find a way to disable the electricity - Objective Complete"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(336, -202, -3630)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 500, 551) and YPos == math.Clamp(YPos, -713, -617))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 641, 747) and YPos == math.Clamp(YPos, -1664, -1600))
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(336, -202, -3630)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 288, 382) and YPos == math.Clamp(YPos, -141, -71))
end
if CurObjMarker == 19 then
	CurObjTriggerSpot = nil
	SubObjSpot = nil
	SubObjective = "\n- That vent might lead to something useful - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(576, -379, -3392)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 512, 631) and YPos == math.Clamp(YPos, -447, -317))
end
if CurObjMarker == 21 then
	CurObjSpot = Vector(1121, -448, -3498)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 1092, 1177) and YPos == math.Clamp(YPos, -507, -408))
end
if CurObjMarker == 22 then
	CurObjSpot = Vector(1464, -63, -3628)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 1431, 1499) and YPos == math.Clamp(YPos, -56, 22))
end
if CurObjMarker == 23 then
	CurObjSpot = Vector(1079, -10, -3372)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 1034, 1098) and YPos == math.Clamp(YPos, -31, 13) and ZPos > -3400)
end
if CurObjMarker == 24 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(929, 389, -3560)
	SubObjective = "\n- There's something hidden back there"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 25 then
	CurObjSpot = Vector(320, 546, -3328)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 256, 379) and YPos == math.Clamp(YPos, 488, 576) and ZPos > -3400)
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 776, 887) and YPos == math.Clamp(YPos, 1056, 1143))
end
if CurObjMarker == 26 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = nil
	SubObjective = SubObjective .. " - Objective Complete"
	RemoveDelay = CurTime() + 5
end

if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Follow Alyx %- Objective Complete", "")
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