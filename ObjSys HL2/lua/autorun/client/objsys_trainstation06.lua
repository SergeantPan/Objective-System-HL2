// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "Trainstation06Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_trainstation_06" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = ""
	DeathObjective = "Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 13 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -9216, -9155) and YPos == math.Clamp(YPos, -3456, -3388) )
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Evade the Metropolice\n- Find the rebel network"
	DeathObjective = "- Evade the Metropolice - Objective Failed\n- Find the rebel network - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-8192, -3185, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8192, -8121) and YPos == math.Clamp(YPos, -3232, -3133) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-7996, -2815, -44)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8191, -7862) and YPos == math.Clamp(YPos, -3008, -2730) and ZPos == math.Clamp(ZPos, -64, 64) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-8485, -2929, 14)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8643, -8388) and YPos == math.Clamp(YPos, -2970, -2800) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-8727, -2862, -44)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8836, -8597) and YPos == math.Clamp(YPos, -2958, -2771) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-7639, -2360, -44)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7647, -7604) and YPos == math.Clamp(YPos, -2640, -2047) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-8223, -2212, 16)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8330, -8145) and YPos == math.Clamp(YPos, -2291, -2130) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-7967, -2139, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8053, -7927) and YPos == math.Clamp(YPos, -2184, -2105) and ZPos > 110)
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-8004, -1567, -44)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8192, -6830) and YPos == math.Clamp(YPos, -1610, -1409) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-7984, -1046, -42)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8048, -7940) and YPos == math.Clamp(YPos, -1043, -961) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-8000, -655, -108)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8062, -7937) and YPos == math.Clamp(YPos, -676, -606) )
end
if CurObjMarker == 13 then
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