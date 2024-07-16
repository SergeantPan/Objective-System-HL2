// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "City17_03Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_03" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	if CurObjMarker == 9 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5174, -5083) and YPos == math.Clamp(YPos, -4174, -4143) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-3890, -3824, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3970, -3840) and YPos == math.Clamp(YPos, -4160, -3598) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-3582, -4504, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3574, -3500) and YPos == math.Clamp(YPos, -4597, -4416) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-2992, -4388, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3074, -2624) and YPos == math.Clamp(YPos, -4496, -4248) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-2895, -3165, 16)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3072, -2661) and YPos == math.Clamp(YPos, -3188, -3088) )
end
if CurObjMarker == 6 then
	CurObjTriggerSpot = nil
	CurObjSpot = nil
for _,MetroCops in pairs(ents.FindByClass("npc_metropolice")) do
if IsValid(MetroCops) then
CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-1647, -2988, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1728, -1541) and YPos == math.Clamp(YPos, -3025, -3019) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-1280, -3550, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1281, -1228) and YPos == math.Clamp(YPos, -3584, -3518) )
end
if CurObjMarker == 9 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
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