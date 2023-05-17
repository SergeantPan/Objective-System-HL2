// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "Canals02Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_02" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Evade the Metropolice\n- Continue through the canals\n>There may be other rebel hideouts ahead"
	DeathObjective = "- Evade the Metropolice - Objective Failed\n- Continue through the canals - Objective Failed"
	CurObjMarker = 1
end
if CurObjMarker == 8 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(2876, -541, -620)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 2576, 3216) and YPos == math.Clamp(YPos, -821, -558))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(377, -322, -842)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 185, 654) and YPos == math.Clamp(YPos, -1385, -66))
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(102, -1359, -738)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -13, 80) and YPos == math.Clamp(YPos, -1392, -1313))
end
if CurObjMarker == 4 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-219, -973, -1071)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-431, -887, -758)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -450, -393) and YPos == math.Clamp(YPos, -920, -847))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -271, -169) and YPos == math.Clamp(YPos, -1008, -944) and ZPos < -1000)
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-112, -210, -848)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -144, -81) and YPos == math.Clamp(YPos, -218, -148))
	SubObjSpot = nil
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(94, 1441, -768)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 63, 123) and YPos == math.Clamp(YPos, 1408, 1472))
end
if CurObjMarker == 8 then
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