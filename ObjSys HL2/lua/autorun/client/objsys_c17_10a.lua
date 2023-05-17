// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "City17_10aObj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_10a" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = ""
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Keep Barney Alive - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 21 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

if CurObjMarker > 0 then
for _,BarneyAlive in pairs(ents.FindByClass( "npc_barney" )) do
	BarneyHP = (BarneyAlive:Health() / BarneyAlive:GetMaxHealth()) * 100
	BarneyAliveCheck = BarneyAlive
if GetConVar("ObjSysNoNPCMarker"):GetInt() == 0 and CurObjMarker > 0 then
	SubObjSpot = BarneyAlive:EyePos() + Vector(0,0,10)
else
	SubObjSpot = nil
end
end
if IsValid(BarneyAliveCheck) and CurObjMarker < 6 then
	ActiveObjective = "- Assault the Citadel\n- Keep Barney Alive - HP: " .. BarneyHP .. " %"
elseif !IsValid(BarneyAliveCheck) and CurObjMarker < 6 then
	ActiveObjective = "- Assault the Citadel\n- Keep Barney Alive - Objective Failed"
end
if IsValid(BarneyAliveCheck) and CurObjMarker >= 6 and CurObjMarker != 21 then
	ActiveObjective = "- Assault the Citadel\n- Assault the Combine Nexus\n- Disable the Suppression Device\n- Keep Barney Alive - HP: " .. BarneyHP .. " %"
elseif !IsValid(BarneyAliveCheck) and CurObjMarker >= 6 and CurObjMarker != 21 then
	ActiveObjective = "- Assault the Citadel\n- Assault the Combine Nexus\n- Disable the Suppression Device\n- Keep Barney Alive - Objective Failed"
end
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(-3719, 6896, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3720, -3676) and YPos == math.Clamp(YPos, 6848, 6929) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-3138, 6941, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3127, -3083) and YPos == math.Clamp(YPos, 6886, 7023) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-2974, 6480, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3072, -2881) and YPos == math.Clamp(YPos, 6416, 6556) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-2969, 6474, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3072, -2977) and YPos == math.Clamp(YPos, 6416, 6555) and ZPos == math.Clamp(ZPos, 512, 632) )
end
if CurObjMarker == 5 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2688, -2505) and YPos == math.Clamp(YPos, 6913, 7025) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-2596, 7300, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2721, -2450) and YPos == math.Clamp(YPos, 7312, 7355) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-2853, 7884, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2944, -2752) and YPos == math.Clamp(YPos, 7811, 7936) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-2817, 8194, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2880, -2753) and YPos == math.Clamp(YPos, 8201, 8267) and ZPos == math.Clamp(ZPos, 128, 248) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-2438, 8383, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2432, -2368) and YPos == math.Clamp(YPos, 8320, 8448) and ZPos == math.Clamp(ZPos, 128, 248) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-2389, 6383, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2560, -1792) and YPos == math.Clamp(YPos, 6264, 6572) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-1884, 6072, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2241, -1792) and YPos == math.Clamp(YPos, 5928, 6087) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-1786, 4285, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1775, -1708) and YPos == math.Clamp(YPos, 4246, 4334) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-1411, 4451, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1477, -1364) and YPos == math.Clamp(YPos, 4464, 4522) )
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-1376, 6301, 85)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1784, -1032) and YPos == math.Clamp(YPos, 6206, 6347) )
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(-1410, 8086, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1448, -1356) and YPos == math.Clamp(YPos, 8097, 8162) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(-1028, 8257, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1024, -972) and YPos == math.Clamp(YPos, 8208, 8293) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(-885, 6358, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1024, 832) and YPos == math.Clamp(YPos, 6271, 6378) )
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(96, 4550, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -27, 96) and YPos == math.Clamp(YPos, 4480, 4655) )
end
if CurObjMarker == 19 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(241, 4558, 248)
for _,Gate in pairs(ents.FindByClass("prop_dynamic")) do
	if Gate:GetModel() == "models/props_combine/combine_fence01b.mdl" and Gate:GetPos() == Vector(98, 4608, 168) then
	if Gate:GetSkin() == 1 then
	CurObjMarker = CurObjMarker + 1
end
end
end
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(282, 4895, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 288, 347) and YPos == math.Clamp(YPos, 4800, 4960) )
	SubObjSpot = nil
end
if CurObjMarker == 21 then
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