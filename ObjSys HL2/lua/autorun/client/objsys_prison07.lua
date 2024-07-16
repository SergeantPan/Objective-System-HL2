// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local WaveStarted = false
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Prison07Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	WaveStarted = false
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_prison_07" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Fight your way to the Combine Teleporter\n- Use the teleporter to escape Nova Prospekt"
	DeathObjective = "- Fight your way to the Combine Teleporter - Objective Failed\n- Use the teleporter to escape Nova Prospekt - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 22 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(-450, -2629, -220)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -534, -343) and YPos == math.Clamp(YPos, -2712, -2561) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-441, -3082, -148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -496, -368) and YPos == math.Clamp(YPos, -3111, -3071) )
end
if CurObjMarker == 3 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
for _,EnemyCheck in pairs(ents.FindByClass("npc_*")) do
if EnemyCheck:GetClass() == "npc_combine_s" then
	CombineCheck = EnemyCheck
end
if EnemyCheck:GetClass() == "npc_alyx" then
	AlyxCheck = EnemyCheck
end
end
if WaveStarted == false and IsValid(CombineCheck) then
	WaveStarted = true
end
if WaveStarted == true and !IsValid(CombineCheck) then
	ActiveObjective = "- Fight your way to the Combine Teleporter\n- Use the teleporter to escape Nova Prospekt\n- Survive the Combine assault"
	DeathObjective = "- Fight your way to the Combine Teleporter - Objective Failed\n- Use the teleporter to escape Nova Prospekt - Objective Failed\n- Survive the Combine assault - Objective Failed"
end
if IsValid(AlyxCheck) then
	ActiveObjective = "- Fight your way to the Combine Teleporter\n- Use the teleporter to escape Nova Prospekt\n- Survive the Combine assault - Objective Complete"
	DeathObjective = "- Fight your way to the Combine Teleporter - Objective Failed\n- Use the teleporter to escape Nova Prospekt - Objective Failed"
	CurObjMarker = CurObjMarker + 1
	RemoveDelay = CurTime() + 5
end
end
if CurObjMarker == 4 then
	WaveStarted = false
for _,GateCheck in pairs(ents.FindByClass("prop_dynamic")) do
	if GateCheck:GetPos() == Vector(30.532200, -3794.699951, -272.117004) and GateCheck:GetSkin() == 1 then
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(36, -3905, -276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 34, 107) and YPos == math.Clamp(YPos, -4016, -3824) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(1024, -3917, -276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1028, 1089) and YPos == math.Clamp(YPos, -4016, -3824) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(1262, -3150, -276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1266, 1309) and YPos == math.Clamp(YPos, -3199, -3121) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(1254, -3152, -660)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1173, 1248) and YPos == math.Clamp(YPos, -3208, -3056) and ZPos == math.Clamp(ZPos, -680, -552) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(1259, -3316, -660)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1266, 1356) and YPos == math.Clamp(YPos, -3360, -3265) and ZPos == math.Clamp(ZPos, -680, -557) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(1645, -3371, -660)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1608, 1696) and YPos == math.Clamp(YPos, -3424, -3376) and ZPos == math.Clamp(ZPos, -680, -552) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(2064, -3730, -788)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2007, 2096) and YPos == math.Clamp(YPos, -3872, -3504) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(2891, -3832, -852)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2861, 2920) and YPos == math.Clamp(YPos, -3872, -3792) and ZPos == math.Clamp(ZPos, -872, -768) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(3079, -3498, -780)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3039, 3122) and YPos == math.Clamp(YPos, -3487, -3427) and ZPos == math.Clamp(ZPos, -800, -680) )
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(3333, -3407, -780)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3344, 3445) and YPos == math.Clamp(YPos, -3444, -3376) and ZPos == math.Clamp(ZPos, -799, -681) )
end
if CurObjMarker == 15 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(3374, -3415, -401)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(3481, -3409, -524)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3489, 3555) and YPos == math.Clamp(YPos, -3450, -3358) and ZPos == math.Clamp(ZPos, -544, -416) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 3344, 3472) and YPos == math.Clamp(YPos, -3455, -3351) and ZPos == math.Clamp(ZPos, -416, -290) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(4547, -3629, -524)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4516, 4551) and YPos == math.Clamp(YPos, -3760, -3504) and ZPos == math.Clamp(ZPos, -544, -323) )
	SubObjSpot = nil
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(4448, -3839, -396)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3776, 4543) and YPos == math.Clamp(YPos, -3849, -3771) and ZPos == math.Clamp(ZPos, -416, -293) )
end
if CurObjMarker == 19 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
for _,EnemyCheck in pairs(ents.FindByClass("npc_*")) do
if EnemyCheck:GetClass() == "npc_combine_s" then
	CombineCheck = EnemyCheck
end
if EnemyCheck:GetClass() == "npc_alyx" then
	AlyxCheck = EnemyCheck
end
end
if WaveStarted == false and !IsValid(CombineCheck) then
	WaveStarted = true
end
if WaveStarted == true and IsValid(CombineCheck) then
	ActiveObjective = "- Fight your way to the Combine Teleporter\n- Use the teleporter to escape Nova Prospekt\n- Survive the Combine assault"
	DeathObjective = "- Fight your way to the Combine Teleporter - Objective Failed\n- Use the teleporter to escape Nova Prospekt - Objective Failed\n- Survive the Combine assault - Objective Failed"
end
if AlyxCheck:GetPos().z < -420 then
	ActiveObjective = "- Fight your way to the Combine Teleporter\n- Use the teleporter to escape Nova Prospekt\n- Survive the Combine assault - Objective Complete"
	DeathObjective = "- Fight your way to the Combine Teleporter - Objective Failed\n- Use the teleporter to escape Nova Prospekt - Objective Failed"
	CurObjMarker = CurObjMarker + 1
	RemoveDelay = CurTime() + 5
end
end
if CurObjMarker == 20 then
	WaveStarted = false
for _,GateCheck2 in pairs(ents.FindByClass("prop_dynamic")) do
	if GateCheck2:GetPos() == Vector(3646.439941, -4419.560059, -484.618011) then
	CurObjSpot = Vector(3646, -4327, -524)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3546, 3642) and YPos == math.Clamp(YPos, -4432, -4240) and ZPos == math.Clamp(ZPos, -543, -425) )
	ActiveObjective = "- Fight your way to the Combine Teleporter\n- Use the teleporter to escape Nova Prospekt\n- Find and confront Dr. Mossman"
	DeathObjective = "- Fight your way to the Combine Teleporter - Objective Failed\n- Use the teleporter to escape Nova Prospekt - Objective Failed\n- Find and confront Dr. Mossman - Objective Failed"
end
end
end
if CurObjMarker == 21 then
	CurObjSpot = Vector(3993, -4341, -676)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3964, 4035) and YPos == math.Clamp(YPos, -4432, -4240) and ZPos == math.Clamp(ZPos, -639, -635) )
end
if CurObjMarker == 22 then
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
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Survive the Combine assault %- Objective Complete", "")
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