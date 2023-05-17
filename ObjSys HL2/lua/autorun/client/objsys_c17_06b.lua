// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "City17_06bObj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_06b" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	if CurObjMarker == 35 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(2240, 1347, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2243, 2334) and YPos == math.Clamp(YPos, 1280, 1408) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(2623, 1499, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2558, 2616) and YPos == math.Clamp(YPos, 1426, 1568) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(2779, 1797, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2724, 2829) and YPos == math.Clamp(YPos, 1800, 1870) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(3045, 1979, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3004, 3119) and YPos == math.Clamp(YPos, 1924, 1976) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(2978, 1441, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2928, 3128) and YPos == math.Clamp(YPos, 1377, 1442) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(2916, 1021, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2866, 2967) and YPos == math.Clamp(YPos, 1024, 1152) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(2878, 1060, 84)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2880, 2929) and YPos == math.Clamp(YPos, 1016, 1113) and ZPos == math.Clamp(ZPos, 64, 184) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(3039, 1276, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2993, 3079) and YPos == math.Clamp(YPos, 1280, 1408) and ZPos == math.Clamp(ZPos, 0, 94) )
end
if CurObjMarker == 9 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3408, 3543) and YPos == math.Clamp(YPos, 1141, 1208) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(3642, 718, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3622, 3712) and YPos == math.Clamp(YPos, 648, 777) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(3685, 710, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3629, 3768) and YPos == math.Clamp(YPos, 629, 704) and ZPos == math.Clamp(ZPos, 384, 482) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(3493, 612, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3410, 3546) and YPos == math.Clamp(YPos, 528, 704) and ZPos == math.Clamp(ZPos, 256, 363) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(3577, 1223, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3505, 3647) and YPos == math.Clamp(YPos, 1216, 1300) and ZPos == math.Clamp(ZPos, 256, 354) )
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(3723, 1747, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3681, 3760) and YPos == math.Clamp(YPos, 1753, 1835) and ZPos == math.Clamp(ZPos, 256, 376) )
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(3724, 2114, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3585, 3760) and YPos == math.Clamp(YPos, 2114, 2241) and ZPos == math.Clamp(ZPos, 256, 376) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(3379, 2059, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3352, 3420) and YPos == math.Clamp(YPos, 1981, 2056) and ZPos == math.Clamp(ZPos, 192, 314) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(3379, 2059, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3331, 3468) and YPos == math.Clamp(YPos, 2112, 2238) and ZPos == math.Clamp(ZPos, 384, 509) )
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(3221, 2200, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3153, 3282) and YPos == math.Clamp(YPos, 2136, 2264) and ZPos == math.Clamp(ZPos, 256, 359) )
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(3454, 2183, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3384, 3517) and YPos == math.Clamp(YPos, 2136, 2237) and ZPos == math.Clamp(ZPos, 122, 223) )
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(3203, 2192, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3152, 3284) and YPos == math.Clamp(YPos, 2137, 2249) and ZPos == math.Clamp(ZPos, 0, 101) )
end
if CurObjMarker == 21 then
	CurObjSpot = Vector(3496, 2129, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3416, 3576) and YPos == math.Clamp(YPos, 2033, 2130) and ZPos == math.Clamp(ZPos, 1, 121) )
end
if CurObjMarker == 22 then
	CurObjSpot = Vector(3772, 1692, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3776, 3862) and YPos == math.Clamp(YPos, 1646, 1741) and ZPos == math.Clamp(ZPos, 0, 111) )
end
if CurObjMarker == 23 then
	CurObjSpot = Vector(4224, 1729, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4196, 4288) and YPos == math.Clamp(YPos, 1736, 1812) and ZPos == math.Clamp(ZPos, 128, 247) )
end
if CurObjMarker == 24 then
	CurObjSpot = Vector(4430, 1927, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4304, 4500) and YPos == math.Clamp(YPos, 1842, 1919) and ZPos == math.Clamp(ZPos, 384, 483) )
end
if CurObjMarker == 25 then
	CurObjSpot = Vector(4333, 1629, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4253, 4385) and YPos == math.Clamp(YPos, 1610, 1625) and ZPos == math.Clamp(ZPos, 384, 420) )
end
if CurObjMarker == 26 then
	CurObjSpot = Vector(3842, 1149, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3776, 3877) and YPos == math.Clamp(YPos, 1073, 1143) and ZPos == math.Clamp(ZPos, 384, 504) )
end
if CurObjMarker == 27 then
	CurObjSpot = Vector(3896, 837, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3850, 3970) and YPos == math.Clamp(YPos, 702, 956) and ZPos == math.Clamp(ZPos, 256, 376) )
end
if CurObjMarker == 28 then
	CurObjSpot = Vector(4421, 589, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4385, 4478) and YPos == math.Clamp(YPos, 555, 640) and ZPos == math.Clamp(ZPos, 256, 376) )
end
if CurObjMarker == 29 then
	CurObjSpot = Vector(4421, 589, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4423, 4527) and YPos == math.Clamp(YPos, 544, 640) and ZPos == math.Clamp(ZPos, 384, 489) )
end
if CurObjMarker == 30 then
	CurObjSpot = Vector(4624, 896, 283)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4599, 4704) and YPos == math.Clamp(YPos, 809, 1144) and ZPos == math.Clamp(ZPos, 256, 360) )
end
if CurObjMarker == 31 then
	CurObjSpot = Vector(4878, 1164, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4848, 4912) and YPos == math.Clamp(YPos, 1124, 1200) and ZPos == math.Clamp(ZPos, 256, 376) )
end
if CurObjMarker == 32 then
	CurObjSpot = Vector(4811, 1823, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4736, 4885) and YPos == math.Clamp(YPos, 1658, 1927) and ZPos == math.Clamp(ZPos, 128, 248) )
end
if CurObjMarker == 33 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(5309, 1388, 89)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 34 then
	CurObjSpot = Vector(5030, 1520, 84)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5032, 5087) and YPos == math.Clamp(YPos, 1488, 1584) and ZPos == math.Clamp(ZPos, 64, 183) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 4906, 5070) and YPos == math.Clamp(YPos, 1280, 1416) and ZPos == math.Clamp(ZPos, 64, 178) )
end
if CurObjMarker == 35 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
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