// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge
	local WaveStarted = false

hook.Add("HUDPaint", "City17_06aObj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	WaveStarted = false
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_06a" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Find Barney\n- Assault the Citadel"
	DeathObjective = "- Find Barney - Objective Failed\n- Assault the Citadel - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 19 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(3552, -6373, -236)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3520, 3583) and YPos == math.Clamp(YPos, -6368, -6327) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(3809, -3750, -304)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3648, 4236) and YPos == math.Clamp(YPos, -3836, -3568) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(3983, -2945, -304)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3482, 4042) and YPos == math.Clamp(YPos, -3110, -2792) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(3833, -2184, -285)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3159, 3899) and YPos == math.Clamp(YPos, -2270, -2219) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(3078, -1724, -268)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3031, 3107) and YPos == math.Clamp(YPos, -1756, -1643) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(2798, -704, -268)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2751, 2846) and YPos == math.Clamp(YPos, -688, -642) ) or ( XPos == math.Clamp(XPos, 2967, 3123) and YPos == math.Clamp(YPos, -1663, -670) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(2943, 1783, -300)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2624, 3264) and YPos == math.Clamp(YPos, 1735, 1795) )
end
if CurObjMarker == 8 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
for _,EnemyCheck in pairs(ents.FindByClass("npc_*")) do
if EnemyCheck:GetClass() == "npc_combine_s" then
	CombineCheck = EnemyCheck
end
end
if WaveStarted == false and !IsValid(CombineCheck) then
	WaveStarted = true
end
if WaveStarted == true and IsValid(CombineCheck) then
	ActiveObjective = "- Find Barney\n- Assault the Citadel\n- Survive until the explosives detonate"
	DeathObjective = "- Find Barney - Objective Failed\n- Assault the Citadel - Objective Failed\n- Survive until the explosives detonate - Objective Failed"
end
for _,RubbleCheck in pairs(ents.FindByClass("prop_physics")) do
if RubbleCheck:GetModel() == "models/props_debris/concrete_chunk06d.mdl" then
	RubbleMarked = RubbleCheck
end
end
if !IsValid(RubbleMarked) then
	ActiveObjective = "- Find Barney\n- Assault the Citadel\n- Survive until the explosives detonate - Objective Complete"
	DeathObjective = "- Find Barney - Objective Failed\n- Assault the Citadel - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(2950, 2540, -300)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2624, 3264) and YPos == math.Clamp(YPos, 2482, 2602) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(3099, 3299, -304)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3071, 3136) and YPos == math.Clamp(YPos, 3293, 3368) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(3108, 3671, -304)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2979, 3264) and YPos == math.Clamp(YPos, 3574, 3757) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(2669, 3911, -304)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2624, 3007) and YPos == math.Clamp(YPos, 3896, 3983) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(2945, 5020, -300)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2624, 3264) and YPos == math.Clamp(YPos, 4893, 5182) )
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(2640, 5504, -203)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2624, 2752) and YPos == math.Clamp(YPos, 5460, 5555) )
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(2640, 5281, -106)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2624, 2688) and YPos == math.Clamp(YPos, 5234, 5312) and ZPos == math.Clamp(ZPos, -153, -79) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(2543, 5292, -236)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2496, 2615) and YPos == math.Clamp(YPos, 4276, 5373) and ZPos == math.Clamp(ZPos, -256, -140) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(2485, 2887, -300)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2444, 2528) and YPos == math.Clamp(YPos, 2837, 2916) and ZPos == math.Clamp(ZPos, -320, -192) )
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(2143, 2845, -172)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2120, 2176) and YPos == math.Clamp(YPos, 2820, 2880) )
end
if CurObjMarker == 19 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Survive until the explosives detonate %- Objective Complete", "")
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