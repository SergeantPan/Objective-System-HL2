// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "Canals10Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_10" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
if CurObjMarker == 15 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(10506, -11196, -509)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 10421, 10540) and YPos == math.Clamp(YPos, -11373, -11027))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(5970, -11157, -506)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 5477, 6168) and YPos == math.Clamp(YPos, -11045, -10840))
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(4776, -7929, -300)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4545, 5270) and YPos == math.Clamp(YPos, -8075, -7350))
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(11890, -5718, -425)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 12032, 12405) and YPos == math.Clamp(YPos, -5932, -5440))
end
if CurObjMarker == 5 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(11890, -1886, -192)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(13308, 828, -400)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 12800, 13824) and YPos == math.Clamp(YPos, 753, 1023))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 11777, 11983) and YPos == math.Clamp(YPos, -1919, -1812))
end
if CurObjMarker == 7 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(11064, 943, -384)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(9774, 2512, -400)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 9572, 9736) and YPos == math.Clamp(YPos, 2034, 3168))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 10880, 11232) and YPos == math.Clamp(YPos, 473, 761))
end
if CurObjMarker == 9 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(7708, 35, -384)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(8420, 5615, -405)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 7616, 8768) and YPos == math.Clamp(YPos, 5635, 5894))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 7680, 7806) and YPos == math.Clamp(YPos, 2, 146))
end
if CurObjMarker == 11 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(5427, 9280, -134)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(864, 8670, -411)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 600, 857) and YPos == math.Clamp(YPos, 8146, 9177))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 5122, 5593) and YPos == math.Clamp(YPos, 9225, 9336) and ZPos == math.Clamp(ZPos, -145, -120))
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-520, 3118, -410)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1660, 598) and YPos == math.Clamp(YPos, 2944, 3043))
	SubObjSpot = nil
	SubObjTriggerSpot = nil
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-9776, 1531, -282)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -10268, -10048) and YPos == math.Clamp(YPos, 1364, 1708))
end
if CurObjMarker == 15 then
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