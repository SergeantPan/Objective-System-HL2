// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Canals08Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_08" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME"
	DeathObjective = "- Continue through the canals - Objective Failed"
	CurObjMarker = 1
end
if CurObjMarker == 24 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(9794, -10563, -415)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9465, 10176) and YPos == math.Clamp(YPos, -10543, -10336))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(9810, -6799, -447)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9472, 10176) and YPos == math.Clamp(YPos, -6778, -6564))
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(2396, -4098, -579)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 2265, 2530) and YPos == math.Clamp(YPos, -4608, -3489))
end
if CurObjMarker == 4 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME\n- Find a way to open the gates"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-507, -57, -556)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -606, -526) and YPos == math.Clamp(YPos, -111, -16))
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-227, -1440, -556)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos,-295, -228) and YPos == math.Clamp(YPos, -1472, -1408))
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-659, -2342, -364)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -784, -599) and YPos == math.Clamp(YPos, -2420, -2230))
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-974, -1145, -364)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1109, -913) and YPos == math.Clamp(YPos, -1268, -1026))
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-1351, -1384, -364)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos,-1432, -1349) and YPos == math.Clamp(YPos, -1448, -1316))
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-1990, -910, -236)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1988, -1861) and YPos == math.Clamp(YPos, -942, -815))
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-2303, -1830, -232)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2363, -2244) and YPos == math.Clamp(YPos, -1926, -1832))
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-2252, -2731, -172)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2309, -2192) and YPos == math.Clamp(YPos, -2819, -2736) and ZPos > -200)
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-2177, -2848, -364)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2192, -2096) and YPos == math.Clamp(YPos, -2905, -2792) and ZPos < -300)
end
if CurObjMarker == 14 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-2622, -3281, -360)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(-1219, -3358, -364)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1343, -1087) and YPos == math.Clamp(YPos, -3579, -3368))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -2661, -2513) and YPos == math.Clamp(YPos, -3328, -3230))
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(-129, -3563, -220)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -168, -87) and YPos == math.Clamp(YPos, -3623, -3553))
	SubObjTriggerSpot = nil
	SubObjSpot = Vector(-200, -3623, -172)
end
if CurObjMarker == 17 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = string.gsub(ActiveObjective, "gates", "gates - Objective Complete")
	CurObjMarker = CurObjMarker + 1
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 18 and RemoveDelay < CurTime() then
	CurObjSpot = Vector(-1572, -4095, -610)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1939, -1730) and YPos == math.Clamp(YPos, -4495, -3694))
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME"
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(-6248, -3088, -548)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -6528, -5952) and YPos == math.Clamp(YPos, -3137, -2829))
	SubObjSpot = Vector( -6838, 672, -597 )
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -6889, -6784) and YPos == math.Clamp(YPos, 577, 731))
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(-6194, 770, -642)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -6526, -5956) and YPos == math.Clamp(YPos, 458, 1032))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -6889, -6784) and YPos == math.Clamp(YPos, 577, 731))
end
if CurObjMarker == 21 then
	CurObjSpot = Vector(-9350, 3031, -610)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -9427, -9020) and YPos == math.Clamp(YPos, 2662, 3712))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -6889, -6784) and YPos == math.Clamp(YPos, 577, 731))
end
if CurObjMarker == 22 then
	CurObjSpot = Vector(-6275, 5201, -537)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -6445, -6098) and YPos == math.Clamp(YPos, 5265, 5538))
	SubObjSpot = nil
	SubObjTriggerSpot = nil
end
if CurObjMarker == 23 then
	CurObjSpot = Vector(-8221, 7258, -555)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -8460, -8283) and YPos == math.Clamp(YPos, 7089, 7441))
end
if CurObjMarker == 24 then
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