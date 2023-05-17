// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local SubObjective = ""

	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Canals13Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjective = ""
	SubObjSpot = nil
	HelicopterDestroyed = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_canals_13" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Destroy the Hunter Chopper\n- Reach Black Mesa East\n>BME is located at the bottom of the dam"
	DeathObjective = "- Destroy the Hunter Chopper - Objective Failed\n- Reach Black Mesa East - Objective Failed"
	CurObjMarker = 1
end
if CurObjMarker == 14 then // Final number
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
	CurObjSpot = Vector(-10753, 2072, -370)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -10992, -10514) and YPos == math.Clamp(YPos, 1927, 2026))
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-10018, 796, -402)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -10690, -9194) and YPos == math.Clamp(YPos, 229, 1502))
end
if CurObjMarker == 3 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
for k, v in pairs( ents.FindByClass("helicopter_chunk") ) do
if v:GetModel() == "models/gibs/helicopter_brokenpiece_06_body.mdl" and HelicopterDestroyed == nil then
	ActiveObjective = "- Destroy the Hunter Chopper - Objective Complete\n- Reach Black Mesa East\n>BME is located at the bottom of the dam"
	DeathObjective = "- Reach Black Mesa East\n>BME is located at the bottom of the dam"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
	HelicopterDestroyed = true
end
end
end
if CurObjMarker == 4 and RemoveDelay < CurTime() then
	CurObjSpot = Vector(3129, 2579, -170)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 3073, 3183) and YPos == math.Clamp(YPos, 2514, 2648))
	ActiveObjective = "- Open the floodgate\n>That floodgate blocks the way to BME\n- Reach Black Mesa East\n>BME is located at the bottom of the dam"
	DeathObjective = "- Open the floodgate - Objective Failed\n- Reach Black Mesa East - Objective Failed"
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(4666, 685, -96)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 4482, 4875) and YPos == math.Clamp(YPos, 390, 910))
end
if CurObjMarker == 6 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(9265, 673, -336)
	SubObjSpot2 = Vector(3659, -1629, 211)
	SubObjective = "\n- Investigate the broken grate\n- That warehouse might have something useful"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(2555, -2119, -48)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 2473, 2638) and YPos == math.Clamp(YPos, -2222, -2048))

	SubObjTriggerSpot = (XPos == math.Clamp(XPos, 9253, 9402) and YPos == math.Clamp(YPos, 610, 736))
	SubObjTriggerSpot2 = (XPos == math.Clamp(XPos, 11452, 11584) and YPos == math.Clamp(YPos, 609, 737))
	SubObjTriggerSpot3 = (XPos == math.Clamp(XPos, 11231, 11334) and YPos == math.Clamp(YPos, 1079, 1470))

	Sub2ObjTriggerSpot = (XPos == math.Clamp(XPos, 3586, 3655) and YPos == math.Clamp(YPos, -1678, -1594))
	Sub2ObjTriggerSpot2 = (XPos == math.Clamp(XPos, 2905, 3405) and YPos == math.Clamp(YPos, -1410, -1101))
end
if CurObjMarker == 8 then
	CurObjTriggerSpot = nil
	
	SubObjTriggerSpot = nil
	Sub2ObjTriggerSpot = nil
	SubObjSpot = nil
	SubObjSpot2 = nil
	SubObjective = string.gsub(SubObjective, "grate", "grate - Objective Failed")
	SubObjective = string.gsub(SubObjective, "useful", "useful - Objective Failed")
	CurObjMarker = CurObjMarker + 1

	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(1116, -3332, -44)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 1033, 1216) and YPos == math.Clamp(YPos, -3416, -3199))
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-4, -3682, -234)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -126, -6) and YPos == math.Clamp(YPos, -3838, -3592))
end
if CurObjMarker == 11 then
	CurObjSpot = nil
	SubObjSpot = Vector(-496, -3434, -206)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -508, -386) and YPos == math.Clamp(YPos, -3597, -3331))
end
if CurObjMarker == 12 then
	SubObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Open the floodgate - Objective Complete\n- Reach Black Mesa East\n>BME is located at the bottom of the dam"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 13 and RemoveDelay < CurTime() then
	ActiveObjective = "- Reach Black Mesa East\n>BME is located at the bottom of the dam"
	DeathObjective = "- Reach Black Mesa East - Objective Failed"
	CurObjSpot = Vector(-629, -3772, -364)
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -768, -511) and YPos == math.Clamp(YPos, -3886, -3774))
end
if CurObjMarker == 14 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end
if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if SubObjTriggerSpot and SubObjSpot != nil then
	SubObjSpot = Vector(11517, 667, -283)
end
if SubObjTriggerSpot2 and SubObjSpot != nil then
	SubObjSpot = Vector(11313, 1214, -295)
end
if SubObjTriggerSpot3 and SubObjSpot != nil then
	SubObjSpot = nil
	SubObjective = string.gsub(SubObjective, "grate", "grate - Objective Complete")
	RemoveDelay = CurTime() + 5
end
if Sub2ObjTriggerSpot and SubObjSpot2 != nil then
	SubObjSpot2 = Vector(3166, -1257, 245)
end
if Sub2ObjTriggerSpot2 and SubObjSpot2 != nil then
	SubObjSpot2 = nil
	SubObjective = string.gsub(SubObjective, "useful", "useful - Objective Complete")
	RemoveDelay = CurTime() + 5
end
if RemoveDelay < CurTime() then
	SubObjective = string.gsub(SubObjective, "%\n%- Investigate the broken grate %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- Investigate the broken grate %- Objective Failed", "")
	SubObjective = string.gsub(SubObjective, "%\n%- That warehouse might have something useful %- Objective Complete", "")
	SubObjective = string.gsub(SubObjective, "%\n%- That warehouse might have something useful %- Objective Failed", "")
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