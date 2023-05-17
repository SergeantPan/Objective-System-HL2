// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Canals01aObj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_01a" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
if CurObjMarker == 15 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )


// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(935, 3994, -71)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 870, 960) and YPos == math.Clamp(YPos, 3956, 4039))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(749, 5101, -64)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 700, 779) and YPos == math.Clamp(YPos, 5055, 5149))
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = nil
	ActiveObjective = string.gsub(ActiveObjective, "network", "network - Objective Complete")
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(1251, 5869, -75)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 1184, 1310) and YPos == math.Clamp(YPos, 5824, 5895))
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(2077, 6434, 52)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 2001, 2093) and YPos == math.Clamp(YPos, 6401, 6464))
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(244, 6433, -44)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 217, 275) and YPos == math.Clamp(YPos, 6384, 6464))
end
if CurObjMarker == 7 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(118, 6043, -63)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-1600, 5904, -28)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1649, -1539) and YPos == math.Clamp(YPos, 5839, 5951))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 91, 232) and YPos == math.Clamp(YPos, 5971, 6121))
end
if CurObjMarker == 9 then
	CurObjTriggerSpot = nil
	ActiveObjective = string.gsub(ActiveObjective, "canals", "canals\n>There may be other rebel hideouts ahead")
	CurObjMarker = CurObjMarker + 1
	SubObjSpot = nil
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-2438, 4709, -27)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2478, -2385) and YPos == math.Clamp(YPos, 4734, 4841))
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-2907, 6077, -67)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2961, -2876) and YPos == math.Clamp(YPos, 5979, 6147))
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-2848, 7417, 80)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2927, -2752) and YPos == math.Clamp(YPos, 7359, 7443))
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-2844, 8784, 69)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2928, -2771) and YPos == math.Clamp(YPos, 8747, 8832))
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-3575, 9310, 89)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -3599, -3551) and YPos == math.Clamp(YPos, 9265, 9344))
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(-5134, 9215, 39)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -5212, -5117) and YPos == math.Clamp(YPos, 9170, 9268))
end
if CurObjMarker == 16 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = "- Evade the Metropolice\n- Continue through the canals"
	DeathObjective = "- Evade the Metropolice - Objective Failed\n- Continue through the canals - Objective Failed"
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