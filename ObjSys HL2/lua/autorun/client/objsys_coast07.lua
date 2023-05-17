// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local AlternateStart = false

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Coast07Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_coast_07" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
for _,ForceField in pairs(ents.FindByClass("prop_dynamic")) do
if ForceField:GetModel() == "models/props_combine/combine_fence01b.mdl" and ForceField:GetSkin() == 1 then
	AlternateStart = true
end
end
end

if CurObjMarker == 0 then
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed"
if AlternateStart == false then
	CurObjMarker = 1
else
	CurObjMarker = 11
end
end
if CurObjMarker == 10 or CurObjMarker == 15 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(-4101, 6142, 1620)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4096, -3943) and YPos == math.Clamp(YPos, 5731, 6529) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-2815, 8189, 1684)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3082, -2297) and YPos == math.Clamp(YPos, 8127, 8226) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-1590, 9346, 1684)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1681, -1438) and YPos == math.Clamp(YPos, 8697, 9731) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(757, 8672, 1682)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 390, 1120) and YPos == math.Clamp(YPos, 8292, 9302) )
end
if CurObjMarker == 5 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(1668, 9186, 1704)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(885, 7374, 1586)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 493, 12288) and YPos == math.Clamp(YPos, 6203, 7549) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 1505, 1895) and YPos == math.Clamp(YPos, 9124, 9535) )
end
if CurObjMarker == 7 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Find a way to disable the forcefield\n>The bridge across is blocked by a forcefield"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed\n- Find a way to disable the forcefield - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(412, 5625, 1556)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 16, 2663) and YPos == math.Clamp(YPos, 4931, 5667) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 1505, 1895) and YPos == math.Clamp(YPos, 9124, 9535) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(3040, 5218, 1555)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3073, 3119) and YPos == math.Clamp(YPos, 5120, 5376) )
	SubObjSpot = nil
end
if CurObjMarker == 10 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(3344, 5227, 2068)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3019, 3647) and YPos == math.Clamp(YPos, 5134, 5312) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(3222, 1645, 2068)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3020, 3639) and YPos == math.Clamp(YPos, 1595, 1709) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(3218, -3780, 2068)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3007, 3638) and YPos == math.Clamp(YPos, -3816, -3700) )
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(6081, -7618, 1770)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6070, 6154) and YPos == math.Clamp(YPos, -8091, -7294) )
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
	RemoveDelay = CurTime() + 5
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