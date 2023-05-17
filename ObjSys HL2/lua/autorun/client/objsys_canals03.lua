// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local SubObjective = ""

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Canals03Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjective = ""
	SubObjSpot = nil
	SubObjSpot2 = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_03" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	RunConsoleCommand("ResetObjectives", "1")
end
end
if !ply:Alive() then
	CurObjective = DeathObjective
else
	CurObjective = ActiveObjective
end

if CurObjMarker == 0 then
	ActiveObjective = "- Evade the Metropolice\n- Continue through the canals\n>There may be other rebel hideouts ahead"
	DeathObjective = "- Evade the Metropolice - Objective Failed\n- Continue through the canals - Objective Failed"
	CurObjMarker = 1
end
if CurObjMarker == 29 then // Final number
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
	CurObjSpot = Vector(-650, 3446, -828)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -671, -619) and YPos == math.Clamp(YPos, 3401, 3491))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-565, 2834, -828)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -602, -548) and YPos == math.Clamp(YPos, 2800, 2863))
	ActiveObjective = string.gsub(ActiveObjective,"%\n%>There may be other rebel hideouts ahead", "")
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = nil
	ActiveObjective = string.gsub(ActiveObjective,"canals","canals\n>The underground is flooded with manhacks")
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(343, 2471, -812)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 294, 375) and YPos == math.Clamp(YPos, 2428, 2520))
end
if CurObjMarker == 5 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-1337, 1295, -840)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-1449, 933, -832)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1478, -1399) and YPos == math.Clamp(YPos, 941, 952))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -1416, -1267) and YPos == math.Clamp(YPos, 1272, 1311))
end
if CurObjMarker == 7 then
	CurObjTriggerSpot = nil
	SubObjective = SubObjective .. "\n- That vent might lead to a stash"
	SubObjSpot = Vector(-1537, 697, -830)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-1588, 520, -1055)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1654, -1488) and YPos == math.Clamp(YPos, 463, 590) and ZPos < -900)
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -1852, -1819) and YPos == math.Clamp(YPos, 800, 840))
end
if CurObjMarker == 9 then
	SubObjective = SubObjective .. "\n- There might be something in that tunnel"
	SubObjSpot2 = Vector(-1782, 260, -1020)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-1165, -800, -1041)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1230, -1122) and YPos == math.Clamp(YPos, -896, -704))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -1852, -1819) and YPos == math.Clamp(YPos, 800, 840))
	SubObjTriggerSpot2 = (XPos == math.Clamp(XPos, -2274, -2137) and YPos == math.Clamp(YPos, 616, 790))
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-833, -623, -1259)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -868, -804) and YPos == math.Clamp(YPos, -637, -606))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -1852, -1819) and YPos == math.Clamp(YPos, 800, 840))
	SubObjTriggerSpot2 = (XPos == math.Clamp(XPos, -2274, -2137) and YPos == math.Clamp(YPos, 616, 790))
end
if CurObjMarker == 12 then
	CurObjTriggerSpot = nil
	SubObjective = string.gsub(SubObjective, "stash", "stash - Objective Failed")
	SubObjective = string.gsub(SubObjective, "tunnel", "tunnel - Objective Failed")
	SubObjSpot = nil
	SubObjSpot2 = nil
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-1050, -61, -1004)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1104, -1044) and YPos == math.Clamp(YPos, -96, -32) and ZPos > -1040)
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-880, 1108, -880)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -927, -833) and YPos == math.Clamp(YPos, 1089, 1152))
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(-426, -538, -998)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -305, -200) and YPos == math.Clamp(YPos, -448, -352))
end
if CurObjMarker == 16 then
	SubObjective = SubObjective .. "\n- Looks like there's something hidden back there"
	SubObjSpot = Vector(-174, -402, -1010)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(-426, -538, -998)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -556, -492) and YPos == math.Clamp(YPos, -560, -496))
	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -194, -147) and YPos == math.Clamp(YPos, -447, -353))
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(-429, -897, -967)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -449, -392) and YPos == math.Clamp(YPos, -928, -849))
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(-1273, -1156, -940)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -1318, -1283) and YPos == math.Clamp(YPos, -1178, -1129))
end
if CurObjMarker == 20 then
	CurObjSpot = Vector(-1949, -901, -858)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2015, -1959) and YPos == math.Clamp(YPos, -935, -872))
end
if CurObjMarker == 21 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = string.gsub(ActiveObjective, "Metropolice", "Metropolice - Objective Complete")
	DeathObjective = "- Continue through the canals - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 22 and RemoveDelay < CurTime() then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals\n- Find a way to raise the waterlevel"
	DeathObjective = "- Continue through the canals - Objective Failed\n- Find a way to raise the waterlevel - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 23 then
	CurObjSpot = Vector(-2312, -550, -1116)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2367, -2272) and YPos == math.Clamp(YPos, -575, -501))
end
if CurObjMarker == 24 then
	CurObjSpot = Vector(-2210, -33, -1450)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2230, -2112) and YPos == math.Clamp(YPos, -73, 52) and ZPos == math.Clamp(ZPos, -1545, -1404))
end
if CurObjMarker == 25 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = string.gsub(ActiveObjective, "waterlevel", "waterlevel - Objective Complete")
	DeathObjective = "- Continue through the canals - Objective Failed"
	CurObjMarker = CurObjMarker + 1
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 26 and RemoveDelay < CurTime() then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 27 then
	CurObjSpot = Vector(-2499, -202, -1483)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2557, -2436) and YPos == math.Clamp(YPos, -511, -77) and ZPos == math.Clamp(ZPos, -1510, -1440))
end
if CurObjMarker == 28 then
	CurObjSpot = Vector(-2883, 111, -1052)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2948, -2881) and YPos == math.Clamp(YPos, 81, 144))
end
if CurObjMarker == 29 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end
if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end

if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjective = string.gsub(SubObjective, "stash", "stash - Objective Complete")
	SubObjective = string.gsub(SubObjective, "back there", "back there - Objective Complete")
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
if SubObjTriggerSpot2 and SubObjSpot2 != nil then
	SubObjective = string.gsub(SubObjective, "tunnel", "tunnel - Objective Complete")
	SubObjSpot2 = nil
	RemoveDelay = CurTime() + 5
end
if RemoveDelay < CurTime() then
	SubObjective = string.gsub(SubObjective, "%\n%- That vent might lead to a stash %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- That vent might lead to a stash %- Objective Failed", "")
	SubObjective = string.gsub(SubObjective, "%\n%- There might be something in that tunnel %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- There might be something in that tunnel %- Objective Failed", "")
	SubObjective = string.gsub(SubObjective, "%\n%- Looks like there's something hidden back there %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- Looks like there's something hidden back there %- Objective Failed", "")
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
if SubObjSpot2 != nil then
	RoundedDistance = math.Round( ply:GetPos():Distance( SubObjSpot2 ) / 39.37, 0 )
if RoundedDistance < MarkerDistance then
	render.SetMaterial(CuriosityMarker)
	render.DrawSprite( SubObjSpot2, 14, 20, color_white )
end
end
cam.End3D()

end // GetMap end
end)