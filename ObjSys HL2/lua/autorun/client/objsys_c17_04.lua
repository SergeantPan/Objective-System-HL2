// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "City17_04Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_04" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(-4099, -3271, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4159, -4002) and YPos == math.Clamp(YPos, -3344, -3201) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-3232, -3010, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3278, -3184) and YPos == math.Clamp(YPos, -3065, -3017) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-3711, -3331, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3776, -3648) and YPos == math.Clamp(YPos, -3414, -3325) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-3716, -3838, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3786, -3631) and YPos == math.Clamp(YPos, -3939, -3840) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-1470, -4094, 340)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1536, -1408) and YPos == math.Clamp(YPos, -4200, -4098) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-1472, -5146, 340)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1665, -964) and YPos == math.Clamp(YPos, -5248, -5044) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-440, -5239, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -515, -320) and YPos == math.Clamp(YPos, -5373, -5132) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-124, -6204, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -127, -1) and YPos == math.Clamp(YPos, -6272, -6144) )
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