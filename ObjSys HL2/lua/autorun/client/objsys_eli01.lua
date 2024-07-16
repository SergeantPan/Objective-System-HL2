// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Eli01Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	AlyxHere = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_eli_01" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Reach Black Mesa East\n>BME is located at the bottom of the dam"
	DeathObjective = "- Reach Black Mesa East - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 12 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(-553, 3272, -1260)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -575, -433) and YPos == math.Clamp(YPos, 3201, 3328))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-64, 2732, -1260)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -183, 32) and YPos == math.Clamp(YPos, 2621, 2799))
end
if CurObjMarker == 3 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Reach Black Mesa East - Objective Complete"
	DeathObjective = "Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 and RemoveDelay < CurTime() then
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 208, 352) and YPos == math.Clamp(YPos, 2000, 2128))
	ActiveObjective = ""
end
if CurObjMarker == 5 then
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 360, 545) and YPos == math.Clamp(YPos, 1575, 1770) and ZPos == math.Clamp(ZPos, -2760, -2710))
end
if CurObjMarker == 6 then
	CurObjTriggerSpot = nil
	RemoveDelay = CurTime() + 53
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 7 and RemoveDelay < CurTime() then
	ActiveObjective = "- Take a look around"
	DeathObjective = "- Take a look around - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 then
for k, v in pairs( ents.FindByClass("npc_alyx") ) do
if v:IsValid() and AlyxHere == nil then
	ActiveObjective = "- Take a look around - Objective Complete"
	DeathObjective = "Objective Failed"
	CurObjMarker = CurObjMarker + 1
	AlyxHere = true
	RemoveDelay = CurTime() + 5
end
end
end
if CurObjMarker == 9 then
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 192, 250) and YPos == math.Clamp(YPos, 2064, 2191))
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-464, 2128, -2716)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -685, -473) and YPos == math.Clamp(YPos, 2064, 2192))
	ActiveObjective = "- Follow Alyx"
	DeathObjective = "- Follow Alyx - Objective Failed"
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-598, 1190, -2668)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -685, -473) and YPos == math.Clamp(YPos, 1167, 1274))
end
if CurObjMarker == 12 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end
if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Reach Black Mesa East %- Objective Complete", "")
	ActiveObjective = string.gsub(ActiveObjective, "%- Take a look around %- Objective Complete", "")
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