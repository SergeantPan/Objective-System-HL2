// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local GunshipActive = false
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "City17_11Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	GunshipActive = false
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_11" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Assault the Citadel"
	DeathObjective = "- Assault the Citadel - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 12 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

for _,GunshipBattle in pairs( ents.FindByClass("npc_combinegunship")) do
	if IsValid(GunshipBattle) then
GunshipAlive = GunshipBattle
end
end

if IsValid(GunshipAlive) and GunshipActive == false then
	GunshipActive = true
	ActiveObjective = ActiveObjective .. "\n- Destroy the Gunship"
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Fight across the rooftops - Objective Failed\n- Destroy the Gunship - Objective Failed"

end
if !IsValid(GunshipAlive) and GunshipActive == true then
	GunshipActive = false
	ActiveObjective = string.gsub(ActiveObjective, "Gunship", "Gunship - Objective Complete")
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Fight across the rooftops - Objective Failed"
	RemoveDelay = CurTime() + 5
end

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(894, 7854, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 904, 959) and YPos == math.Clamp(YPos, 7816, 7891) )
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Assault the Citadel\n- Fight across the rooftops"
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Fight across the rooftops - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(775, 6789, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 656, 862) and YPos == math.Clamp(YPos, 6658, 6811) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(1378, 6288, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1280, 1790) and YPos == math.Clamp(YPos, 6219, 6311) )
end
if CurObjMarker == 5 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 853, 972) and YPos == math.Clamp(YPos, 5966, 6061) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(803, 5338, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 418, 862) and YPos == math.Clamp(YPos, 5273, 5379) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(1345, 4647, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1255, 1522) and YPos == math.Clamp(YPos, 4644, 4860) )
end
if CurObjMarker == 8 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(1448, 4674, 1015)
for _,Fence in pairs(ents.FindByClass("func_door")) do
if Fence:GetPos().z > 1110 then
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(1345, 4647, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1301, 1410) and YPos == math.Clamp(YPos, 3633, 4640) )
	SubObjSpot = nil
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(1275, 3359, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1207, 1264) and YPos == math.Clamp(YPos, 3136, 3456) )
end
if CurObjMarker == 11 then
	ActiveObjective = "- Assault the Citadel\n- Fight across the rooftops - Objective Complete"
	DeathObjective = "- Assault the Citadel - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 12 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Destroy the Gunship %- Objective Complete", "")
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Fight across the rooftops %- Objective Complete", "")
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