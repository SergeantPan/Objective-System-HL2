// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local SubObjective = ""
	local CurObjMarker = 0
	local VicRemoved = false

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Coast05Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjective = ""
	SubObjSpot = nil
	SubObjSpot2 = nil
	VicRemoved = false
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_coast_05" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
if !ply:Alive() or ZPos < 300 then
	CurObjective = DeathObjective
else
	CurObjective = ActiveObjective
end

if CurObjMarker == 0 then
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 22 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

if SubObjective != "" then
	draw.DrawText( "Side Objectives:", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.16), Alpha, 0 )
	draw.DrawText( "__________________", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.17), Alpha, 0 )
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )
	draw.DrawText( SubObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.18), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(5418, -11814, 1704)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5385, 5443) and YPos == math.Clamp(YPos, -12157, -11554) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(1987, -9133, 1327)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1910, 2072) and YPos == math.Clamp(YPos, -9532, -8887) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-309, -8835, 1095)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -472, -150) and YPos == math.Clamp(YPos, -9042, -8636) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-967, -10706, 990)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1280, -509) and YPos == math.Clamp(YPos, -10871, -10587) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-3607, -12544, 724)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3698, -3477) and YPos == math.Clamp(YPos, -12797, -12288) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-5881, -12044, 724)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6406, -4940) and YPos == math.Clamp(YPos, -12779, -10821) )
end
if CurObjMarker == 7 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-5892, -11441, 775)
	SubObjective = "\n- Investigate the house"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-4328, -7873, 1083)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4348, -4012) and YPos == math.Clamp(YPos, -10332, -6550) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -5886, -5845) and YPos == math.Clamp(YPos, -11472, -11412) ) or ( XPos == math.Clamp(XPos, -5437, -5390) and YPos == math.Clamp(YPos, -11280, -11219) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-2058, -7423, 1299)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2148, -1994) and YPos == math.Clamp(YPos, -7674, -7185) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -5886, -5845) and YPos == math.Clamp(YPos, -11472, -11412) ) or ( XPos == math.Clamp(XPos, -5437, -5390) and YPos == math.Clamp(YPos, -11280, -11219) )
end
if CurObjMarker == 10 then
	SubObjSpot = nil
	SubObjective = string.gsub(SubObjective, "house", "house - Objective Failed")
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-786, -5945, 1300)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1024, -687) and YPos == math.Clamp(YPos, -6001, -5439) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-2059, -4864, 1297)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2148, -2026) and YPos == math.Clamp(YPos, -5121, -4232) )
end
if CurObjMarker == 13 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-3833, -4110, 1307)
	SubObjective = "\n- There's something on that hill"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-4864, -3271, 1108)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5601, -3935) and YPos == math.Clamp(YPos, -3413, -2997) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -3931, -3484) and YPos == math.Clamp(YPos, -4225, -3896) )
end
if CurObjMarker == 15 then
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Disable the forcefield"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed\n- Disable the forcefield - Objective Failed"
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(-4535, -1227, 1108)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5708, -3914) and YPos == math.Clamp(YPos, -1324, -1029) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -3931, -3484) and YPos == math.Clamp(YPos, -4225, -3896) )
end
if CurObjMarker == 17 then
	SubObjSpot = nil
	SubObjective = string.gsub(SubObjective, "hill", "hill - Objective Failed")
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 18 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6227, -2679) and YPos == math.Clamp(YPos, -598, 1510) )
end
if CurObjMarker == 19 then
	CurObjTriggerSpot = nil
	SubObjSpot2 = Vector(-3799, 1370, 1148)
	SubObjective = "\n- There's something behind that fencing"
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -3567, -3186) and YPos == math.Clamp(YPos, 1143, 1424) )
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Disable the forcefield\n>That APC is powering the forcefield"
for _,ForceField in pairs(ents.FindByClass("prop_dynamic")) do
if ForceField:GetModel() == "models/props_combine/combine_fence01a.mdl" and ForceField:GetSkin() == 1 then
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse\n- Disable the forcefield - Objective Complete"
	DeathObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse"
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker +  1
end
end
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(-3063, 770, 1109)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3066, -2760) and YPos == math.Clamp(YPos, 491, 1030) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -3567, -3186) and YPos == math.Clamp(YPos, 1143, 1424) )
end
if CurObjMarker == 21 then
	CurObjSpot = Vector(-15, 770, 1363)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -22, 125) and YPos == math.Clamp(YPos, 181, 1361) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -3567, -3186) and YPos == math.Clamp(YPos, 1143, 1424) )
end
if CurObjMarker == 22 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	SubObjSpot2 = nil
end
if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjective = string.gsub(SubObjective, "house", "house - Objective Complete")
	SubObjective = string.gsub(SubObjective, "hill", "hill - Objective Complete")
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
if SubObjTriggerSpot and SubObjSpot2 != nil then
	SubObjective = string.gsub(SubObjective, "fencing", "fencing - Objective Complete")
	SubObjSpot2 = nil
	RemoveDelay = CurTime() + 5
end
if RemoveDelay < CurTime() then
	SubObjective = string.gsub(SubObjective, "%\n%- Investigate the house %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- Investigate the house %- Objective Failed", "")
	SubObjective = string.gsub(SubObjective, "%\n%- There's something on that hill %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- There's something on that hill %- Objective Failed", "")
	SubObjective = string.gsub(SubObjective, "%\n%- There's something behind that fencing %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- There's something behind that fencing %- Objective Failed", "")
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Disable the forcefield %- Objective Complete", "")
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
if SubObjSpot2 != nil then
	RoundedDistance = math.Round( ply:GetPos():Distance( SubObjSpot2 ) / 39.37, 0 )
if RoundedDistance < MarkerDistance then
	render.SetMaterial(CuriosityMarker)
	render.DrawSprite( SubObjSpot2, 14, 20, color_white )
end
end
cam.End3D()

end // GetMap end
end)