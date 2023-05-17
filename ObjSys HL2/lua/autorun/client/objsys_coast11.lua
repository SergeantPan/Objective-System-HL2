// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local SubObjective = ""
	local CurObjMarker = 0
	local LazloNoMore = false
	local NoStanleyObjective = false
	local GuardianDead = false

	local RemoveDelay = math.huge
	local ObjectiveDelay = math.huge

hook.Add("HUDPaint", "Canals11Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjective = ""
	SubObjSpot = nil
	LazloNoMore = false
	NoStanleyObjective = false
	GuardianDead = false
	RemoveDelay = math.huge
	ObjectiveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_coast_11" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Reach Nova Prospekt"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 29 then // Final number
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

if CurObjMarker != 24 and (XPos == math.Clamp(XPos, 3480, 4889) and YPos == math.Clamp(YPos, 6091, 6284)) then
	CurObjMarker = 24
end

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(3412, -8788, 1580)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3211, 3860) and YPos == math.Clamp(YPos, -8834, -8827) )
end
if CurObjMarker == 2 then
	ActiveObjective = "- Reach Nova Prospekt\n- Help the injured Rebels"
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
for _,Lazlo in pairs(ents.FindByClass("prop_ragdoll")) do
if Lazlo:GetModel() == "models/humans/group02/male_05.mdl" then
	ActiveObjective = "- Reach Nova Prospekt\n- Help the injured Rebels - Objective Failed"
	LazloNoMore = true
	CurObjMarker = CurObjMarker + 1
	RemoveDelay = CurTime() + 5
end
if Lazlo:GetModel() == "models/humans/group02/male_07.mdl" then
	NoStanleyObjective = true
end
end
end
if CurObjMarker == 4 and RemoveDelay < CurTime() and LazloNoMore == true then
	CurObjSpot = Vector(1855, -6293, 1484)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1774, 2071) and YPos == math.Clamp(YPos, -6371, -6173) )
if NoStanleyObjective == false then
	ObjectiveDelay = CurTime() + 10
	NoStanleyObjective = true
end
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(1872, -5312, 1398)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1766, 2002) and YPos == math.Clamp(YPos, -5409, -5239) )
	SubObjSpot = Vector(876, -4922, 1215)
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(1390, -4578, 1211)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1248, 1547) and YPos == math.Clamp(YPos, -4781, -4446) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(1975, -3899, 1116)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1786, 2168) and YPos == math.Clamp(YPos, -4040, -3717) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(2632, -2880, 838)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2491, 2788) and YPos == math.Clamp(YPos, -3132, -2825) )
	SubObjSpot = nil
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(2849, -1712, 692)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2642, 3048) and YPos == math.Clamp(YPos, -1805, -1563) )
end
if CurObjMarker == 10 then
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
	SubObjSpot = Vector(1848, -1109, 541)
	SubObjective = "\n- Recover the stash inside the cave"
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(3517, -426, 634)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3343, 3696) and YPos == math.Clamp(YPos, -635, -267) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 1718, 1958) and YPos == math.Clamp(YPos, -1222, -1020) )
end
if CurObjMarker == 12 then
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
	SubObjSpot = nil
	SubObjective = string.gsub(SubObjective, "cave", "cave - Objective Failed")
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(4735, -305, 565)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4600, 4927) and YPos == math.Clamp(YPos, -523, -152) )
end
if CurObjMarker == 14 then
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
	SubObjSpot = Vector(6220, -1318, 416)
	SubObjective = SubObjective .. "\n- Recover the stash at the pier"
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(4725, 623, 508)	
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4569, 4987) and YPos == math.Clamp(YPos, 445, 768) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 6135, 6312) and YPos == math.Clamp(YPos, -1319, -1232) )
end
if CurObjMarker == 16 then
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
	SubObjSpot = Vector(3323, 814, 815)
	SubObjective = string.gsub(SubObjective, "pier", "pier - Objective Failed")
	RemoveDelay = CurTime() + 5
	SubObjective = SubObjective .. "\n- There's a stash up there"
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(3353, 1408, 595)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3216, 3497) and YPos == math.Clamp(YPos, 1245, 1516) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 3194, 3437) and YPos == math.Clamp(YPos, 680, 889) )
end
if CurObjMarker == 18 then
	SubObjective = string.gsub(SubObjective, "up there", "up there - Objective Failed")
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
	CurObjTriggerSpot = nil
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(3427, 3259, 602)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2756, 3585) and YPos == math.Clamp(YPos, 3127, 3642) )
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(4707, 3545, 531)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4372, 5106) and YPos == math.Clamp(YPos, 3255, 3844) )
end
if CurObjMarker == 21 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(6087, 3603, 126)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 22 then
	CurObjSpot = Vector(4748, 4078, 373)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4437, 4954) and YPos == math.Clamp(YPos, 3874, 4374) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 5940, 6340) and YPos == math.Clamp(YPos, 3337, 3797) )
