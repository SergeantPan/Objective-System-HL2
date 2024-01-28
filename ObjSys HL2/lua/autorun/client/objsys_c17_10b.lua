// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local BarneyObjective = ""
	local CurObjMarker = 0
	local ExitGateDown = false
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "City17_10bObj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	ExitGateDown = false
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_10b" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	BaseObjective = "- Assault the Citadel\n- Assault the Combine Nexus\n- Disable the Suppression Device"
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Assault the Combine Nexus - Objective Failed\n- Disable the Suppression Device - Objective Failed\n- Keep Barney Alive - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 28 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

if CurObjMarker > 0 and CurObjMarker != 28 then
for _,BarneyAlive in pairs(ents.FindByClass( "npc_barney" )) do
	BarneyHP = (BarneyAlive:Health() / BarneyAlive:GetMaxHealth()) * 100
	BarneyAliveCheck = BarneyAlive
if GetConVar("ObjSysNoNPCMarker"):GetInt() == 0 and CurObjMarker > 0 then
	SubObjSpot = BarneyAlive:EyePos() + Vector(0,0,10)
else
	SubObjSpot = nil
end
	ActiveObjective = BaseObjective .. BarneyObjective
end
if IsValid(BarneyAliveCheck) then
	BarneyObjective = "\n- Keep Barney Alive - HP: " .. BarneyHP .. " %"
elseif !IsValid(BarneyAliveCheck) then
	BarneyObjective = "\n- Keep Barney Alive - Objective Failed"
end
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

for _,ExitGate in pairs(ents.FindByClass("prop_dynamic")) do
	if ExitGate:GetPos() == Vector(2575.939941, -20, 296.317993) and ExitGate:GetSkin() == 1 then
ExitGateDown = true
end
end

if CurObjMarker == 1 then
	CurObjSpot = Vector(2686, -1013, 276)
	CurObjSpot2 = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2571, 2807) and YPos == math.Clamp(YPos, -1008, -936) )
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	BaseObjective = "- Assault the Citadel\n- Assault the Combine Nexus - Objective Complete\n- Disable the Suppression Device"
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Disable the Suppression Device - Objective Failed\n- Keep Barney Alive - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(2972, -191, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2920, 3039) and YPos == math.Clamp(YPos, -255, -128) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(3868, -387, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3841, 3915) and YPos == math.Clamp(YPos, -383, -317) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(3873, -391, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3826, 3918) and YPos == math.Clamp(YPos, -441, -392) and ZPos == math.Clamp(ZPos, 512, 704) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(3589, -510, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3511, 3575) and YPos == math.Clamp(YPos, -586, -428) and ZPos == math.Clamp(ZPos, 512, 700) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(3648, -884, 532)
	CurObjSpot2 = Vector(3264, -124, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3604, 3712) and YPos == math.Clamp(YPos, -935, -866) )	
	CurObjTriggerSpotAlt = ( XPos == math.Clamp(XPos, 3200, 3434) and YPos == math.Clamp(YPos, -155, -60) )
if CurObjTriggerSpotAlt then
	CurObjMarker = 19
