// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local GunshipDead = false

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Coast08Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	GunshipDead = false
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_coast_08" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
if !ply:Alive() or ZPos < 1000 then
	CurObjective = DeathObjective
else
	CurObjective = ActiveObjective
end

if CurObjMarker > 13 then
for _,GunshipBody in pairs(ents.FindByClass("prop_physics")) do
if GunshipBody:GetModel() == "models/gibs/gunship_gibs_midsection.mdl" and GunshipDead == false then
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Destroy the Gunship - Objective Complete"
	GunshipDead = true
	RemoveDelay = CurTime() + 5
end
end
end

if CurObjMarker == 0 then
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Find a way to disable the forcefield\n>The bridge across is blocked by a forcefield"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed\n- Find a way to disable the forcefield - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 20 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(3328, 380, 1556)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3000, 3656) and YPos == math.Clamp(YPos, 144, 432) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(3240, -1229, 1812)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3104, 3608) and YPos == math.Clamp(YPos, -1407, -1111) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(3343, -2643, 1500)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3059, 3616) and YPos == math.Clamp(YPos, -2781, -2526) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(3340, -4049, 1812)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3104, 3616) and YPos == math.Clamp(YPos, -4159, -3912) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(3201, -5408, 1812)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3105, 3539) and YPos == math.Clamp(YPos, -5504, -5377) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(3328, -6269, 1556)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3009, 3646) and YPos == math.Clamp(YPos, -6366, -6177) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(3327, -6920, 1556)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3221, 3552) and YPos == math.Clamp(YPos, -7024, -6921) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(2896, -7136, 1555)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2867, 2936) and YPos == math.Clamp(YPos, -7230, -6920) ) or ( XPos == math.Clamp(XPos, 2825, 3064) and YPos == math.Clamp(YPos, -7368, -6921) and ZPos == math.Clamp(ZPos, 1792, 1910) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(3007, -7372, 1812)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2972, 3063) and YPos == math.Clamp(YPos, -7454, -7376) and ZPos > 1780 )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(3008, -7370, 1940)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2934, 3064) and YPos == math.Clamp(YPos, -7368, -7299) and ZPos > 1900)
end
if CurObjMarker == 11 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(2841, -7087, 1975)
for _,ForceField in pairs(ents.FindByClass("prop_dynamic")) do
if ForceField:GetPos() == Vector(2822.530029, -7156.890137, 1958.300049) and ForceField:GetSkin() == 1 then
CurObjMarker = 12
end
end
end
if CurObjMarker == 12 then
	SubObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Find a way to disable the forcefield - Objective Complete"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 13 and RemoveDelay < CurTime() then
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Destroy the Gunship"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed\n- Destroy the Gunship - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(3327, -6920, 1556)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3221, 3552) and YPos == math.Clamp(YPos, -7024, -6921) )
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(3201, -5408, 1812)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3105, 3539) and YPos == math.Clamp(YPos, -5504, -5377) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(3340, -4049, 1812)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3104, 3616) and YPos == math.Clamp(YPos, -4159, -3912) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(3343, -2643, 1500)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3059, 3616) and YPos == math.Clamp(YPos, -2781, -2526) )
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(3240, -1229, 1812)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3104, 3608) and YPos == math.Clamp(YPos, -1407, -1111) )
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(3328, 380, 1556)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3000, 3656) and YPos == math.Clamp(YPos, 144, 432) )
end
if CurObjMarker == 20 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end

if RemoveDelay < CurTime() then
	SubObjective = ""
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Destroy the Gunship %- Objective Complete", "")
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