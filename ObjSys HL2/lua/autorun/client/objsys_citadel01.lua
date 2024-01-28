// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Citadel01Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_citadel_01" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	if CurObjMarker == 16 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(6400, 4322, -284)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6131, 7095) and YPos == math.Clamp(YPos, 4266, 4580) )
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Assault the Citadel - Objective Complete\n- Find a way inside"
	DeathObjective = "- Find a way inside - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(6185, 4501, -572)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6137, 6272) and YPos == math.Clamp(YPos, 4374, 4545) and ZPos == math.Clamp(ZPos, -623, -379) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(6430, 5136, -1210)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6248, 6555) and YPos == math.Clamp(YPos, 5103, 5165) and ZPos == math.Clamp(ZPos, -2338, -1037) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(6984, 4820, -1580)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6913, 7042) and YPos == math.Clamp(YPos, 4793, 4895) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(7493, 4634, -1460)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7424, 7552) and YPos == math.Clamp(YPos, 4585, 4690) )
end
if CurObjMarker == 7 then
	urObjSpot = Vector(7864, 4644, -1460)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7808, 7904) and YPos == math.Clamp(YPos, 4608, 4693) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(8304, 4833, -1388)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8281, 8395) and YPos == math.Clamp(YPos, 4736, 4928) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(8610, 3749, -1452)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8577, 8640) and YPos == math.Clamp(YPos, 3714, 3776) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(8991, 3459, -1452)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8944, 9069) and YPos == math.Clamp(YPos, 3396, 3463) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(10110, 3138, -1452)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 10085, 10179) and YPos == math.Clamp(YPos, 1984, 3456) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(10462, 3500, -1580)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 10416, 10523) and YPos == math.Clamp(YPos, 3455, 3584) )
end
if CurObjMarker == 13 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
	ActiveObjective = "- Find a way inside - Objective Complete"
	DeathObjective = "- Rescue Alyx and Eli - Objective Failed\n- Kill Breen - Objective Failed"
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(10527, 4198, -1756)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 10080, 10880) and YPos == math.Clamp(YPos, 4144, 4257) )
end
if CurObjMarker == 15 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(10242, 4563, -1723)
if ply:InVehicle() then
	CurObjMarker = CurObjMarker + 1
end
end
if CurObjMarker == 16 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	SubObjSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Find a way inside %- Objective Complete", "- Rescue Alyx and Eli\n- Kill Breen")
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