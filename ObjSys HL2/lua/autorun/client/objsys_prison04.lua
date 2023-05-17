// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "Prison04Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_prison_04" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Find Alyx\n- Find Eli"
	DeathObjective = "- Find Alyx - Objective Failed\n- Find Eli - Objective Failed"
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
	CurObjSpot = Vector(-735, 1152, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -830, -640) and YPos == math.Clamp(YPos, 1153, 1237) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-632, 2561, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -616, -552) and YPos == math.Clamp(YPos, 2496, 2622) and ZPos == math.Clamp(ZPos, 128, 236) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-98, 2369, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -192, -1) and YPos == math.Clamp(YPos, 2307, 2364) and ZPos == math.Clamp(ZPos, 128, 225) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-94, 1603, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -190, 0) and YPos == math.Clamp(YPos, 1535, 1600) and ZPos == math.Clamp(ZPos, 128, 221) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-633, 1567, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -719, -640) and YPos == math.Clamp(YPos, 1521, 1602) and ZPos == math.Clamp(ZPos, 256, 375) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-850, 3269, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -928, -767) and YPos == math.Clamp(YPos, 3136, 3370) and ZPos == math.Clamp(ZPos, 384, 510) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-636, 2530, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -637, -518) and YPos == math.Clamp(YPos, 2497, 2621) and ZPos == math.Clamp(ZPos, 385, 512) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-150, 2347, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -192, 0) and YPos == math.Clamp(YPos, 2236, 2367) and ZPos == math.Clamp(ZPos, 384, 505) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-144, 1556, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -210, -1) and YPos == math.Clamp(YPos, 1411, 1599) and ZPos == math.Clamp(ZPos, 384, 516) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-633, 1566, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -719, -640) and YPos == math.Clamp(YPos, 1523, 1602) and ZPos == math.Clamp(ZPos, 384, 506) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-1100, 2178, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1178, -1104) and YPos == math.Clamp(YPos, 2113, 2240) and ZPos == math.Clamp(ZPos, 384, 571) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-1371, 2111, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1472, -1344) and YPos == math.Clamp(YPos, 2048, 2108) and ZPos == math.Clamp(ZPos, 384, 512) )
end
if CurObjMarker == 13 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-1282, 1620, 452)
for _,GateAgain in pairs(ents.FindByClass("prop_dynamic")) do
	if GateAgain:GetModel() == "models/props_wasteland/prison_slidingdoor001a.mdl" and GateAgain:GetPos() == Vector(-1472.000000, 2632.419922, 443.381989) then
	SubObjSpot = nil
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-1344, 2638, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1446, -1248) and YPos == math.Clamp(YPos, 2629, 2735) and ZPos == math.Clamp(ZPos, 384, 544) )
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