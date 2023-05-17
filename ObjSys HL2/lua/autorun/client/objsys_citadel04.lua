// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Citadel04Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_citadel_04" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Rescue Alyx and Eli\n- Kill Breen"
	DeathObjective = "- Rescue Alyx and Eli - Objective Failed\n- Kill Breen - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 11 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

for _,Lift in pairs(ents.FindByClass("func_tracktrain")) do
if Lift:GetModel() == "*100" then
	LiftTag = Lift
end
end

if CurObjMarker == 1 then
	CurObjSpot = Vector(259, 392, 2324)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 39, 580) and YPos == math.Clamp(YPos, 370, 452) )
end
if CurObjMarker == 2 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(257, 1028, 2356)
if LiftTag:GetPos().z < 6350 then
	CurObjMarker = CurObjMarker + 1
end
end
if CurObjMarker == 3 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Rescue Alyx and Eli\n- Kill Breen\n- Survive until the elevator arrives"
	DeathObjective = "- Rescue Alyx and Eli - Objective Failed\n- Kill Breen - Objective Failed\n- Survive until the elevator arrives - Objective Failed"
	SubObjSpot = nil
if LiftTag:GetPos().z < 2340 then
	ActiveObjective = "- Rescue Alyx and Eli\n- Kill Breen\n- Survive until the elevator arrives - Objective Complete"
	DeathObjective = "- Rescue Alyx and Eli - Objective Failed\n- Kill Breen - Objective Failed"
	CurObjMarker = CurObjMarker + 1
	RemoveDelay = CurTime() + 5
end
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(569, -405, 6420)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 512, 640) and YPos == math.Clamp(YPos, -493, -398) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(577, -1248, 6421)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 512, 636) and YPos == math.Clamp(YPos, -1344, -1254) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-1216, -1439, 6420)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1273, -1152) and YPos == math.Clamp(YPos, -1506, -1376) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-1218, -2394, 6420)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2048, -1152) and YPos == math.Clamp(YPos, -2505, -2363) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-1594, -3767, 6164)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2048, -1280) and YPos == math.Clamp(YPos, -3795, -3738) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-1666, -7040, 6164)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1983, -1324) and YPos == math.Clamp(YPos, -7105, -7002) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-1333, -7981, 6212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1352, -1305) and YPos == math.Clamp(YPos, -8192, -7776) )
end
if CurObjMarker == 11 then
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
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Survive until the elevator arrives %- Objective Complete", "")
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