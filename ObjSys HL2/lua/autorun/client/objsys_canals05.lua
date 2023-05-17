// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local SubObjective = ""

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Canals05Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjective = ""
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_05" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Continue through the canals"
	DeathObjective = "- Continue through the canals - Objective Failed"
	CurObjMarker = 1
end
if CurObjMarker == 19 then // Final number
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

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(3360, 6386, -396)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 3322, 3399) and YPos == math.Clamp(YPos, 6327, 6358))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(3606, 5489, -300)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 3618, 3711) and YPos == math.Clamp(YPos, 5440, 5535))
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(4646, 5205, -320)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(4101, 5274, -128)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4095, 4126) and YPos == math.Clamp(YPos, 5233, 5313))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 4611, 4720) and YPos == math.Clamp(YPos, 5120, 5235))
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(4207, 4840, -268)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4160, 4256) and YPos == math.Clamp(YPos, 4767, 4832))
	SubObjSpot = nil
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(4243, 3240, -455)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4203, 4280) and YPos == math.Clamp(YPos, 3200, 3246))
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(4139, 1815, -452)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4096, 4352) and YPos == math.Clamp(YPos, 2688, 2860))
end
if CurObjMarker == 8 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME\n- Get the Airboat the rebels have stashed"
	DeathObjective = "- Continue through the canals - Objective Failed\n- Get the Airboat the rebels have stashed - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(4139, 1815, -452)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4097, 4244) and YPos == math.Clamp(YPos, 1736, 1827))
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(4741, 826, -440)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4739, 4788) and YPos == math.Clamp(YPos, 801, 858))
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(5340, 756, -450)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 5351, 5392) and YPos == math.Clamp(YPos, 691, 796))
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(5787, 1141, -454)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 5676, 5819) and YPos == math.Clamp(YPos, 1072, 1111))
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(6750, 1568, -428)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 6742, 6815) and YPos == math.Clamp(YPos, 1537, 1599))
end
if CurObjMarker == 14 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = string.gsub(ActiveObjective, "stashed", "stashed - Objective Complete")
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 15 and RemoveDelay < CurTime() then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME"
	RemoveDelay = CurTime() + 12
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 16 and RemoveDelay < CurTime() then
	SubObjective = "\n- Reach Station 7\n>The rebel mentioned Station 7, the 'Red Old Barn', would have help"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(6582, -1575, -457)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 6400, 7183) and YPos == math.Clamp(YPos, -1732, -1520))
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(56, -1077, -330)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 0, 111) and YPos == math.Clamp(YPos, -1087, -1025))
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