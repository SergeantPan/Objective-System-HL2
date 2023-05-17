// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge
	local FinaleStarted = false

hook.Add("HUDPaint", "Breen01Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	RemoveDelay = math.huge
	FinaleStarted = false
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_breen_01" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

	local Alpha = Color( GetConVar("ObjFontColorR"):GetInt(), GetConVar("ObjFontColorG"):GetInt(), GetConVar("ObjFontColorB"):GetInt(), GetConVar("ObjFontColorA"):GetInt() )

	local Width = GetConVar("ObjSysTextXPos"):GetFloat()
	local Height = GetConVar("ObjSysTextYPos"):GetFloat()

	local ply = LocalPlayer()

	local XPos = math.Round(tostring(ply:GetPos().x), 0)
	local YPos = math.Round(tostring(ply:GetPos().y), 0)
	local ZPos = math.Round(tostring(ply:GetPos().z), 0) + 3

// Start the objective stuff
if ActiveObjective != "" then
	draw.DrawText( "Current Objectives:", "ObjSysBig", ScrW() * Width, ScrH() * Height, Alpha, 0 )
	draw.DrawText( "__________________", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.01), Alpha, 0 )
end

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

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

if CurObjMarker == 0 then
	ActiveObjective = "- Rescue Alyx and Eli\n- Kill Breen"
	DeathObjective = "- Rescue Alyx and Eli - Objective Failed\n- Kill Breen - Objective Failed"
	CurObjMarker = 1
end

for _,Breen in pairs(ents.FindByClass("npc_breen")) do
	BreenText = Breen
end

if CurObjMarker > 18 then
for _,Core in pairs(ents.FindByClass("func_physbox")) do
	if Core:GetPos() == Vector(0, 0, 1400.000122) then
TheCore = Core
end
end
end

if IsValid(TheCore) and FinaleStarted == false then
	FinaleStarted = true
end
if !IsValid(TheCore) and FinaleStarted == true then
	ActiveObjective = "- Prevent Breen's escape - Objective Complete\n- Destroy the Dark Matter Core - Objective Complete"
	DeathObjective = ""
	RemoveDelay = CurTime() + 5
	FinaleStarted = over
end
if FinaleStarted == true and !IsValid(BreenText) then
	ActiveObjective = "- Prevent Breen's escape - Objective Failed\n- Destroy the Dark Matter Core - Objective  Failed"
	DeathObjective = ""
end

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = nil
	CurObjTriggerSpot = ZPos > 550
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Rescue Alyx and Eli - Objective Failed\n- Kill Breen - Objective Failed"
	DeathObjective = "Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2032, -1904) and YPos == math.Clamp(YPos, -64, 63) )
end
if CurObjMarker == 4 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Give chase to Breen"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-1172, -1, 1364)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1160, -1132) and YPos == math.Clamp(YPos, -64, 87) )
end
if CurObjMarker == 6 then
	CurObjSpot = nil
	ActiveObjective = "- Give chase to Breen - Objective Failed"
	CurObjMarker = CurObjMarker + 1
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 7 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1152, -992) and YPos == math.Clamp(YPos, 253, 383) and ZPos == math.Clamp(ZPos, -255, -32) )
end
if CurObjMarker == 8 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -689, -575) and YPos == math.Clamp(YPos, -784, -590) )
end
if CurObjMarker == 9 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Prevent Breen's escape"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(751, -220, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 798, 978) and YPos == math.Clamp(YPos, -322, -44) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(208, 524, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 103, 320) and YPos == math.Clamp(YPos, 427, 659) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-425, 781, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -510, -318) and YPos == math.Clamp(YPos, 770, 779) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-687, 479, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -768, -221) and YPos == math.Clamp(YPos, 511, 739) )
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(0, -479, 278)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -68, 112) and YPos == math.Clamp(YPos, -603, -413) )
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(66, 190, 536)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -76, 231) and YPos == math.Clamp(YPos, 91, 188) and ZPos == math.Clamp(ZPos, 516, 603) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(-358, 0, 792)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -590, -199) and YPos == math.Clamp(YPos, -61, 62) and ZPos == math.Clamp(ZPos, 768, 924) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(-647, -469, 1300)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -770, -516) and YPos == math.Clamp(YPos, -514, -318) and ZPos == math.Clamp(ZPos, 1281, 1374) )
end
if CurObjMarker == 18 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Prevent Breen's escape\n- Destroy the Dark Matter Core"
	DeathObjective = "- Prevent Breen's escape - Objective Failed\n- Destroy the Dark Matter Core - Objective Failed"
	CurObjMarker = CurObjMarker + 1
	RemoveDelay = math.huge
end
if CurObjMarker == 19 and RemoveDelay < CurTime() then
	ActiveObjective = ""
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = nil
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Rescue Alyx and Eli %- Objective Failed%\n%- Kill Breen %- Objective Failed", "")
	ActiveObjective = string.gsub(ActiveObjective, "%- Give chase to Breen %- Objective Failed", "")
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