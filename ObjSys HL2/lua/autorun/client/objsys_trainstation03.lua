// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0

hook.Add("HUDPaint", "Trainstation03Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_trainstation_03" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Find Alyx\n- Reach Dr. Kleiners Lab"
	DeathObjective = "- Find Alyx - Objective Failed\n- Reach Dr. Kleiners Lab - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 14 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(-5175, -4605, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5208, -5142) and YPos == math.Clamp(YPos, -4671, -4608) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-4946, -4480, 84)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4976, -4912) and YPos == math.Clamp(YPos, -4522, -4448) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-4871, -4613, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4896, -4840) and YPos == math.Clamp(YPos, -4672, -4568) and ZPos == math.Clamp(ZPos, 256, 375) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-3780, -4613, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3817, -3718) and YPos == math.Clamp(YPos, -4656, -4568) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-3470, -4584, 340)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3495, -3432) and YPos == math.Clamp(YPos, -4616, -4552) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-3770, -4609, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3809, -3742) and YPos == math.Clamp(YPos, -4656, -4569) and ZPos == math.Clamp(ZPos, 385, 504) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-3897, -4559, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3970, -3853) and YPos == math.Clamp(YPos, -4552, -4466) and ZPos == math.Clamp(ZPos, 387, 504) )
end
if CurObjMarker == 8 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find Alyx\n- Reach Dr. Kleiners Lab\n- Evade the Metropolice"
	DeathObjective = "- Find Alyx - Objective Failed\n- Reach Dr. Kleiners Lab - Objective Failed\n- Evade the Metropolice - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-4118, -4122, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4149, -4087) and YPos == math.Clamp(YPos, -4165, -4078) and ZPos == math.Clamp(ZPos, 384, 504) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-4419, -4285, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4462, -4384) and YPos == math.Clamp(YPos, -4311, -4264) and ZPos == math.Clamp(ZPos, 384, 504) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-4485, -4615, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4510, -4438) and YPos == math.Clamp(YPos, -4656, -4568) and ZPos == math.Clamp(ZPos, 384, 504) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-4928, -4618, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4971, -4872) and YPos == math.Clamp(YPos, -4671, -4568) and ZPos == math.Clamp(ZPos, 384, 504) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-5103, -4640, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5135, -5072) and YPos == math.Clamp(YPos, -4672, -4608) and ZPos == math.Clamp(ZPos, 512, 639) )
end
if CurObjMarker == 14 then
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