end
if CurObjMarker == 23 then
	CurObjSpot = Vector(4109, 6214, 567)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3480, 4889) and YPos == math.Clamp(YPos, 6091, 6284) )
end
if CurObjMarker == 24 then
	CurObjSpot = Vector(4606, 7248, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4165, 5110) and YPos == math.Clamp(YPos, 7185, 7270) )
end
if CurObjMarker == 25 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = ActiveObjective .. "\n- Kill the Antlion Guardian"
	DeathObjective = DeathObjective .. "\n- Kill the Antlion Guardian - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 26 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
for _,Guardian in pairs(ents.FindByClass("prop_ragdoll")) do
if Guardian:GetModel() == "models/antlion_guard.mdl" and GuardianDead == false then
	ActiveObjective = string.gsub(ActiveObjective, "Guardian", "Guardian - Objective Complete")
	ActiveObjective = string.gsub(ActiveObjective, "Camp", "Camp - Objective Complete")
	CurObjMarker = CurObjMarker + 1
	GuardianDead = true
	RemoveDelay = CurTime() + 5
end
end
end
if CurObjMarker == 27 and RemoveDelay < CurTime() then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 753, 834) and YPos == math.Clamp(YPos, 11465, 11608) )
if ply:HasWeapon("weapon_bugbait") == true then
	ActiveObjective = "- Reach Nova Prospekt\n- Follow the Vortigaunt"
end
end
if CurObjMarker == 28 then
for _,Log in pairs( ents.FindByClass("prop_dynamic") ) do
if Log:GetModel() == "models/props_foliage/driftwood_01a.mdl" and Log:GetPos().z > 303 and CurObjMarker == 28 then
	CurObjMarker = CurObjMarker + 1
end
end
	CurObjTriggerSpot = nil
	ActiveObjective = "- Reach Nova Prospekt\n- Learn how to use Bugbaits"
end
if CurObjMarker == 29 then
	CurObjTriggerSpot = nil
end

if ObjectiveDelay < CurTime() then
	ActiveObjective = "- Reach Nova Prospekt\n- Find the Vortigaunt Camp"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Find the Vortigaunt Camp - Objective Failed"
	ObjectiveDelay = math.huge
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjective = string.gsub(SubObjective, "cave", "cave - Objective Complete")
	SubObjective = string.gsub(SubObjective, "pier", "pier - Objective Complete")
	SubObjective = string.gsub(SubObjective, "up there", "up there - Objective Complete")
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
if RemoveDelay < CurTime() then
	SubObjective = string.gsub(SubObjective, "%\n%- Recover the stash inside the cave %- Objective Failed", "")
	SubObjective = string.gsub(SubObjective, "%\n%- Recover the stash inside the cave %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- Recover the stash at the pier %- Objective Failed", "")
	SubObjective = string.gsub(SubObjective, "%\n%- Recover the stash at the pier %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- There's a stash up there %- Objective Failed", "")
	SubObjective = string.gsub(SubObjective, "%\n%- There's a stash up there %- Objective Complete", "")
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Help the injured Rebels %- Objective Failed", "" )
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Kill the Antlion Guardian %- Objective Complete", "" )
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Find the Vortigaunt Camp %- Objective Complete", "" )
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