// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local SubObjective = ""

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Ravenholm03Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjective = ""
	SubObjSpot = nil
	CurObjTriggerSpotSpecial = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_town_03" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	if CurObjMarker == 18 then // Final number
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
	CurObjSpot = Vector(-3583, -876, -3564)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3646, -3521) and YPos == math.Clamp(YPos, -920, -833) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-2407, -1123, -3643)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2464, -2300) and YPos == math.Clamp(YPos, -1768, -704) )
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find a way out of Ravenholm\n- Find a way to move that platform"
	DeathObjective = "- Find a way out of Ravenholm - Objective Failed\n- Find a way to move that platform - Objective Failed"
	SubObjective = "\n- There seems to be no end to these zombies\n>I shouldn't linger around"
	SubObjSpot = Vector(-2236, -1628, -3389)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-2206, -1820, -3644)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2302, -2112) and YPos == math.Clamp(YPos, -1863, -1791) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-1920, -1664, -3484)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2000, -1920) and YPos == math.Clamp(YPos, -1792, -1604) )
end
if CurObjMarker == 6 then
	CurObjTriggerSpot = nil
	SubObjSpot = nil
	ActiveObjective = "- Find a way out of Ravenholm\n- Find a way to move that platform - Objective Complete"
	DeathObjective = "- Find a way out of Ravenholm - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-1697, -1549, -3664)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1752, -1600) and YPos == math.Clamp(YPos, -1612, -1504) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-1206, -1634, -3564)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1306, -1152) and YPos == math.Clamp(YPos, -1696, -1569) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-1053, -1371, -3500)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1087, -1024) and YPos == math.Clamp(YPos, -1406, -1350) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-1013, -864, -3372)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1095, -929) and YPos == math.Clamp(YPos, -975, -769) )
	CurObjTriggerSpotSpecial = ( XPos == math.Clamp(XPos, -1294, -1185) and YPos == math.Clamp(YPos, -1535, -1234) )
end
if CurObjTriggerSpotSpecial and CurObjMarker == 10 then
	CurObjMarker = 12
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-1681, -1058, -3364)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1833, -1609) and YPos == math.Clamp(YPos, -1386, -960) and ZPos == math.Clamp(ZPos, -3392, -3232) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-2105, -1162, -3372)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2170, -2042) and YPos == math.Clamp(YPos, -1223, -1097) and ZPos == math.Clamp(ZPos, -3371, -3232) )
end
if CurObjMarker == 13 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2631, -2361) and YPos == math.Clamp(YPos, -1591, -1236) )
	CurObjSpot = Vector(-2419, -1266, -3372)
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-2994, -1352, -3460)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3008, -2870) and YPos == math.Clamp(YPos, -1400, -1217) )
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(-3605, -1177, -3356)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3632, -3516) and YPos == math.Clamp(YPos, -1232, -1112) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(-3680, -828, -3324)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3742, -3584) and YPos == math.Clamp(YPos, -824, -745) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(-3914, -388, -3308)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3960, -3872) and YPos == math.Clamp(YPos, -409, -336) )
end
if CurObjMarker == 18 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end

if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Find a way to move that platform %- Objective Complete", "")
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
cam.End3D()

end // GetMap end
end)