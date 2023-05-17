// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local SubObjective = ""

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Canals06Obj", function(ply)

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
	if game.GetMap() == "d1_canals_06" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME"
	SubObjective = "\n- Reach Station 7\n>The rebel mentioned Station 7, the 'Red Old Barn', would have help"
	DeathObjective = "- Continue through the canals - Objective Failed"
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
	CurObjSpot = Vector(8022, 9082, -459)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 7935, 8111) and YPos == math.Clamp(YPos, 8961, 9218))
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	SubObjective = "\n- Reach Station 7\n>That looks like the barn the rebel mentioned"
	SubObjSpot = Vector(4668, 6187, -172)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(1781, 1478, -273)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 966, 1760) and YPos == math.Clamp(YPos, 552, 2514))

	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 4608, 4716) and YPos == math.Clamp(YPos, 6136, 6240) and ZPos == math.Clamp(ZPos, -212, -172))
	SubObjTriggerSpot1 = (XPos == math.Clamp(XPos, 4547, 4660) and YPos == math.Clamp(YPos, 5891, 6030) and ZPos == math.Clamp(ZPos, 86, 170))
end
if CurObjMarker == 4 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME\n- Use the ramp to cross the gap\n>Those blue barrels should help"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(115, 5594, -236)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -512, 512) and YPos == math.Clamp(YPos, 5687, 5958))
end
if CurObjMarker == 6 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Continue through the canals\n>The airboat is the only way to reach BME\n- Use the ramp to cross the gap - Objective Complete"
	DeathObjective = "- Continue through the canals - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-2027, 9898, -136)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -2331, -1941) and YPos == math.Clamp(YPos, 9728, 10752))
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-7567, 10968, -188)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -7707, -7421) and YPos == math.Clamp(YPos, 10112, 11279))
end
if CurObjMarker == 9 then
	CurObjTriggerSpot = nil
	SubObjective = "\n- Looks like there's a stash in there"
	SubObjSpot = Vector(-8191, 11346, -47)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-8275, 7532, -167)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -8241, -8119) and YPos == math.Clamp(YPos, 7296, 8320))

	SubObjTriggerSpot = (XPos == math.Clamp(XPos, -8256, -8128) and YPos == math.Clamp(YPos, 11338, 11450))
	SubObjTriggerSpot1 = (XPos == math.Clamp(XPos, -8279, -8021) and YPos == math.Clamp(YPos, 13607, 13768))
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-7103, 3123, -193)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -7680, -6665) and YPos == math.Clamp(YPos, 2943, 3356))
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-5183, -1691, -204)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -5584, -4657) and YPos == math.Clamp(YPos, -1791, -1567))
end
if CurObjMarker == 13 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end
if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end

if SubObjTriggerSpot and CurObjMarker == 3 and SubObjSpot != nil then
	SubObjective = "\n- Reach Station 7\n>Seems the Combine found them first"
	SubObjSpot = Vector( 4589, 5914, 119 )
end
if SubObjTriggerSpot1 and CurObjMarker == 3 and SubObjSpot != nil then
	SubObjective = "\n- Reach Station 7 - Objective Complete"
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
if SubObjTriggerSpot and CurObjMarker == 10 and SubObjSpot != nil then
	SubObjSpot = Vector(-8197, 13871, -48)
end
if SubObjTriggerSpot1 and CurObjMarker == 10 and SubObjSpot != nil then
	SubObjective = "\n- Looks like there's a stash in there - Objective Complete"
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 4 and SubObjSpot != nil then
	SubObjective = "\n- Reach Station 7 - Objective Failed"
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 12 and SubObjSpot != nil then
	SubObjective = "\n- Looks like there's a stash in there - Objective Failed"
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
if RemoveDelay < CurTime() then
	SubObjective = ""
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Use the ramp to cross the gap %- Objective Complete", "")
	RemoveDelay = math.huge
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