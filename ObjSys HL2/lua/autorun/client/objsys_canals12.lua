// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "Canals12Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_12" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Destroy the Hunter Chopper\n- Reach Black Mesa East\n>BME is located at the bottom of the dam"
	DeathObjective = "- Destroy the Hunter Chopper - Objective Failed\n- Reach Black Mesa East - Objective Failed"
	CurObjMarker = 1
end
if CurObjMarker == 19 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(11909, 12144, 427)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 11728, 12077) and YPos == math.Clamp(YPos, 12111, 12144))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(9383, 12874, 434)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9174, 9389) and YPos == math.Clamp(YPos, 12689, 13039))
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(7991, 8442, 416)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 7552, 8717) and YPos == math.Clamp(YPos, 8203, 8453))
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(6963, 4743, 413)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 6712, 6901) and YPos == math.Clamp(YPos, 4480, 4997))
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(1192, 4738, 412)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 1030, 1326) and YPos == math.Clamp(YPos, 4480, 4992))
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(126, 6743, 400)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -128, 400) and YPos == math.Clamp(YPos, 6694, 6804))
end
if CurObjMarker == 7 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(428, 9741, 400)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-150, 9563, 380)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -304, 63) and YPos == math.Clamp(YPos, 9539, 9715))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 348, 544) and YPos == math.Clamp(YPos, 9668, 9904))
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-1493, 9921, 553)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1667, -1318) and YPos == math.Clamp(YPos, 9715, 9885))
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-2977, 5903, 574)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -3151, -2803) and YPos == math.Clamp(YPos, 5741, 5888))

	SubObjTriggerSpot = nil
	SubObjSpot = nil
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-3793, 4375, 304)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -3908, -3785) and YPos == math.Clamp(YPos, 4209, 4563))
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-4365, 3220, 340)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -4608, -4096) and YPos == math.Clamp(YPos, 3129, 3215))
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-1610, -254, 356)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1613, -1501) and YPos == math.Clamp(YPos, -429, -83))
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(1037, -3875, 149)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 1002, 1088) and YPos == math.Clamp(YPos, -4224, -3526))
end
if CurObjMarker == 15 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(4373, -3384, 165)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(4720, -2699, 154)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4572, 4864) and YPos == math.Clamp(YPos, -2801, -2544))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 4411, 4581) and YPos == math.Clamp(YPos, -3427, -3094))
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(1232, -3558, 298)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 963, 1349) and YPos == math.Clamp(YPos, -4227, -3580) and ZPos > 270)
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(1217, -6178, 332)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 1099, 1333) and YPos == math.Clamp(YPos, -6269, -6149))
end
if CurObjMarker == 19 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end
if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = nil
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