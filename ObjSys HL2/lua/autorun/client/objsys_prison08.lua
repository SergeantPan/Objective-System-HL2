// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local WaveStarted = false
	local TeleStolen = false
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Prison08Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	WaveStarted = false
	RemoveDelay = math.huge
	TeleStolen = false
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_prison_08" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Fight your way to the Combine Teleporter\n- Use the teleporter to escape Nova Prospekt\n- Find and confront Dr. Mossman"
	DeathObjective = "- Fight your way to the Combine Teleporter - Objective Failed\n- Use the teleporter to escape Nova Prospekt - Objective Failed\n- Find and confront Dr. Mossman - Objective Failed"
	CurObjMarker = 1
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == (3 or 4) then
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
	ActiveObjective = "- Fight your way to the Combine Teleporter\n- Keep Alyx Alive - HP: " .. AlyxHP .. " %\n- Use the teleporter to escape Nova Prospekt\n- Find and confront Dr. Mossman"
elseif !IsValid(AlyxAliveCheck) then
	ActiveObjective = "- Fight your way to the Combine Teleporter\n- Keep Alyx Alive - Objective Failed\n- Use the teleporter to escape Nova Prospekt\n- Find and confront Dr. Mossman"
end
end

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(-2145, 2924, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2240, -2064) and YPos == math.Clamp(YPos, 2901, 2955) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-2112, 1605, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2240, -2032) and YPos == math.Clamp(YPos, 2592, 2624) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-2112, 1605, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2496, -1792) and YPos == math.Clamp(YPos, 1588, 1632) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-1705, 1177, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1748, -1669) and YPos == math.Clamp(YPos, 1128, 1256) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-1156, 1586, 1108)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1174, -1089) and YPos == math.Clamp(YPos, 1472, 1655) )
	ActiveObjective = "- Fight your way to the Combine Teleporter\n- Use the teleporter to escape Nova Prospekt\n- Find and confront Dr. Mossman"
	DeathObjective = "- Fight your way to the Combine Teleporter - Objective Failed\n- Use the teleporter to escape Nova Prospekt - Objective Failed\n- Find and confront Dr. Mossman - Objective Failed"
	SubObjSpot = nil
end
if CurObjMarker == 6 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -495, -289) and YPos == math.Clamp(YPos, 622, 671) )
end
if CurObjMarker == 7 then
	CurObjTriggerSpot = nil
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Find and confront Dr. Mossman", "\n- Find and confront Dr. Mossman - Objective Complete")
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -255, -161) and YPos == math.Clamp(YPos, 503, 647) )
end
if CurObjMarker == 9 then
	CurObjTriggerSpot = nil
	ActiveObjective = string.gsub(ActiveObjective, "%- Fight your way to the Combine Teleporter%\n", "- Fight your way to the Combine Teleporter - Objective Complete\n")
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 10 then
for _,EnemyCheck in pairs(ents.FindByClass("npc_*")) do
if EnemyCheck:GetClass() == "npc_combine_s" then
	CombineCheck = EnemyCheck
end
end
if WaveStarted == false and !IsValid(CombineCheck) then
	WaveStarted = true
end
if WaveStarted == true and IsValid(CombineCheck) then
if IsValid(AlyxAliveCheck) then
	ActiveObjective = "- Survive until the teleporter is ready\n- Keep Alyx Alive - HP: " .. AlyxHP .. " %\n- Use the teleporter to escape Nova Prospekt"
elseif !IsValid(AlyxAliveCheck) then
	ActiveObjective = "- Survive until the teleporter is ready\n- Keep Alyx Alive - Objective Failed\n- Use the teleporter to escape Nova Prospekt"
end
end
for _,TeleporterReady in pairs(ents.FindByClass("func_tracktrain")) do
if TeleporterReady:GetPos().z > 1030 then
	TeleStolen = true
end
if TeleporterReady:GetPos().z < 1028 and TeleStolen == true then
CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 11 then
	ActiveObjective = "- Survive until the teleporter is ready - Objective Complete\n- Keep Alyx Alive - HP: " .. AlyxHP .. " %\n- Use the teleporter to escape Nova Prospekt"
	DeathObjective = "- Survive until the teleporter is ready - Objective Failed\n- Keep Alyx Alive - Objective Failed\n- Use the teleporter to escape Nova Prospekt - Objective Failed"
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
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = nil
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Find and confront Dr. Mossman %- Objective Complete", "")
	ActiveObjective = string.gsub(ActiveObjective, "%- Fight your way to the Combine Teleporter %- Objective Complete%\n", "")
	ActiveObjective = string.gsub(ActiveObjective, "%- Survive until the teleporter is ready %- Objective Complete%\n", "")
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