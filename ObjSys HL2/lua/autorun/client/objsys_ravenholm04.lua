// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local SubObjective = ""

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Ravenholm04Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjective = ""
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_town_04" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Find a way out of Ravenholm"
	DeathObjective = "- Find a way out of Ravenholm - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 13 then // Final number
	ActiveObjective = "- Proceed to the next level"
end
if SubObjective != "" then
	draw.DrawText( "Side Objectives:", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.15), Alpha, 0 )
	draw.DrawText( "__________________", "ObjSysBig", ScrW() * Width, ScrH() * (Height + 0.16), Alpha, 0 )
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )
	draw.DrawText( SubObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.17), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then // Just examples
	CurObjSpot = Vector(614, -1270, -4780)
	CurObjTriggerSpot = ZPos < -4650
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(418, -1614, -4774)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(1161, -608, -4908)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1119, 1187) and YPos == math.Clamp(YPos, -639, -576) and ZPos > -4930)
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 259, 481) and YPos == math.Clamp(YPos, -1694, -1570) and ZPos == math.Clamp(ZPos, -4800, -4687) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(1534, -635, -5076)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1470, 1554) and YPos == math.Clamp(YPos, -780, -520) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 259, 481) and YPos == math.Clamp(YPos, -1694, -1570) and ZPos == math.Clamp(ZPos, -4800, -4687) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(1917, 7, -5100)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1793, 2046) and YPos == math.Clamp(YPos, -55, 49) )
	SubObjSpot = nil
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(1919, 156, -5893)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1793, 2032) and YPos == math.Clamp(YPos, -3, 242) and ZPos == math.Clamp(ZPos, -6138, -5859) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(1882, -378, -6124)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1794, 2044) and YPos == math.Clamp(YPos, -509, -251) and ZPos == math.Clamp(ZPos, -6143, -5895) )
end
if CurObjMarker == 8 then
	SubObjSpot = Vector(2548, -349, -5375)
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(2439, -295, -6124)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2342, 2490) and YPos == math.Clamp(YPos, -321, -251) and ZPos == math.Clamp(ZPos, -6145, -5806) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(2439, 1112, -5856)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 2304, 2574) and YPos == math.Clamp(YPos, 992, 1334) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 2497, 2576) and YPos == math.Clamp(YPos, -410, -257) and ZPos == math.Clamp(ZPos, -5386, -5287) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(1169, 1153, -5860)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 1126, 1186) and YPos == math.Clamp(YPos, 1029, 1278) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 2497, 2576) and YPos == math.Clamp(YPos, -410, -257) and ZPos == math.Clamp(ZPos, -5386, -5287) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-2145, 1156, -4836)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2186, -2119) and YPos == math.Clamp(YPos, 1024, 1280) )
end
if CurObjMarker == 13 then
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
	ActiveObjective = string.gsub(ActiveObjective, "%- Find a way to move that platform %- Objective Complete", "")
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