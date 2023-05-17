// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local SecondaryStart = false

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Ravenholm02Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
if SecondaryStart == true then
	CurObjMarker = 10
else
	CurObjMarker = 0
end
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_town_02" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

	local Alpha = Color( GetConVar("ObjFontColorR"):GetInt(), GetConVar("ObjFontColorG"):GetInt(), GetConVar("ObjFontColorB"):GetInt(), GetConVar("ObjFontColorA"):GetInt() )

	local Width = GetConVar("ObjSysTextXPos"):GetFloat()
	local Height = GetConVar("ObjSysTextYPos"):GetFloat()

	local ply = LocalPlayer()

	local XPos = math.Round(tostring(ply:GetPos().x), 0)
	local YPos = math.Round(tostring(ply:GetPos().y), 0)
	local ZPos = math.Round(tostring(ply:GetPos().z), 0) + 3

if (XPos == math.Clamp(XPos, -3806, -3720) and YPos == math.Clamp(YPos, -232, 96)) and SecondaryStart == false then
	SecondaryStart = true
end

// Start the objective stuff
	draw.DrawText( "Current Objectives:", "ObjSysBig", ScrW() * Width, ScrH() * Height, Alpha, 0 )
	draw.DrawText( "__________________", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.01), Alpha, 0 )

if !ply:Alive() then
	CurObjective = DeathObjective
else
	CurObjective = ActiveObjective
end
if GetConVar("ObjSysResetOnDeath"):GetInt() == 1 and ply:Alive() then
if CurObjective == DeathObjective then
	RunConsoleCommand("ResetObjectives", "0")
end
end

if CurObjMarker == 0 or CurObjMarker == 10 then
	ActiveObjective = "- Find a way out of Ravenholm"
	DeathObjective = "- Find a way out of Ravenholm - Objective Failed"
if SecondaryStart == false then
	CurObjMarker = 1
else
	CurObjMarker = 10
end
end

if CurObjMarker == 9 or CurObjMarker == 18 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(-1028, 803, -3428)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1056, -984) and YPos == math.Clamp(YPos, 776, 830) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-1667, 576, -3436)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1739, -1672) and YPos == math.Clamp(YPos, 502, 640) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-1986, 699, -3308)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2048, -1920) and YPos == math.Clamp(YPos, 641, 759) and ZPos == math.Clamp(ZPos, -3327, -3208) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-1788, 635, -3052)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1820, -1755) and YPos == math.Clamp(YPos, 577, 635) and ZPos == math.Clamp(ZPos, -3072, -2952) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-2812, 804, -3116)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2856, -2779) and YPos == math.Clamp(YPos, 817, 899) )
end
if CurObjMarker == 6 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3008, -2881) and YPos == math.Clamp(YPos, 844, 940) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-3117, 383, -3446)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3424, -3004) and YPos == math.Clamp(YPos, 254, 418) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-3583, -130, -3564)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3617, -3533) and YPos == math.Clamp(YPos, -193, -66) )
end
if CurObjMarker == 9 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-3677, 331, -3308)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3712, -3610) and YPos == math.Clamp(YPos, 319, 406) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-3408, 564, -3308)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3455, -3329) and YPos == math.Clamp(YPos, 514, 575) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-3259, 1342, -3500)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3351, -3217) and YPos == math.Clamp(YPos, 1281, 1553) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-4024, 1436, -3244)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4032, -3978) and YPos == math.Clamp(YPos, 1409, 1472) )
end
if CurObjMarker == 14 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4384, -4305) and YPos == math.Clamp(YPos, 1473, 1568) and ZPos == math.Clamp(ZPos, -3136, -3024) )
	CurObjSpot = Vector(-4351, 1492, -3116)
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 15 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find a way out of Ravenholm\n- Survive until the cart arrives"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 16 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4400, -4300) and YPos == math.Clamp(YPos, 1129, 1200) )
end
if CurObjMarker == 17 and ply:OnGround() then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5254, -4418) and YPos == math.Clamp(YPos, 398, 1216) )
	ActiveObjective = string.gsub(ActiveObjective, "arrives", "arrives - Objective Complete")
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 18 and ply:OnGround() then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end

if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Survive until the cart arrives %- Objective Complete", "")
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

end
end)