// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local StridersActive = false
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "City17_13Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	StridersActive = false
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_13" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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

for _,StriderBattle in pairs( ents.FindByClass("npc_strider")) do
	if IsValid(StriderBattle) then
StridersAlive = StriderBattle
end
end

if CurObjMarker > 19 and IsValid(StridersAlive) and StridersActive == false then
	SubObjSpot = Vector(5336, -846, 279)
	StridersActive = true
end
if !IsValid(StridersAlive) and StridersActive == true then
	StridersActive = false
	ActiveObjective = string.gsub(ActiveObjective, "Striders", "Striders - Objective Complete")
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
	SubObjSpot = nil
end

if CurObjMarker == 0 then
	ActiveObjective = "- Assault the Citadel\n- Regroup with Barney"
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Regroup with Barney - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 25 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(4847, -2707, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4798, 4892) and YPos == math.Clamp(YPos, -2755, -2649) )
end
if CurObjMarker == 2 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4733, 4800) and YPos == math.Clamp(YPos, -2781, -2642) )
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Assault the Citadel\n- Regroup with Barney\n- Fight through to the horse statue\n- Evade the Striders"
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Regroup with Barney - Objective Failed\n- Fight through to the horse statue - Objective Failed\n- Evade the Striders - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(4767, -1485, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4677, 4920) and YPos == math.Clamp(YPos, -1539, -1379) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(4930, -220, -108)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4918, 5309) and YPos == math.Clamp(YPos, -880, 240) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(5152, -1163, -108)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4944, 5312) and YPos == math.Clamp(YPos, -1268, -1086) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(5334, -1814, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5313, 5435) and YPos == math.Clamp(YPos, -2432, -1536) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(6395, -1808, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6335, 6471) and YPos == math.Clamp(YPos, -2112, -1536) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(6705, -736, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6464, 6912) and YPos == math.Clamp(YPos, -805, -631) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(6616, -191, -105)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6464, 6816) and YPos == math.Clamp(YPos, -376, -1) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(6024, -576, -108)
	CurObjTriggerSpot = ZPos < -150
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(6038, -1096, -108)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5821, 6448) and YPos == math.Clamp(YPos, -1171, -912) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(5563, -1393, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5523, 5672) and YPos == math.Clamp(YPos, -1520, -904) and ZPos == math.Clamp(ZPos, -2, 87) )
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(6147, -1281, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6088, 6200) and YPos == math.Clamp(YPos, -1349, -1244) and ZPos == math.Clamp(ZPos, 0, 119) )
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(6401, -1222, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6335, 6448) and YPos == math.Clamp(YPos, -1520, -1178) and ZPos == math.Clamp(ZPos, 130, 250) )
end
if CurObjMarker == 16 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5994, 6200) and YPos == math.Clamp(YPos, 8, 109) and ZPos == math.Clamp(ZPos, 0, 126) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(5300, 177, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5186, 5297) and YPos == math.Clamp(YPos, 118, 240) and ZPos == math.Clamp(ZPos, 0, 100) )
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(5475, -845, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5480, 5546) and YPos == math.Clamp(YPos, -888, -800) and ZPos == math.Clamp(ZPos, 0, 128) )
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(5769, -576, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5677, 5823) and YPos == math.Clamp(YPos, -842, -392) and ZPos == math.Clamp(ZPos, 256, 358) )
end
if CurObjMarker == 20 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Assault the Citadel\n- Regroup with Barney\n- Fight through to the horse statue\n- Destroy the Striders"
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Regroup with Barney - Objective Failed\n- Fight through to the horse statue - Objective Failed\n- Destroy the Striders - Objective Failed"
end
if CurObjMarker == 21 then
	CurObjSpot = Vector(5080, 250, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5040, 5238) and YPos == math.Clamp(YPos, 241, 357) )
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Regroup with Barney - Objective Failed\n- Fight through to the horse statue - Objective Failed"
end
if CurObjMarker == 22 then
	CurObjSpot = Vector(6330, 974, 16)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6285, 6398) and YPos == math.Clamp(YPos, 256, 1408) )
end
if CurObjMarker == 23 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Assault the Citadel\n- Regroup with Barney - Objective Complete\n- Fight through to the horse statue - Objective Complete"
	DeathObjective = "- Assault the Citadel - Objective Failed"
	CurObjMarker = CurObjMarker + 1
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 24 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8320, 8447) and YPos == math.Clamp(YPos, 960, 1088) )
end
if CurObjMarker == 25 then
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
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Destroy the Striders %- Objective Complete", "")
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Regroup with Barney %- Objective Complete%\n%- Fight through to the horse statue %- Objective Complete", "")
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