// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local StriderActive = nil
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "City17_12bObj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	StridersActive = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_12b" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Assault the Citadel\n- Regroup with Barney"
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Regroup with Barney - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 11 then // Final number
	ActiveObjective = "- Proceed to the next level"
end


for _,StriderChase in pairs( ents.FindByClass("npc_strider")) do
	if IsValid(StriderChase) then
StriderAlive = StriderChase
end
end

if CurObjMarker > 2 and IsValid(StriderAlive) and StriderActive == nil then
	StriderActive = true
	ActiveObjective = ActiveObjective .. "\n- Destroy the Strider"
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Regroup with Barney\n- Destroy the Strider - Objective Failed"
end
if !IsValid(StriderAlive) and StriderActive == true then
	StriderActive = false
	ActiveObjective = string.gsub(ActiveObjective, "Strider", "Strider - Objective Complete")
	DeathObjective = "- Assault the Citadel - Objective Failed"
	RemoveDelay = CurTime() + 5
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(-8751, -1328, -236)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8796, -8752) and YPos == math.Clamp(YPos, -1360, -1277) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-6171, -912, -236)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6167, -6076) and YPos == math.Clamp(YPos, -1232, -208) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-5766, 203, -300)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5752, -5717) and YPos == math.Clamp(YPos, 76, 360) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-4483, 298, -300)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4480, -4394) and YPos == math.Clamp(YPos, 232, 328) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-4557, 133, -172)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4561, -4418) and YPos == math.Clamp(YPos, 3, 360) and ZPos == math.Clamp(ZPos, -191, -8) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-5252, -384, -172)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5366, -5202) and YPos == math.Clamp(YPos, -455, -280) and ZPos == math.Clamp(ZPos, -192, -10) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-5649, -338, -122)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5767, -5520) and YPos == math.Clamp(YPos, -424, -241) and ZPos == math.Clamp(ZPos, -192, -18) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-5254, 178, 204)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5336, -5017) and YPos == math.Clamp(YPos, -456, 360) and ZPos == math.Clamp(ZPos, 158, 288) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-4495, 129, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4513, -4248) and YPos == math.Clamp(YPos, 30, 217) and ZPos == math.Clamp(ZPos, 96, 376) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-4299, 744, 116)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4344, -4248) and YPos == math.Clamp(YPos, 706, 873) and ZPos == math.Clamp(ZPos, 96, 224) )
end
if CurObjMarker == 11 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Destroy the Strider %- Objective Complete", "")
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