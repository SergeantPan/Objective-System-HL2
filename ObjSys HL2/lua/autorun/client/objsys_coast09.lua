// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local SubObjective = ""
	local CurObjMarker = 0

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Coast09Obj", function(ply)

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
	if game.GetMap() == "d2_coast_09" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 21 then // Final number
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

if CurObjMarker == 1 then
	CurObjSpot = Vector(-14078, 9756, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -14336, -13760) and YPos == math.Clamp(YPos, 9693, 9819) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-13661, 7761, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -13750, -13517) and YPos == math.Clamp(YPos, 7505, 7981) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-12339, 7608, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -12454, -12274) and YPos == math.Clamp(YPos, 7168, 7680) )
end
if CurObjMarker == 4 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-11934, 7016, 560)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-10144, 7428, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -10178, -10021) and YPos == math.Clamp(YPos, 7168, 7680) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -11903, -11829) and YPos == math.Clamp(YPos, 6912, 7069) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-7229, 7343, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7300, -7117) and YPos == math.Clamp(YPos, 6999, 7627) )
	SubObjSpot = nil
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-6398, 4609, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6924, -6144) and YPos == math.Clamp(YPos, 4392, 4627) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-6398, -1544, -237)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8745, -5641) and YPos == math.Clamp(YPos, -1932, -1524) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-3315, -5299, -684)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3269, -2951) and YPos == math.Clamp(YPos, -10317, -4963) )
end
if CurObjMarker == 10 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(984, -6649, -731)
	SubObjective = "\n- That house might have something useful"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-1278, -2052, -620)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1516, 4035) and YPos == math.Clamp(YPos, -2563, -2033) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 928, 1052) and YPos == math.Clamp(YPos, -6726, -6551) )
end
if CurObjMarker == 12 then
	CurObjTriggerSpot = nil
	SubObjective = string.gsub(SubObjective, "useful", "useful - Objective Failed")
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-149, 5206, -748)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1318, 1169) and YPos == math.Clamp(YPos, 5076, 5335) )
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-205, 8701, -748)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1209, 868) and YPos == math.Clamp(YPos, 8589, 8830) )
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(5233, 13164, -168)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5000, 5500) and YPos == math.Clamp(YPos, 11683, 13540) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(9965, 10250, -47)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 9039, 10910) and YPos == math.Clamp(YPos, 10088, 10423) )
end
if CurObjMarker == 17 then
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Find batteries to power the gate\n>There should be some lying around this hut"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed\n- Find batteries to power the gate - Objective Failed"
	SubObjSpot = Vector(11132, 8808, -42)
	CurObjTriggerSpot = nil
for _,Door in pairs(ents.FindByClass("func_door_rotating")) do
if Door:GetModel() == "*74" and Door:GetAngles() == Angle(0, 0, -90) then
CurObjMarker = CurObjMarker + 1
end
end
end

if CurObjMarker == 18 then
	CurObjTriggerSpot = nil
	SubObjSpot = nil
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Find batteries to power the gate - Objective Complete"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(9962, 7381, -172)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 9280, 11118) and YPos == math.Clamp(YPos, 7176, 7338) )
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(9989, 3584, -172)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 9728, 10240) and YPos == math.Clamp(YPos, 3518, 3611) )
end
if CurObjMarker == 21 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjective = string.gsub(SubObjective, "useful", "useful - Objective Complete")
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
if RemoveDelay < CurTime() then
	SubObjective = string.gsub(SubObjective, "%\n%- That house might have something useful %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- That house might have something useful %- Objective Failed", "")
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Find batteries to power the gate %- Objective Complete", "")
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