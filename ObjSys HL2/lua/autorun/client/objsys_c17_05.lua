// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "City17_05Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_05" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	if CurObjMarker == 24 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(512, -6210, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 492, 581) and YPos == math.Clamp(YPos, -6272, -6121) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(1747, -6432, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1742, 1813) and YPos == math.Clamp(YPos, -6468, -6408) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(1771, -6339, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1724, 1768) and YPos == math.Clamp(YPos, -6368, -6288) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(1637, -6098, 340)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1608, 1689) and YPos == math.Clamp(YPos, -6095, -6054) and ZPos == math.Clamp(ZPos, 320, 422) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(1795, -5702, 340)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1746, 1792) and YPos == math.Clamp(YPos, -5759, -5656) and ZPos == math.Clamp(ZPos, 321, 440) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(1461, -5557, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1412, 1574) and YPos == math.Clamp(YPos, -5638, -5508) and ZPos == math.Clamp(ZPos, 128, 312) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(1386, -4936, 144)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1204, 1624) and YPos == math.Clamp(YPos, -5120, -4760) )
end
if CurObjMarker == 8 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find Barney\n- Assault the Citadel\n- Flank the Metrocop barrier"
	DeathObjective = "- Find Barney - Objective Failed\n- Assault the Citadel - Objective Failed\n- Flank the Metrocop barrier - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(1085, -4596, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1033, 1142) and YPos == math.Clamp(YPos, -4584, -4537) and ZPos == math.Clamp(ZPos, 129, 248) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(1241, -4263, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1151, 1277) and YPos == math.Clamp(YPos, -4408, -4157) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(882, -4373, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 812, 930) and YPos == math.Clamp(YPos, -4368, -4331) and ZPos == math.Clamp(ZPos, 384, 504) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(832, -4096, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 794, 878) and YPos == math.Clamp(YPos, -4094, -4058) )
end
if CurObjMarker == 13 then
	CurObjTriggerSpot = nil
	ActiveObjective = string.gsub(ActiveObjective, "barrier", "barrier - Objective Complete")
	DeathObjective = "- Find Barney - Objective Failed\n- Assault the Citadel - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(1377, -4089, 232)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1331, 1440) and YPos == math.Clamp(YPos, -4137, -4057) )
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(1985, -4060, 232)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1961, 2041) and YPos == math.Clamp(YPos, -4101, -4021) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(1727, -3581, 468)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1672, 1767) and YPos == math.Clamp(YPos, -3576, -3523) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(1570, -3235, 468)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1536, 1600) and YPos == math.Clamp(YPos, -3250, -3156) and ZPos == math.Clamp(ZPos, 400, 568) )
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(1720, -3396, 340)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1672, 1759) and YPos == math.Clamp(YPos, -3460, -3401) and ZPos == math.Clamp(ZPos, 320, 440) )
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(2433, -3241, 340)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2400, 2551) and YPos == math.Clamp(YPos, -3280, -3081) and ZPos == math.Clamp(ZPos, 256, 440) )
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(1670, -3329, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2401, 2551) and YPos == math.Clamp(YPos, -3423, -3264) and ZPos == math.Clamp(ZPos, 192, 312) )
	SubObjSpot = Vector(2499, -4293, 128)
end
if CurObjMarker == 21 then
	CurObjSpot = Vector(1670, -3329, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1622, 1664) and YPos == math.Clamp(YPos, -3382, -3287) and ZPos == math.Clamp(ZPos, 192, 312) )
end
if CurObjMarker == 22 then
	CurObjSpot = Vector(1667, -3331, -44)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1673, 1709) and YPos == math.Clamp(YPos, -3371, -3296) and ZPos == math.Clamp(ZPos, -64, 56) )
end
if CurObjMarker == 23 then
	CurObjSpot = Vector(2305, -3330, -108)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2244, 2386) and YPos == math.Clamp(YPos, -3387, -3334) and ZPos == math.Clamp(ZPos, -128, -8) )
end
if CurObjMarker == 24 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 2433, 2559) and YPos == math.Clamp(YPos, -4207, -4082) )
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = nil
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Flank the Metrocop barrier %- Objective Complete", "")
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