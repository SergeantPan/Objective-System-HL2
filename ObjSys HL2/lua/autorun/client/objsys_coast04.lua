// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local SubObjective = ""
	local CurObjMarker = 0
	local GunshipDead = false

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Coast04Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	SubObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	GunshipDead = false
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_coast_04" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
if !ply:Alive() or (CurObjMarker >= 21 and ZPos < 720) then
	CurObjective = DeathObjective
else
	CurObjective = ActiveObjective
end

if CurObjMarker == 0 then
	ActiveObjective = "- Reach Nova Prospekt"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 27 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

if SubObjective != "" then
	draw.DrawText( "Side Objectives:", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.15), Alpha, 0 )
	draw.DrawText( "__________________", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.16), Alpha, 0 )
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )
	draw.DrawText( SubObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.17), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(-8366, -511, 185)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8455, -8146) and YPos == math.Clamp(YPos, -836, -167) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-1800, -542, 49)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1870, -1685) and YPos == math.Clamp(YPos, -768, 1674) )
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(3216, -1474, 79)
	SubObjective = "\n- Enable the Thumper\n>It should help repel the Antlions"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(2861, -1378, 82)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2775, 2914) and YPos == math.Clamp(YPos, -1608, -1343) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 3113, 3303) and YPos == math.Clamp(YPos, -1619, -1450) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(2373, -2367, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2114, 2409) and YPos == math.Clamp(YPos, -2432, -2320) and ZPos > 200)
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 3113, 3303) and YPos == math.Clamp(YPos, -1619, -1450) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(2214, -2849, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2159, 2259) and YPos == math.Clamp(YPos, -2878, -2817) and ZPos > 350)
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 3113, 3303) and YPos == math.Clamp(YPos, -1619, -1450) )
end
if CurObjMarker == 7 then
	ActiveObjective = "- Reach Nova Prospekt\n- Use the crane to lower the bridge"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Use the crane to lower the bridge - Objective Failed"
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(4088, -2941, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4088, 4161) and YPos == math.Clamp(YPos, -3072, -2241) and ZPos > 350)
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 3113, 3303) and YPos == math.Clamp(YPos, -1619, -1450) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(4346, -1913, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4145, 4560) and YPos == math.Clamp(YPos, -1935, -1857) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 3113, 3303) and YPos == math.Clamp(YPos, -1619, -1450) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(4480, -1653, 692)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4299, 4542) and YPos == math.Clamp(YPos, -1708, -1538) and ZPos > 650)
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 3113, 3303) and YPos == math.Clamp(YPos, -1619, -1450) )
end
if CurObjMarker == 11 then
	CurObjTriggerSpot = nil
	SubObjSpot = nil
	ActiveObjective = "- Reach Nova Prospekt\n- Use the crane to lower the bridge - Objective Complete"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed"
	SubObjective = string.gsub(SubObjective, "Thumper%\n%>It should help repel the Antlions", "Thumper - Objective Failed")
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(5063, -2685, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4969, 6054) and YPos == math.Clamp(YPos, -2832, -2477) and ZPos > 350 )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(5886, -3519, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5348, 5637) and YPos == math.Clamp(YPos, -3019, -2888) )
end
if CurObjMarker == 14 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5744, 5880) and YPos == math.Clamp(YPos, -4600, -4420) )
	SubObjSpot = Vector(5807, -4420, 483)
end
if CurObjMarker == 15 then
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed"
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5889, 5972) and YPos == math.Clamp(YPos, -3659, -3387) )
	SubObjSpot = nil
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(6051, -4611, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5889, 6212) and YPos == math.Clamp(YPos, -4677, -4566) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(4923, -5651, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4672, 4919) and YPos == math.Clamp(YPos, -5956, -5332) )
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(4174, -5654, 660)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4168, 4231) and YPos == math.Clamp(YPos, -5801, -5457) )
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(2225, -4826, 564)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1440, 2396) and YPos == math.Clamp(YPos, -5322, -4640) )
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(-1145, -2682, 1044)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2098, -680) and YPos == math.Clamp(YPos, -2893, -1194) )
end
if CurObjMarker == 21 then
	CurObjSpot = Vector(-1824, 590, 1045)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2061, -1549) and YPos == math.Clamp(YPos, 451, 757) )
end
if CurObjMarker == 22 then
	CurObjSpot = Vector(-1823, 1780, 948)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2047, -1608) and YPos == math.Clamp(YPos, 1523, 1963) )
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed\n- Destroy the Gunship - Objective Failed"
end
if CurObjMarker == 23 then
	CurObjSpot = Vector(482, 2721, 1044)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 453, 657) and YPos == math.Clamp(YPos, 2200, 3071) )
end
if CurObjMarker == 24 then
	CurObjSpot = Vector(2156, 2827, 1044)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2034, 2588) and YPos == math.Clamp(YPos, 2229, 3057) )
end
if CurObjMarker == 25 then
	CurObjSpot = Vector(2548, 5107, 1044)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2026, 2855) and YPos == math.Clamp(YPos, 4970, 5070) )
end
if CurObjMarker == 26 then
	CurObjSpot = Vector(2329, 9778, 1638)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2049, 2915) and YPos == math.Clamp(YPos, 9546, 9960) )
end
if CurObjMarker == 27 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

for _,Gunship in pairs(ents.FindByClass("npc_combinegunship")) do
if CurObjMarker > 20 and GunshipDead == false then
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Destroy the Gunship"
end
end

for _,GunshipBody in pairs(ents.FindByClass("prop_physics")) do
if GunshipBody:GetModel() == "models/gibs/gunship_gibs_midsection.mdl" and GunshipDead == false and CurObjMarker > 20 then
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Destroy the Gunship - Objective Complete"
	GunshipDead = true
	RemoveDelay = CurTime() + 5
end
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjective = string.gsub(SubObjective, "Thumper%\n%>It should help repel the Antlions", "Thumper - Objective Complete")
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
if RemoveDelay < CurTime() then
	SubObjective = ""
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Use the crane to lower the bridge %- Objective Complete", "")
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Destroy the Gunship %- Objective Complete", "")
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