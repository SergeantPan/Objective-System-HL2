// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "City17_02Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_02" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	if CurObjMarker == 15 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(-1165, 2655, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1200, -1136) and YPos == math.Clamp(YPos, 2654, 3265) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-1498, 2830, 309)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1560, -1493) and YPos == math.Clamp(YPos, 2785, 2877) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-1754, 2614, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1801, -1725) and YPos == math.Clamp(YPos, 2512, 2608) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-1949, 2602, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2046, -1856) and YPos == math.Clamp(YPos, 2478, 2717) and ZPos == math.Clamp(ZPos, 384, 504) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-1331, 2656, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1442, -1204) and YPos == math.Clamp(YPos, 2517, 2773) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-1242, 3297, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1280, -1204) and YPos == math.Clamp(YPos, 3266, 3368) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-1375, 3384, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1424, -1341) and YPos == math.Clamp(YPos, 3392, 3617) and ZPos == math.Clamp(ZPos, 512, 696) )
end
if CurObjMarker == 8 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-1310, 3651, 572)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-2050, 3465, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2127, -2064) and YPos == math.Clamp(YPos, 3424, 3523) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -1408, -1217) and YPos == math.Clamp(YPos, 3664, 3904) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-2052, 3169, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2065, -2002) and YPos == math.Clamp(YPos, 3143, 3200) )
	SubObjSpot = nil
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-1949, 2664, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2048, -1840) and YPos == math.Clamp(YPos, 2531, 2656) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-1957, 1733, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2072, -1840) and YPos == math.Clamp(YPos, 1669, 1748) )
end
if CurObjMarker == 13 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-2248, 1528, 559)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-2269, 1215, 660)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2336, -2272) and YPos == math.Clamp(YPos, 1152, 1312) and ZPos == math.Clamp(ZPos, 640, 825) )
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2376, -2256) and YPos == math.Clamp(YPos, 1472, 1728) )
end
if CurObjMarker == 15 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = nil
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