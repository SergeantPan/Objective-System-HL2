// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge
	local DestroyTheGen = false

hook.Add("HUDPaint", "City17_07Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	DestroyTheGen = false
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_07" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	BaseObjective = "- Find Barney\n- Assault the Citadel"
	DeathObjective = "- Find Barney - Objective Failed\n- Assault the Citadel - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 20 then // Final number
	BaseObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker > 4 then
for _,AlyxAlive in pairs(ents.FindByClass( "npc_alyx" )) do
	AlyxHP = (AlyxAlive:Health() / AlyxAlive:GetMaxHealth()) * 100
	AlyxAliveCheck = AlyxAlive
if GetConVar("ObjSysNoNPCMarker"):GetInt() == 0 and CurObjMarker > 4 and CurObjMarker < 18 then
	SubObjSpot = AlyxAlive:EyePos() + Vector(0,0,10)
else
	SubObjSpot = nil
end
end
if IsValid(AlyxAliveCheck) and CurObjMarker < 16 then
	AlyxObjective = "\n- Keep Alyx alive - HP: " .. AlyxHP .. " %"
elseif !IsValid(AlyxAliveCheck) then
	AlyxObjective = "\n- Keep Alyx alive - Objective Failed"
end
end

if CurObjMarker > 4 and CurObjMarker < 18 then
ActiveObjective = BaseObjective .. AlyxObjective
else
ActiveObjective = BaseObjective
end

if CurObjMarker == 1 then
	CurObjSpot = Vector(4675, 1212, 300)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4632, 4727) and YPos == math.Clamp(YPos, 1147, 1272) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(4487, 861, 300)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4224, 4535) and YPos == math.Clamp(YPos, 729, 960) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(4391, 834, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4160, 4624) and YPos == math.Clamp(YPos, 728, 951) and ZPos < 260)
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(4578, 724, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4546, 4617) and YPos == math.Clamp(YPos, 624, 719) )
end
if CurObjMarker == 5 then
	CurObjTriggerSpot = nil
	BaseObjective = "- Find Barney\n- Assault the Citadel\n- Attack the Command Center"
	DeathObjective = "- Find Barney - Objective Failed\n- Assault the Citadel - Objective Failed\n- Attack the Command Center - Objective Failed\n- Keep Alyx alive - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(4681, 1664, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4608, 4728) and YPos == math.Clamp(YPos, 1672, 1723) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(4777, 1975, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4714, 4784) and YPos == math.Clamp(YPos, 1939, 2008) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(4688, 1617, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4633, 4721) and YPos == math.Clamp(YPos, 1566, 1664) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(4861, 1459, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4738, 4943) and YPos == math.Clamp(YPos, 1330, 1557) )
end
if CurObjMarker == 10 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	BaseObjective = "- Find Barney\n- Assault the Citadel\n- Attack the Command Center - Objective Complete"
	DeathObjective = "- Find Barney - Objective Failed\n- Assault the Citadel - Objective Failed\n- Keep Alyx alive - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 11 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4846, 4957) and YPos == math.Clamp(YPos, 920, 1015) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(5368, 1045, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5320, 5431) and YPos == math.Clamp(YPos, 1048, 1119) )
	BaseObjective = "- Find Barney\n- Assault the Citadel\n- Disable the generator in the square"
	DeathObjective = "- Find Barney - Objective Failed\n- Assault the Citadel - Objective Failed\n- Disable the generator in the square - Objective Failed\n- Keep Alyx alive - Objective Failed"
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(5532, 1409, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5501, 5564) and YPos == math.Clamp(YPos, 1368, 1456) )
end
if CurObjMarker == 14 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
for _,EnergyBall in pairs(ents.FindByClass("prop_combine_ball")) do
	EnergyDestroy = EnergyBall
if IsValid(EnergyBall) then
	DestroyTheGen = true
end
end
if !IsValid(EnergyDestroy) and DestroyTheGen == true then
	CurObjMarker = CurObjMarker + 1
end
end
if CurObjMarker == 15 then
	BaseObjective = "- Find Barney\n- Assault the Citadel\n- Disable the generator in the square - Objective Complete"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(7331, 1543, 16)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7331, 7486) and YPos == math.Clamp(YPos, 1280, 1792) )
end
if CurObjMarker == 17 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
if !IsValid(AlyxAliveCheck) then
	BaseObjective = "- Find Barney\n- Assault the Citadel\n- Keep Alyx alive - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(8838, 2625, -232)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8823, 8909) and YPos == math.Clamp(YPos, 2576, 2672) )
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(10150, 2628, -492)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 10112, 10208) and YPos == math.Clamp(YPos, 2562, 2704) )
end
if CurObjMarker == 20 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	BaseObjective = string.gsub(BaseObjective, "%\n%- Attack the Command Center %- Objective Complete", "")
	BaseObjective = string.gsub(BaseObjective, "%\n%- Disable the generator in the square %- Objective Complete", "")
	BaseObjective = string.gsub(BaseObjective, "%\n%- Keep Alyx alive %- Objective Failed", "")
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