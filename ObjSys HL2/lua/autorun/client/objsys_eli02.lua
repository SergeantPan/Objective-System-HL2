// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Eli02Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	ScannersHere = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_eli_02" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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

if !ply:Alive() then
	CurObjective = DeathObjective
else
	CurObjective = ActiveObjective
end
if GetConVar("ObjSysResetOnDeath"):GetInt() == 1 and ply:Alive() then
if CurObjective == DeathObjective then
	RunConsoleCommand("ResetObjectives", "0")
end
end

if CurObjMarker == 0 then
	ActiveObjective = "- Follow Alyx"
	DeathObjective = "- Follow Alyx - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 15 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = nil
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -729, -320) and YPos == math.Clamp(YPos, 703, 880))
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
if ply:HasWeapon( "weapon_physcannon" ) == true then
	ActiveObjective = "- Follow Alyx - Objective Complete"
	DeathObjective = "- Test out the Gravity Gun - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
end
if CurObjMarker == 3 and RemoveDelay < CurTime() then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-134, 809, -2473)
	ActiveObjective = "- Test out the Gravity Gun"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -999, -923) and YPos == math.Clamp(YPos, 166, 300))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -254, -127) and YPos == math.Clamp(YPos, 703, 863))
end
if CurObjMarker == 5 then
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1300, -1158) and YPos == math.Clamp(YPos, 147, 253))
	SubObjSpot = nil
end
if CurObjMarker == 6 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Test out the Gravity Gun - Objective Complete"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 7 and RemoveDelay < CurTime() then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Play with 'Dog'"
for k, v in pairs( ents.FindByClass("npc_cscanner") ) do
if v:IsValid() and ScannersHere == nil then
	ActiveObjective = "- Play with 'Dog' - Objective Complete"
	RemoveDelay = CurTime() + 5
	ScannersHere = true
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 8 and RemoveDelay < CurTime() then
	ActiveObjective = "- Evade the Combine assault"
	CurObjSpot = Vector(-830, 154, -2668)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -916, -715) and YPos == math.Clamp(YPos, 170, 305))
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-600, 881, -2668)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -691, -510) and YPos == math.Clamp(YPos, 776, 874))
end
if CurObjMarker == 10 then
	CurObjSpot = nil
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -684, -517) and YPos == math.Clamp(YPos, 1167, 1239))
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-75, 2124, -2716)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -464, -345) and YPos == math.Clamp(YPos, 2065, 2191))
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 12 and RemoveDelay < CurTime() then
	CurObjSpot = Vector(-1882, 1920, -2716)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2023, -1896) and YPos == math.Clamp(YPos, 1824, 2027))
	ActiveObjective = "- Evade the Combine assault\n- Escape through Ravenholm"
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-3108, 2875, -2716)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -3168, -3040) and YPos == math.Clamp(YPos, 2880, 2958))
	ActiveObjective = "- Evade the Combine assault\n- Escape through Ravenholm"
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-3458, 3790, -2959)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -3458, -3438) and YPos == math.Clamp(YPos, 3790, 3825))
end
if CurObjMarker == 15 then
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
	ActiveObjective = string.gsub(ActiveObjective, "%- Follow Alyx %- Objective Complete", "")
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