// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Ravenholm02AObj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_town_02a" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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

if CurObjMarker < 6 then
for _,GrigoriAlive in pairs(ents.FindByClass( "npc_monk" )) do
	GrigoriHP = (GrigoriAlive:Health() / GrigoriAlive:GetMaxHealth()) * 100
	GrigoriCheck = GrigoriAlive
if GetConVar("ObjSysNoNPCMarker"):GetInt() == 0 and CurObjMarker < 6 then
	SubObjSpot = GrigoriAlive:EyePos() + Vector(0,0,10)
else
	SubObjSpot = nil
end
end
if IsValid(GrigoriCheck) then
	ActiveObjective = "- Find a way out of Ravenholm\n- Keep Father Grigori Alive - HP: " .. GrigoriHP .. " %"
else
	ActiveObjective = "- Find a way out of Ravenholm\n- Keep Father Grigori Alive - Objective Failed"
end
end

if CurObjMarker == 0 then
	DeathObjective = "- Find a way out of Ravenholm - Objective Failed\n- Keep Father Grigori Alive - Objective Failed"
	CurObjMarker = 1
end

if CurObjMarker == 9 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(-5581, 2279, -3226)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5625, -5521) and YPos == math.Clamp(YPos, 2113, 2306) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-6779, 1938, -3377)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6902, -6626) and YPos == math.Clamp(YPos, 1837, 2096) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-7024, 1060, -3319)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7423, -6949) and YPos == math.Clamp(YPos, 908, 1052) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-7356, 51, -3388)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7428, -7249) and YPos == math.Clamp(YPos, -66, 177) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-7805, 930, -3388)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7872, -7765) and YPos == math.Clamp(YPos, 825, 1142) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-7697, -45, -3388)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7844, -7559) and YPos == math.Clamp(YPos, -118, 3) )
end
if CurObjMarker == 7 then
	CurObjTriggerSpot = nil
	SubObjSpot = nil
	ActiveObjective = "- Find a way out of Ravenholm\n- Keep Father Grigori Alive - Objective Complete"
	DeathObjective = "- Find a way out of Ravenholm - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-6723, -447, -3244)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6712, -6640) and YPos == math.Clamp(YPos, -496, -385) )
end
if CurObjMarker == 9 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end

if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Keep Father Grigori alive %- Objective Complete", "")
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

end
end)