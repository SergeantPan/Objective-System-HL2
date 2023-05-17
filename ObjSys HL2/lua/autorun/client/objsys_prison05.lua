// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Prison05Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_prison_05" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Find Alyx\n- Find Eli"
	DeathObjective = "- Find Alyx - Objective Failed\n- Find Eli - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 16 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(704, 896, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 622, 718) and YPos == math.Clamp(YPos, 736, 1024) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(305, 1920, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 248, 303) and YPos == math.Clamp(YPos, 1793, 2048) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-256, 1786, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -369, -143) and YPos == math.Clamp(YPos, 1729, 1776) )
end
if CurObjMarker == 4 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-727, 1088, 359)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-96, 253, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -143, -29) and YPos == math.Clamp(YPos, 175, 252) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -803, -710) and YPos == math.Clamp(YPos, 544, 1120) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-631, 28, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -703, -640) and YPos == math.Clamp(YPos, -34, 127) )
	SubObjSpot = nil
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-1593, -1133, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1662, -1601) and YPos == math.Clamp(YPos, -1215, -596) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-2326, -585, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2384, -2260) and YPos == math.Clamp(YPos, -576, -468) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-2046, 140, 596)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2240, -1920) and YPos == math.Clamp(YPos, 30, 192) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-2419, 179, 660)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2460, -2368) and YPos == math.Clamp(YPos, 181, 228) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-2241, 503, 788)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2276, -2087) and YPos == math.Clamp(YPos, 531, 548) )
end
if CurObjMarker == 12 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find Alyx\n- Find Eli\n- Kill the Antlion Guard"
	DeathObjective = "- Find Alyx - Objective Failed\n- Find Eli - Objective Failed\n- Kill the Antlion Guard - Objective Failed"
	for _,AntyCorpse2 in pairs(ents.FindByClass("prop_ragdoll")) do
if AntyCorpse2:GetModel() == "models/antlion_guard.mdl" then
	ActiveObjective = "- Find Alyx\n- Find Eli\n- Kill the Antlion Guard - Objective Complete"
	DeathObjective = "- Find Alyx - Objective Failed\n- Find Eli - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-2811, 444, 683)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2939, -2725) and YPos == math.Clamp(YPos, 348, 436) )
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-2776, -337, 660)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2844, -2721) and YPos == math.Clamp(YPos, -408, -292) )
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(-4589, -705, 660)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4688, -4444) and YPos == math.Clamp(YPos, -788, -698) )
end
if CurObjMarker == 16 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = nil
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Kill the Antlion Guard %- Objective Complete", "")
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