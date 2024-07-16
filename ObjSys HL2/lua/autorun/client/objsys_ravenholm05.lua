// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local SubObjective = ""

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Ravenholm05Obj", function(ply)

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
	if game.GetMap() == "d1_town_05" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	if CurObjMarker == 19 then // Final number
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

if CurObjMarker == 1 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -11307, -11230) and YPos == math.Clamp(YPos, 4224, 4480) )
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find a way out of Ravenholm - Objective Complete"
	DeathObjective = "- Follow the traintracks - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 and RemoveDelay < CurTime() then
	CurObjSpot = Vector(-12158, 4987, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -12359, -11962) and YPos == math.Clamp(YPos, 4942, 5057) )
	ActiveObjective = "- Follow the traintracks\n>There seems to be no other option"
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-11560, 6615, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -11605, -11457) and YPos == math.Clamp(YPos, 6442, 6808) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-9956, 7123, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -10013, -9878) and YPos == math.Clamp(YPos, 6937, 7334) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-8193, 7365, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -8190, -8163) and YPos == math.Clamp(YPos, 7193, 7605) )
end
if CurObjMarker == 7 then
	CurObjSpot = nil
	SubObjSpot = Vector(-7852, 7720, 896)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7938, -7683) and YPos == math.Clamp(YPos, 7444, 7717) )
end
if CurObjMarker == 8 then
	SubObjSpot = Vector(-7426, 7931, 896)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7478, -7219) and YPos == math.Clamp(YPos, 7680, 7951) )
end
if CurObjMarker == 9 then
	SubObjSpot = nil
	CurObjSpot = Vector(-6153, 8146, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6174, -6100) and YPos == math.Clamp(YPos, 7953, 8359) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-5382, 8125, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5511, -5269) and YPos == math.Clamp(YPos, 8078, 8195) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-4559, 8024, 926)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4585, -4534) and YPos == math.Clamp(YPos, 7946, 8129) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-3542, 7785, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3604, -3500) and YPos == math.Clamp(YPos, 7459, 7806) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-2438, 7294, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2501, -2426) and YPos == math.Clamp(YPos, 7031, 7820) )
end
if CurObjMarker == 14 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Follow the traintracks - Objective Complete"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 15 and RemoveDelay < CurTime() then
	CurObjSpot = Vector(-583, 7405, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -757, -426) and YPos == math.Clamp(YPos, 7284, 7502) )
	ActiveObjective = "- Enter the warehouse"
	DeathObjective = "- Enter the warehouse - Objective failed"
end
if CurObjMarker == 16 then
	SubObjSpot = Vector(494, 7722, 896)
	CurObjTriggerSpot = nil
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(-2016, 8834, 916)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2068, -1977) and YPos == math.Clamp(YPos, 8840, 8940) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, 505, 640) and YPos == math.Clamp(YPos, 7674, 7743) )
end
if CurObjMarker == 18 then
	CurObjSpot = nil
	SubObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -1727, -1649) and YPos == math.Clamp(YPos, 10768, 10846) )
end
if CurObjMarker == 19 then
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