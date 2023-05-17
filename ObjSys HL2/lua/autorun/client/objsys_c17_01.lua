// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "City17_01Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_01" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

	local Alpha = Color( GetConVar("ObjFontColorR"):GetInt(), GetConVar("ObjFontColorG"):GetInt(), GetConVar("ObjFontColorB"):GetInt(), GetConVar("ObjFontColorA"):GetInt() )

	local Width = GetConVar("ObjSysTextXPos"):GetFloat()
	local Height = GetConVar("ObjSysTextYPos"):GetFloat()

	local ply = LocalPlayer()

	local XPos = math.Round(tostring(ply:GetPos().x), 0)
	local YPos = math.Round(tostring(ply:GetPos().y), 0)
	local ZPos = math.Round(tostring(ply:GetPos().z), 0) + 3

// Start the objective stuff
if ActiveObjective != "" then
	draw.DrawText( "Current Objectives:", "ObjSysBig", ScrW() * Width, ScrH() * Height, Alpha, 0 )
	draw.DrawText( "__________________", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.01), Alpha, 0 )
end

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
	ActiveObjective = "- Escape Nova Prospekt"
	DeathObjective = "- Escape Nova Prospekt - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 15 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7270, -7089) and YPos == math.Clamp(YPos, -1249, -1088) )
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Escape Nova Prospekt - Objective Complete"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6537, -6352) and YPos == math.Clamp(YPos, -1096, -1043) )
end
if CurObjMarker == 4 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find Barney\n- Assault the Citadel"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 5 then
	CurObjTriggerSpot = nil
	CurObjSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Escape Nova Prospekt %- Objective Complete", "")
end

cam.Start3D()
if CurObjSpot != nil then
	RoundedDistance = math.Round( ply:GetPos():Distance( CurObjSpot ) / 39.37, 0 )
if RoundedDistance < MarkerDistance then
	render.SetMaterial(Marker)
	render.DrawSprite( CurObjSpot, 14, 60, color_white )
end
end
cam.End3D()

end // GetMap end
end)