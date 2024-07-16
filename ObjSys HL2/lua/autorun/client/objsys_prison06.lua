// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge
	local EliFound = false

hook.Add("HUDPaint", "Prison06Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	EliFound = false
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_prison_06" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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

if CurObjMarker == math.Clamp(CurObjMarker, 8, 16) then
for _,AlyxAlive in pairs(ents.FindByClass( "npc_alyx" )) do
	AlyxHP = (AlyxAlive:Health() / AlyxAlive:GetMaxHealth()) * 100
	AlyxAliveCheck = AlyxAlive
if GetConVar("ObjSysNoNPCMarker"):GetInt() == 0 and CurObjMarker < 6 then
	SubObjSpot = AlyxAlive:EyePos() + Vector(0,0,10)
else
	SubObjSpot = nil
end
end
if IsValid(AlyxAliveCheck) then
	ActiveObjective = "- Find Eli\n- Keep Alyx Alive - HP: " .. AlyxHP .. " %"
else
	ActiveObjective = "- Find Eli\n- Keep Alyx Alive - Objective Failed"
end
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
	ActiveObjective = "- Find Alyx\n- Find Eli"
	DeathObjective = "- Find Alyx - Objective Failed\n- Find Eli - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 32 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(1973, 1187, -529)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1920, 2045) and YPos == math.Clamp(YPos, 1029, 1263) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(2000, 528, -556)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1946, 2078) and YPos == math.Clamp(YPos, 416, 585) )
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find Alyx - Objective Complete\n- Find Eli"
	DeathObjective = "- Find Eli - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(2056, 110, -684)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1978, 2132) and YPos == math.Clamp(YPos, 53, 160) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(1146, 109, -684)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1079, 1215) and YPos == math.Clamp(YPos, 52, 169) )
end
if CurObjMarker == 6 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 984, 1116) and YPos == math.Clamp(YPos, 416, 541) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(1555, 679, -686)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1482, 1619) and YPos == math.Clamp(YPos, 602, 755) )
end
if CurObjMarker == 8 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1482, 1619) and YPos == math.Clamp(YPos, 602, 755) and ZPos > -300)
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(938, 554, -172)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 875, 983) and YPos == math.Clamp(YPos, 505, 549) )
	DeathObjective = "- Find Eli - Objective Failed\n- Keep Alyx Alive - Objective Failed"
end
if CurObjMarker == 10 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 658, 717) and YPos == math.Clamp(YPos, 560, 752) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(56, 760, -172)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8, 104) and YPos == math.Clamp(YPos, 769, 835) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-93, 1012, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -122, -81) and YPos == math.Clamp(YPos, 962, 1064) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(313, 328, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 216, 408) and YPos == math.Clamp(YPos, 261, 345) )
end
if CurObjMarker == 14 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 412, 452) and YPos == math.Clamp(YPos, 66, 171) )
end
if CurObjMarker == 15 then
	CurObjTriggerSpot = nil
for _,EliSpot in pairs(ents.FindByClass("npc_eli")) do
	EliX = EliSpot:GetPos().x
	EliY = EliSpot:GetPos().y
if (EliX == math.Clamp(EliX, 657, 701) and EliY == math.Clamp(EliY, 76, 137)) then
	ActiveObjective = string.gsub(ActiveObjective, "Eli", "Eli - Objective Complete")
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 16 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 334, 391) and YPos == math.Clamp(YPos, 36, 177) )
end
if CurObjMarker == 17 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Fight your way to the Combine Teleporter\n- Use the teleporter to escape Nova Prospekt"
	DeathObjective = "- Fight your way to the Combine Teleporter - Objective Failed\n- Use the teleporter to escape Nova Prospekt - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 18 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 264, 360) and YPos == math.Clamp(YPos, -187, -128) )
end
if CurObjMarker == 19 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(371, -523, -12)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(315, -820, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 264, 347) and YPos == math.Clamp(YPos, -892, -832) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 376, 448) and YPos == math.Clamp(YPos, -623, -488) )
end
if CurObjMarker == 21 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 866, 904) and YPos == math.Clamp(YPos, -1184, -1104) )
	SubObjSpot = nil
end
if CurObjMarker == 22 then
	SubObjSpot = Vector(900, -1145, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 905, 956) and YPos == math.Clamp(YPos, -1164, -1124) )
end
if CurObjMarker == 23 then
	SubObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1160, 1200) and YPos == math.Clamp(YPos, -1364, -1324) )
end
if CurObjMarker == 24 then
	CurObjSpot = Vector(1177, -1951, -220)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1123, 1294) and YPos == math.Clamp(YPos, -2089, -1857) )
end
if CurObjMarker == 25 then
	CurObjSpot = Vector(1775, -1974, -220)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1692, 1959) and YPos == math.Clamp(YPos, -2120, -1856) )
end
if CurObjMarker == 26 then
	CurObjSpot = Vector(1560, -2419, -220)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1508, 1605) and YPos == math.Clamp(YPos, -2544, -2320) )
end
if CurObjMarker == 27 then
	CurObjSpot = Vector(952, -2547, -220)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 912, 996) and YPos == math.Clamp(YPos, -2600, -2532) )
end
if CurObjMarker == 28 then
	CurObjSpot = Vector(1038, -3163, -220)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1163, 1264) and YPos == math.Clamp(YPos, -2929, -2880) )
end
if CurObjMarker == 29 then
	SubObjSpot = Vector(980, -2904, -166)
	CurObjTriggerSpot = nil
for _,Shield in pairs(ents.FindByClass("prop_dynamic")) do
	if Shield:GetModel() == "models/props_combine/combine_fence01a.mdl" and Shield:GetSkin() == 1 then
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 30 then
	SubObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 939, 1051) and YPos == math.Clamp(YPos, -3312, -3056) )
end
if CurObjMarker == 31 then
	CurObjSpot = Vector(698, -2895, -220)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 624, 768) and YPos == math.Clamp(YPos, -2891, -2801) )
end
if CurObjMarker == 32 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = nil
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Find Alyx %- Objective Complete%\n", "")
	ActiveObjective = string.gsub(ActiveObjective, "%- Find Eli %- Objective Complete%\n", "")
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