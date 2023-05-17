// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local StridersActive = nil
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "City17_12Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	StridersActive = nil
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_12" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	if CurObjMarker == 12 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

for _,StriderBattle in pairs( ents.FindByClass("npc_strider")) do
	if IsValid(StriderBattle) then
StridersAlive = StriderBattle
end
end

if CurObjMarker > 2 and IsValid(StridersAlive) and StridersActive == nil then
	StridersActive = true
	ActiveObjective = ActiveObjective .. "\n- Destroy the Striders"
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Regroup with Barney\n- Destroy the Striders - Objective Failed"
	SubObjSpot = Vector(-2565, 5648, 161)
end
if !IsValid(StridersAlive) and StridersActive == true then
	StridersActive = false
	ActiveObjective = string.gsub(ActiveObjective, "Striders", "Striders - Objective Complete")
	DeathObjective = "- Assault the Citadel - Objective Failed"
	RemoveDelay = CurTime() + 5
	SubObjSpot = nil
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(852, 3387, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 776, 864) and YPos == math.Clamp(YPos, 3315, 3456) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(190, 3702, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 129, 256) and YPos == math.Clamp(YPos, 3642, 3695) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-594, 4455, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1024, 256) and YPos == math.Clamp(YPos, 4373, 4542) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-106, 6262, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1248, 18) and YPos == math.Clamp(YPos, 6239, 6342) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-1029, 8257, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1153, -979) and YPos == math.Clamp(YPos, 7036, 8448) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-1394, 7030, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2432, -1032) and YPos == math.Clamp(YPos, 6911, 7026) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-1400, 5497, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2592, -828) and YPos == math.Clamp(YPos, 5458, 5525) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-2358, 5162, 158)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2592, -2251) and YPos == math.Clamp(YPos, 5080, 5280) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-2362, 6909, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2432, -1032) and YPos == math.Clamp(YPos, 6882, 6978) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-2098, 8520, 144)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2368, -1792) and YPos == math.Clamp(YPos, 8513, 8635) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-2494, 9151, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2574, -2419) and YPos == math.Clamp(YPos, 9143, 9415) )
end
if CurObjMarker == 12 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Destroy the Striders %- Objective Complete", "")
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