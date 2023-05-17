// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local GunshipDestroyed = false

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Prison01Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	GunshipDestroyed = false
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_prison_01" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Reach Nova Prospekt"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 11 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(2910, -4433, 1102)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2834, 2992) and YPos == math.Clamp(YPos, -4530, -4368) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(2913, -3678, 1092)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2835, 2994) and YPos == math.Clamp(YPos, -3758, -3597) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(1913, -3675, 1092)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1792, 2042) and YPos == math.Clamp(YPos, -3750, -3499) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(1729, -3293, 1300)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1664, 1792) and YPos == math.Clamp(YPos, -3352, -3200) )
end
if CurObjMarker == 5 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Reach Nova Prospekt - Objective Complete"
	DeathObjective = "- Find Alyx - Objective Failed\n- Find Eli - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(4024, -3624, 1302)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3967, 4096) and YPos == math.Clamp(YPos, -3711, -3552) )
end
if CurObjMarker == 7 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
for _,Gunship in pairs(ents.FindByClass("func_breakable")) do
if Gunship:GetPos() == Vector(1729.000000, -2048.000000, 1600.000000) then
	WallCheck = Gunship
end
end
if IsValid(WallCheck) then
	ActiveObjective = "- Find Alyx\n- Find Eli\n- Destroy the Gunships"
	DeathObjective = "- Find Alyx - Objective Failed\n- Find Eli - Objective Failed\n- Destroy the Gunships - Objective Failed"
else
	ActiveObjective = "- Find Alyx\n- Find Eli\n- Destroy the Gunships - Objective Complete"
	DeathObjective = "- Find Alyx - Objective Failed\n- Find Eli - Objective Failed"
	CurObjMarker = CurObjMarker + 1
	RemoveDelay = CurTime() + 5
end
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(1635, -2043, 1620)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1538, 1712) and YPos == math.Clamp(YPos, -2103, -1984) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(1530, -1916, 1620)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1491, 1574) and YPos == math.Clamp(YPos, -1967, -1866) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(1525, -1490, 1620)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1450, 1527) and YPos == math.Clamp(YPos, -1600, -1409) )
end
if CurObjMarker == 11 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Reach Nova Prospekt %- Objective Complete", "- Find Alyx\n- Find Eli")
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Destroy the Gunships %- Objective Complete", "")
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