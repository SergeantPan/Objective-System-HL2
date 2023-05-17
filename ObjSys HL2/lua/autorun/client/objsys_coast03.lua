// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local SubObjective = ""
	local CurObjMarker = 0
	local NLOText = false
	local GunshipDead = false

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Coast03Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjective = ""
	SubObjSpot = nil
	NLOText = false
	GunshipDead = false
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_coast_03" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Reach New Little Odessa\n- Reach Nova Prospekt"
	DeathObjective = "- Reach New Little Odessa - Objective Failed\n- Reach Nova Prospekt - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 17 then // Final number
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

for _,Gman in pairs(ents.FindByClass("npc_gman")) do
if IsValid(Gman) and NLOText == false then
	NLOText = true
	ActiveObjective = "- Reach New Little Odessa\n>Looks like the Combine are aware of NLO\n- Reach Nova Prospekt"
end
end

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(-6048, -10652, 277)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8384, -2526) and YPos == math.Clamp(YPos, -10859, -10255) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-4515, -8928, 154)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4790, -1562) and YPos == math.Clamp(YPos, -8927, -8327) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-5562, -6094, 526)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6054, -5009) and YPos == math.Clamp(YPos, -6614, -5679) )
end
if CurObjMarker == 4 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-3263, -6366, 541)
	SubObjective = "\n- That house might have something of use"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-6092, -1718, 100)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7212, -3400) and YPos == math.Clamp(YPos, -2369, -206) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -3339, -3190) and YPos == math.Clamp(YPos, -6410, -6305) )
end
if CurObjMarker == 6 then
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
	SubObjSpot = Vector(-4047, 3547, 504)
	SubObjective = string.gsub(SubObjective, "of use", "of use - Objective Failed")
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-5477, 3708, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7142, -3230) and YPos == math.Clamp(YPos, 3671, 4324) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -4089, -4020) and YPos == math.Clamp(YPos, 3552, 3600) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-4227, 9186, 146)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4348, -4012) and YPos == math.Clamp(YPos, 6550, 10332) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -4089, -4020) and YPos == math.Clamp(YPos, 3552, 3600) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-208, 9897, 274)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -284, 210) and YPos == math.Clamp(YPos, 6267, 10533) )
	SubObjSpot = nil
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(4908, 5302, 82)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3399, 5725) and YPos == math.Clamp(YPos, 4771, 5475) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(7827, 2512, 268)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6960, 9102) and YPos == math.Clamp(YPos, 2561, 2625) )
end
if CurObjMarker == 12 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Reach New Little Odessa - Objective Complete\n- Reach Nova Prospekt"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(8869, 4064, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8857, 8898) and YPos == math.Clamp(YPos, 4011, 4120) )
end

for _,Gunship in pairs(ents.FindByClass("npc_combinegunship")) do
if IsValid(Gunship) then
ActiveObjective = "- Reach Nova Prospekt\n- Destroy the Gunship"
DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Destroy the Gunship - Objective Failed"
end
end

if CurObjMarker == 14 then
	CurObjTriggerSpot = nil
	CurObjSpot = nil
for _,GunshipBody in pairs(ents.FindByClass("prop_physics")) do
if GunshipBody:GetModel() == "models/gibs/gunship_gibs_midsection.mdl" and GunshipDead == false then
	ActiveObjective = "- Reach Nova Prospekt\n- Destroy the Gunship - Objective Complete"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed"
	GunshipDead = true
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 15 and RemoveDelay < CurTime() then
	ActiveObjective = "- Reach Nova Prospekt"
	CurObjSpot = Vector(7936, 5129, 405)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7666, 8192) and YPos == math.Clamp(YPos, 5123, 5283) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(4801, 8267, 647)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4566, 5098) and YPos == math.Clamp(YPos, 8235, 8613) )
end
if CurObjMarker == 17 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjective = string.gsub(SubObjective, "of use", "of use - Objective Complete")
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
if RemoveDelay < CurTime() then
	SubObjective = ""
	ActiveObjective = string.gsub(ActiveObjective, "- Reach New Little Odessa %- Objective Complete%\n", "")
end

cam.Start3D()
if CurObjSpot != nil then
	RoundedDistance = math.Round( ply:GetPos():Distance( CurObjSpot ) / 39.37, 0 ) * 2
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