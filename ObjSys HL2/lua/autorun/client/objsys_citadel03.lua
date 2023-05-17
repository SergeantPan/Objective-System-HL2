// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local Gate1 = false
	local Gate2 = false

hook.Add("HUDPaint", "Citadel03Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	Gate1 = false
	Gate2 = false
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_citadel_03" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	if CurObjMarker == 12 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

for _,Confisc in pairs(ents.FindByClass("prop_dynamic")) do
if Confisc:GetPos() == Vector(7616, -1086, 2264) and Confisc:GetSkin() == 1 and CurObjMarker == 1 then
	CurObjSpot = Vector(7687, -1029, 2132)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7616, 7744) and YPos == math.Clamp(YPos, -1072, -970) )
end
if Confisc:GetPos() == Vector(3584, 514, 2520) and Confisc:GetSkin() == 1 and CurObjMarker == 10 then
	CurObjSpot = Vector(3168, 198, 2388)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3124, 3193) and YPos == math.Clamp(YPos, 128, 256) )
	Gate1 = true
end
if Confisc:GetPos() == Vector(2048, 115, 2456) and Confisc:GetSkin() == 1 and CurObjMarker == 11 then
	CurObjSpot = Vector(1261, -465, 2324)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1190, 1273) and YPos == math.Clamp(YPos, -568, -384) )
	Gate2 = true
end
end

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 2 then
	CurObjSpot = Vector(7683, 6, 2132)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7610, 7744) and YPos == math.Clamp(YPos, -22, 16) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(6895, 128, 2132)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6592, 6922) and YPos == math.Clamp(YPos, -37, 764) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(6720, 1934, 2132)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6592, 6912) and YPos == math.Clamp(YPos, 1906, 1995) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(6275, 895, 2132)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6080, 6464) and YPos == math.Clamp(YPos, 840, 956) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(6113, 80, 2132)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6053, 6190) and YPos == math.Clamp(YPos, -255, 512) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(5174, 62, 2068)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5094, 5247) and YPos == math.Clamp(YPos, 0, 128) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(3969, 638, 2068)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3947, 4018) and YPos == math.Clamp(YPos, 576, 704) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(3517, 641, 2076)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3456, 3587) and YPos == math.Clamp(YPos, 576, 704) )
end
if CurObjMarker == 10 and Gate1 == false then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end
if CurObjMarker == 11 and Gate2 == false then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end
if CurObjMarker == 12 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
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