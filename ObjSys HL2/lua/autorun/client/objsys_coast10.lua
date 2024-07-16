// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local AssaultStarted = false
	local GunshipDead = false

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Coast10Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	AssaultStarted = false
	GunshipDead = false
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_coast_10" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point\n>There should be a Rebel base at the lighthouse"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Reach Lighthouse Point - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 8 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(5375, -1490, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 3709, 5631) and YPos == math.Clamp(YPos, -1544, -1368) )
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Reach Nova Prospekt\n- Reach Lighthouse Point - Objective Complete"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(4874, -229, 936)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4738, 4983) and YPos == math.Clamp(YPos, -331, -128) )
end
if CurObjMarker == 4 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
for _,Dropship in pairs(ents.FindByClass("npc_combinedropship")) do
if AssaultStarted == false and IsValid(Dropship) then
	AssaultStarted = true
	ActiveObjective = "- Reach Nova Prospekt\n- Survive the Combine assault"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed\n- Survive the Combine assault - Objective Failed"
end
end
for _,GunshipBody in pairs(ents.FindByClass("prop_physics")) do
if GunshipBody:GetModel() == "models/gibs/gunship_gibs_midsection.mdl" and AssaultStarted == true then
	ActiveObjective = "- Reach Nova Prospekt\n- Survive the Combine Assault - Objective Complete"
	AssaultStarted = false
	GunshipDead = true
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 5 and GunshipDead == true and RemoveDelay < CurTime() then
	ActiveObjective = "- Reach Nova Prospekt"
	DeathObjective = "- Reach Nova Prospekt - Objective Failed"
	CurObjSpot = Vector(8371, 1577, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8075, 8371) and YPos == math.Clamp(YPos, 1360, 1651) and ZPos < 980)
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(8225, 1710, 980)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8198, 8260) and YPos == math.Clamp(YPos, 1736, 1761) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(6063, 2131, 578)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5907, 6151) and YPos == math.Clamp(YPos, 2170, 2245) )
end
if CurObjMarker == 8 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	SubObjective = ""
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Reach Lighthouse Point %- Objective Complete", "")
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