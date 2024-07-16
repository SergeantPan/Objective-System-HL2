// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local SubObjective = ""

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Ravenholm01Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjective = ""
	SubObjSpot = nil
	SubObjSpot2 = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_town_01" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Evade the Combine assault\n- Escape through Ravenholm"
	DeathObjective = "- Evade the Combine assault - Objective Failed\n- Escape through Ravenholm - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 26 then // Final number
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
	CurObjSpot = nil
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4461, 4559) and YPos == math.Clamp(YPos, -2559, -2512))
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Evade the Combine assault - Objective Complete\n- Escape through Ravenholm"
	DeathObjective = "- Find a way out of Ravenholm - Objective Failed"
	CurObjMarker = CurObjMarker + 1
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 3 and RemoveDelay < CurTime() then
	CurObjSpot = Vector(3996, -1041, -3804)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 3926, 3989) and YPos == math.Clamp(YPos, -1207, -1001))
	ActiveObjective = "- Find a way out of Ravenholm"
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(3560, -1410, -3804)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 3493, 3551) and YPos == math.Clamp(YPos, -1456, -1360))
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(3001, -1392, -3764)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 2945, 3064) and YPos == math.Clamp(YPos, -1440, -1344))
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(2203, -1594, -3746)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 2171, 2226) and YPos == math.Clamp(YPos, -1696, -1602))
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(1932, -1431, -3746)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 1925, 2112) and YPos == math.Clamp(YPos, -1519, -1341))
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(1501, -1238, -3820)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 1458, 1569) and YPos == math.Clamp(YPos, -1344, -1152))
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
	DeathObjective = "- Find a way out of Ravenholm - Objective Failed"
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
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Find a way to disable the electricity %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- That vent might lead to something useful %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- That vent might lead to something useful %- Objective Failed", "")
	SubObjective = string.gsub(SubObjective, "%\n%- There's something hidden back there %- Objective Complete", "")
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