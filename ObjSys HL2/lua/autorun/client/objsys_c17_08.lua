// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "City17_08Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_08" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Find Barney\n- Assault the Citadel"
	DeathObjective = "- Find Barney - Objective Failed\n- Assault the Citadel - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 27 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(-2248, -2969, 284)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2347, -2115) and YPos == math.Clamp(YPos, -2991, -2768) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-1624, -2879, 135)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1669, -1564) and YPos == math.Clamp(YPos, -2932, -2832) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-1419, -3133, 285)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1454, -1376) and YPos == math.Clamp(YPos, -3214, -2032) and ZPos == math.Clamp(ZPos, 261, 328) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-1418, -2037, 283)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1437, -1394) and YPos == math.Clamp(YPos, -2024, -1986) and ZPos == math.Clamp(ZPos, 268, 323) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-1496, -1696, 124)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1569, -1346) and YPos == math.Clamp(YPos, -1808, -1648) )
end
if CurObjMarker == 6 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-2720, -1741, 158)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-1179, -1438, 124)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1215, -1153) and YPos == math.Clamp(YPos, -1533, -1360) and ZPos == math.Clamp(ZPos, 104, 259) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -2720, -2560) and YPos == math.Clamp(YPos, -2000, -1648) )
end
if CurObjMarker == 8 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-1079, -1863, -368)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-886, -1440, -196)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -893, -805) and YPos == math.Clamp(YPos, -1488, -1391) and ZPos == math.Clamp(ZPos, -215, -89) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -1152, -940) and YPos == math.Clamp(YPos, -1886, -1796) and ZPos == math.Clamp(ZPos, -392, -224) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-496, -1439, -188)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -529, -469) and YPos == math.Clamp(YPos, -1504, -1382) and ZPos == math.Clamp(ZPos, -208, -105) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -1152, -940) and YPos == math.Clamp(YPos, -1886, -1796) and ZPos == math.Clamp(ZPos, -392, -224) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-508, -1438, -188)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -512, -455) and YPos == math.Clamp(YPos, -1486, -1404) and ZPos == math.Clamp(ZPos, -207, -80) )
	SubObjSpot = nil
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-241, -1905, -268)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -264, -111) and YPos == math.Clamp(YPos, -1976, -1524) )
end
if CurObjMarker == 13 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(622, -1968, -233)
	SubObjSpot2 = Vector(209, -1394, -464)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(226, -1709, -264)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 146, 288) and YPos == math.Clamp(YPos, -1829, -1456) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 623, 703) and YPos == math.Clamp(YPos, -2080, -1962) )
	SubObjTriggerSpot2 = ( XPos == math.Clamp(XPos, 161, 722) and YPos == math.Clamp(YPos, -1435, -752) and ZPos == math.Clam(ZPos, -464, -385) )
end
if CurObjMarker == 15 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 146, 288) and YPos == math.Clamp(YPos, -1829, -1456) )
	SubObjSpot = Vector(1235, -928, -490)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(1071, -1422, -268)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 993, 1170) and YPos == math.Clamp(YPos, -1484, -1346) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 991, 1629) and YPos == math.Clamp(YPos, -1056, -658) and ZPos == math.Clamp(ZPos, -560, -447) )
	SubObjTriggerSpot2 = ( XPos == math.Clamp(XPos, 161, 722) and YPos == math.Clamp(YPos, -1435, -752) and ZPos == math.Clamp(ZPos, -464, -385) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(1260, -553, -364)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1184, 1332) and YPos == math.Clamp(YPos, -656, -497) and ZPos == math.Clamp(ZPos, -384, -214) )
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(1477, 360, 86)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1376, 1628) and YPos == math.Clamp(YPos, 354, 488) and ZPos == math.Clamp(ZPos, 66, 204) )
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(1477, 360, 86)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 832, 1020) and YPos == math.Clamp(YPos, -785, -642) and ZPos == math.Clamp(ZPos, 64, 194) )
end
if CurObjMarker == 20 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1452, 1619) and YPos == math.Clamp(YPos, -956, -676) and ZPos == math.Clamp(ZPos, 80, 187) )
	SubObjSpot = Vector(1533, -687, 121)
end
if CurObjMarker == 21 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1326, 1512) and YPos == math.Clamp(YPos, -634, -428) and ZPos == math.Clamp(ZPos, 48, 88) )
end
if CurObjMarker == 22 and ply:IsOnGround() == true then
	CurObjTriggerSpot = ZPos > 380
end
if CurObjMarker == 23 then
	CurObjSpot = Vector(956, 516, 676)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 880, 975) and YPos == math.Clamp(YPos, 417, 520) and ZPos == math.Clamp(ZPos, 656, 781) )
end
if CurObjMarker == 24 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(1711, 609, 786)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 25 then
	CurObjSpot = Vector(1626, -96, 644)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1616, 1717) and YPos == math.Clamp(YPos, -158, -31) and ZPos == math.Clamp(ZPos, 625, 752) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 1634, 1760) and YPos == math.Clamp(YPos, 576, 640) and ZPos == math.Clamp(ZPos, 768, 866) )
end
if CurObjMarker == 26 then
	CurObjSpot = Vector(2067, -164, 644)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2017, 2112) and YPos == math.Clamp(YPos, -279, -127) )
end
if CurObjMarker == 27 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = nil
end
if SubObjTriggerSpot2 and SubObjSpot2 != nil then
	SubObjSpot2 = nil
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