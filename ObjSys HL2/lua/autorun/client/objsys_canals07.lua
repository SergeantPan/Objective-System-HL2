// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Canals07Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_07" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
if CurObjMarker == 17 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(12325, 6085, -440)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 11344, 13165) and YPos == math.Clamp(YPos, 6023, 6153))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(7780, 1024, -492)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 10888, 11550) and YPos == math.Clamp(YPos, 683, 1470))
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME\n- Find a way to open the gates"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(11264, 2079, -236)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 11173, 11255) and YPos == math.Clamp(YPos, 2050, 2111))
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(9725, 2046, -236)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9681, 10112) and YPos == math.Clamp(YPos, 1977, 2032))
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(9648, 1696, -204)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9559, 9632) and YPos == math.Clamp(YPos, 1648, 1744))
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(7688, 1727, -204)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 7583, 7678) and YPos == math.Clamp(YPos, 1658, 1776))
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(7339, 1419, -236)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 7313, 7381) and YPos == math.Clamp(YPos, 1284, 1407))
end
if CurObjMarker == 9 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME\n- Find a way to open the gates - Objective Complete"

	SubObjSpot = Vector(6831, 1313, -269)
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(7675, 1024, -492)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 7580, 7721) and YPos == math.Clamp(YPos, 836, 1213))
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(5127, -3590, -476)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4093, 6262) and YPos == math.Clamp(YPos, -4023, -3596))
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(4216, -7672, -1004)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4005, 4104) and YPos == math.Clamp(YPos, -8192, -7104))
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(741, -6660, -980)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 577, 756) and YPos == math.Clamp(YPos, -7168, -6144))
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-2338, -7683, -948)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2563, -2405) and YPos == math.Clamp(YPos, -8192, -7168))
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(-9870, -12306, -950)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -10371, -10073) and YPos == math.Clamp(YPos, -13434, -11641))
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(-10729, -5063, -971)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -11251, -10233) and YPos == math.Clamp(YPos, -4988, -4719))
end
if CurObjMarker == 17 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end
if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME"
	SubObjSpot = nil
	RemoveDelay = math.huge
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