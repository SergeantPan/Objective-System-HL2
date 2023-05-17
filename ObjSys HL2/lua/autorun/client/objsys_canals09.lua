// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Canals09Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_09" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	RunConsoleCommand("ResetObjectives", "1")
end
end
if !ply:Alive() then
	CurObjective = DeathObjective
else
	CurObjective = ActiveObjective
end

if CurObjMarker == 0 then
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME\n- Evade the pursuing Hunter Chopper"
	DeathObjective = "- Continue through the canals - Objective Failed\n- Evade the pursuing Hunter Chopper - Objective Failed"
	CurObjMarker = 1
end
if CurObjMarker == 12 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(7631, 10758, -460)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 7225, 8222) and YPos == math.Clamp(YPos, 10781, 11128))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(1981, 12213, -430)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 1551, 2328) and YPos == math.Clamp(YPos, 10945, 13512))
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(1081, 5816, -457)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -158, 2074) and YPos == math.Clamp(YPos, 5310, 5895))
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(2667, 512, -425)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 2713, 3082) and YPos == math.Clamp(YPos, -145, 3171))
	SubObjSpot = Vector(2637, 2663, -299)
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(9861, 1856, -353)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9313, 10142) and YPos == math.Clamp(YPos, 725, 2071))
	SubObjSpot = nil
end
if CurObjMarker == 6 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(12810, -1239, -421)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(9742, -3067, -293)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9555, 9902) and YPos == math.Clamp(YPos, -3383, -3184))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 12756, 12890) and YPos == math.Clamp(YPos, -1288, -1165))
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(9639, -8421, -292)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9490, 9683) and YPos == math.Clamp(YPos, -8631, -8347))
	SubObjSpot = nil
	SubObjTriggerSpot = nil
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(6033, -8716, -280)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 5840, 5999) and YPos == math.Clamp(YPos, -8879, -8530))
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(3915, -8688, -200)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 3551, 3828) and YPos == math.Clamp(YPos, -9245, -8156))
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-870, -8683, -380)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1030, -890) and YPos == math.Clamp(YPos, -8875, -8532))
end
if CurObjMarker == 12 then
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
if RemoveDelay < CurTime() then
	SubObjective = ""
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