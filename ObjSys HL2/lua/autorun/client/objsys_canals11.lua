// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Canals11Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_11" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME\n- Evade the pursuing Hunter Chopper"
	DeathObjective = "- Continue through the canals - Objective Failed\n- Evade the pursuing Hunter Chopper - Objective Failed"
	CurObjMarker = 1
end
if CurObjMarker == 22 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(9994, 8192, -950)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9736, 10239) and YPos == math.Clamp(YPos, 8065, 8192))
end
if CurObjMarker == 2 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME\n- Evade the pursuing Hunter Chopper - Objective Complete"
	DeathObjective = "- Continue through the canals - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 and RemoveDelay < CurTime() then
	CurObjSpot = Vector(10210, 7326, -508)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 10177, 10240) and YPos == math.Clamp(YPos, 7300, 7398) and ZPos > -600)
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME\n- Find a way to continue"
	DeathObjective = "- Continue through the canals - Objective Failed\n- Find a way to continue - Objective Failed"
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(9743, 8151, -561)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9698, 9805) and YPos == math.Clamp(YPos, 8111, 8192) and ZPos > -600)
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(9244, 8146, -692)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9231, 9342) and YPos == math.Clamp(YPos, 8097, 8192) and ZPos > -750)
end
if CurObjMarker == 6 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME\n- Find a way to continue - Objective Complete"
	DeathObjective = "- Continue through the canals - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 7 and RemoveDelay < CurTime() then
	CurObjSpot = Vector(8159, 7981, -940)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 7894, 8527) and YPos == math.Clamp(YPos, 7706, 8304))
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME"
	DeathObjective = "- Continue through the canals - Objective Failed"
end
if CurObjMarker == 8 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals - Objective Complete"
	DeathObjective = "- Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(8135, 5266, -964)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 7894, 8527) and YPos == math.Clamp(YPos, 7706, 8304))
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(6409, 5008, -934)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 6367, 6503) and YPos == math.Clamp(YPos, 4943, 5056))
end
if CurObjMarker == 11 then
	CurObjSpot = nil
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 6240, 6313) and YPos == math.Clamp(YPos, 5230, 5329))
end
if CurObjMarker == 12 then
	CurObjSpot = nil
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 6091, 6208) and YPos == math.Clamp(YPos, 5212, 5334))
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(5001, 4869, -926)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4861, 5012) and YPos == math.Clamp(YPos, 4624, 5104))
	ActiveObjective = "- Destroy the Hunter Chopper\n- Reach Black Mesa East\n>BME is located at the bottom of the dam"
	DeathObjective = "- Destroy the Hunter Chopper - Objective Failed\n- Reach Black Mesa East - Objective Failed"
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(4085, 1050, -935)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 3548, 4443) and YPos == math.Clamp(YPos, 924, 1016))
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(5008, -4079, -780)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4547, 6221) and YPos == math.Clamp(YPos, -4187, -3921))
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(2410, -7709, -949)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 2357, 2427) and YPos == math.Clamp(YPos, -7904, -7504))
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(37, -7376, -876)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -304, 142) and YPos == math.Clamp(YPos, -8256, -7168))
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(-4464, -2307, -824)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -4616, -3600) and YPos == math.Clamp(YPos, -8415, -6937))
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(-4006, -4613, -941)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -4509, -3201) and YPos == math.Clamp(YPos, -4524, -4248))
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(-7187, -2549, -911)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -7485, -7380) and YPos == math.Clamp(YPos, -2780, -2304))
end
if CurObjMarker == 21 then
	CurObjSpot = Vector(-11529, -831, -932)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -11742, -11300) and YPos == math.Clamp(YPos, -821, -770))
end
if CurObjMarker == 22 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Continue through the canals %- Objective Complete", "")
end

cam.Start3D()
if CurObjSpot != nil then
	RoundedDistance = math.Round( ply:GetPos():Distance( CurObjSpot ) / 39.37, 0 )
if RoundedDistance < MarkerDistance then
	render.SetMaterial(Marker)
	render.DrawSprite( CurObjSpot, 14, 60, color_white )
end
end
cam.End3D()

end // GetMap end
end)