end
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(3167, -1569, 532)
	CurObjSpot2 = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3133, 3204) and YPos == math.Clamp(YPos, -1655, -1576) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(3329, -1840, 596)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3284, 3372) and YPos == math.Clamp(YPos, -1854, -1824) and ZPos == math.Clamp(ZPos, 571, 662) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(3544, -1806, 572)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3506, 3576) and YPos == math.Clamp(YPos, -1845, -1755) and ZPos == math.Clamp(ZPos, 512, 638) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(3514, -2048, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3406, 3571) and YPos == math.Clamp(YPos, -2094, -1984) and ZPos == math.Clamp(ZPos, 512, 687) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(3089, -2254, 668)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3021, 3149) and YPos == math.Clamp(YPos, -2272, -2233) and ZPos == math.Clamp(ZPos, 648, 729) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(3010, -1940, 660)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2972, 3106) and YPos == math.Clamp(YPos, -2010, -1849) and ZPos == math.Clamp(ZPos, 640, 768) )
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(2734, -1741, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2572, 2790) and YPos == math.Clamp(YPos, -2269, -1579) and ZPos == math.Clamp(ZPos, 512, 768) )
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(2558, -1982, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2336, 2560) and YPos == math.Clamp(YPos, -2048, -1902) and ZPos == math.Clamp(ZPos, 514, 695) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(2568, -1504, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2569, 2642) and YPos == math.Clamp(YPos, -1567, -1464) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(2975, -1155, 532)
	CurObjSpot2 = Vector(3649, -1403, 531) 
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2816, 3803) and YPos == math.Clamp(YPos, -1278, -1096) )
end
if CurObjMarker == 18 then
if ExitGateDown == false then
	CurObjSpot = Vector(3267, -127, 532)
	CurObjSpot2 = Vector(2929, 6, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2336, 3328) and YPos == math.Clamp(YPos, -158, 54) )
else
	BaseObjective = "- Assault the Citadel\n- Disable the Suppression Device - Objective Complete"
	RemoveDelay = CurTime() + 5
	CurObjMarker = 25
end
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(3589, 480, 532)
	CurObjSpot2 = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3558, 3621) and YPos == math.Clamp(YPos, 416, 544) )
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(3585, 959, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3517, 3603) and YPos == math.Clamp(YPos, 880, 1054) )
end
if CurObjMarker == 21 then
	CurObjSpot = Vector(2558, 925, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2568, 2873) and YPos == math.Clamp(YPos, 697, 1016) )
end
if CurObjMarker == 22 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2478, 2559) and YPos == math.Clamp(YPos, 843, 1035) )
end
if CurObjMarker == 23 then
	CurObjSpot = Vector(2560, 354, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2542, 2601) and YPos == math.Clamp(YPos, 288, 401) )
end
if CurObjMarker == 24 then
if ExitGateDown == false then
	CurObjSpot = Vector(3267, -127, 532)
	CurObjSpot2 = Vector(2929, 6, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2336, 3328) and YPos == math.Clamp(YPos, -158, 54) )
else
	BaseObjective = "- Assault the Citadel\n- Disable the Suppression Device - Objective Complete"
	RemoveDelay = CurTime() + 5
	CurObjMarker = 25
end
end
if CurObjMarker == 25 then
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Keep Barney Alive - Objective Failed"
	CurObjSpot = Vector(2687, 3, 276)
	CurObjSpot2 = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2560, 2814) and YPos == math.Clamp(YPos, 9, 135) )
end
if CurObjMarker == 26 then
	CurObjSpot = Vector(2691, 784, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2580, 2795) and YPos == math.Clamp(YPos, 787, 960) )
end
if CurObjMarker == 27 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2569, 2636) and YPos == math.Clamp(YPos, 968, 1087) )
end
if CurObjMarker == 28 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = nil
end

if RemoveDelay < CurTime() then
	BaseObjective = string.gsub(BaseObjective, "%\n%- Assault the Combine Nexus %- Objective Complete", "")
	BaseObjective = string.gsub(BaseObjective, "%\n%- Disable the Suppression Device %- Objective Complete", "")
end

cam.Start3D()
if CurObjSpot != nil then
	RoundedDistance = math.Round( ply:GetPos():Distance( CurObjSpot ) / 39.37, 0 )
if RoundedDistance < MarkerDistance then
	render.SetMaterial(Marker)
	render.DrawSprite( CurObjSpot, 14, 60, color_white )
end
end
if CurObjSpot2 != nil then
	RoundedDistance = math.Round( ply:GetPos():Distance( CurObjSpot2 ) / 39.37, 0 )
if RoundedDistance < MarkerDistance then
	render.SetMaterial(Marker)
	render.DrawSprite( CurObjSpot2, 14, 60, color_white )
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