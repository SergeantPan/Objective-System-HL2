// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "Canals01Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_01" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Evade the Metropolice\n- Find the rebel network"
	DeathObjective = "- Evade the Metropolice - Objective Failed\n- Find the rebel network - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 10 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(640, -7432, -100)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 598, 669) and YPos == math.Clamp(YPos, -7453, -7387))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-314, -7360, -100)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -360, -280) and YPos == math.Clamp(YPos, -7396, -7329))
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-132, -6848, 600)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -146, -100) and YPos == math.Clamp(YPos, -6885, -6814))
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(395, -7010, 532)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 388, 448) and YPos == math.Clamp(YPos, -7115, -6950))
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(607, -5167, 532)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 583, 628) and YPos == math.Clamp(YPos, -5180, -5128))
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(699, -3455, 404)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 657, 735) and YPos == math.Clamp(YPos, -3497, -3422))
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(77, -2399, 404)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 35, 125) and YPos == math.Clamp(YPos, -2463, -2365))
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(418, -995, 276)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 386, 447) and YPos == math.Clamp(YPos, -1024, -964))
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(488, 2613, -67)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 448, 530) and YPos == math.Clamp(YPos, 2563, 2659))
end
if CurObjMarker == 10 then
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