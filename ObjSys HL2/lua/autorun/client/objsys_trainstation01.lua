// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Trainstation01Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_trainstation_01" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

	local Alpha = Color( GetConVar("ObjFontColorR"):GetInt(), GetConVar("ObjFontColorG"):GetInt(), GetConVar("ObjFontColorB"):GetInt(), GetConVar("ObjFontColorA"):GetInt() )

	local Width = GetConVar("ObjSysTextXPos"):GetFloat()
	local Height = GetConVar("ObjSysTextYPos"):GetFloat()

	local ply = LocalPlayer()

	local XPos = math.Round(tostring(ply:GetPos().x), 0)
	local YPos = math.Round(tostring(ply:GetPos().y), 0)
	local ZPos = math.Round(tostring(ply:GetPos().z), 0) + 3

// Start the objective stuff
if CurObjective != "" then
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

if CurObjMarker == 0 then
	ActiveObjective = ""
	DeathObjective = ""
	CurObjMarker = 1
end
	if CurObjMarker == 16 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5419, -5284) and YPos == math.Clamp(YPos, -1988, -1925) )
end
if CurObjMarker == 2 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Make your way through the trainstation"
	DeathObjective = "- Make your way through the trainstation - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-4224, -1984, -12)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4220, -4153) and YPos == math.Clamp(YPos, -2206, -1887) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-4086, -1247, -12)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4215, -3900) and YPos == math.Clamp(YPos, -1448, -1120) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-4992, -1232, -12)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4993, -4849) and YPos == math.Clamp(YPos, -1402, -1077) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-4928, -690, -12)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5007, -4864) and YPos == math.Clamp(YPos, -768, -600) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-4322, -922, -11)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4320, -4256) and YPos == math.Clamp(YPos, -976, -870) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-4224, -417, -10)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4336, -4080) and YPos == math.Clamp(YPos, -543, -432) )
end
if CurObjMarker == 9 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4072, -4009) and YPos == math.Clamp(YPos, -560, -465) )
end
if CurObjMarker == 10 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Make your way through the trainstation\n- Follow the Metrocop"
	DeathObjective = "- Make your way through the trainstation - Objective Failed\n- Follow the Metrocop - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 11 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3553, -3475) and YPos == math.Clamp(YPos, -456, -409) )
end
if CurObjMarker == 12 then
	ActiveObjective = "- Make your way through the trainstation\n- Follow the Metrocop - Objective Complete"
	DeathObjective = "- Make your way through the trainstation - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 13 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3397, -3319) and YPos == math.Clamp(YPos, -128, -80) )
end
if CurObjMarker == 14 then
	ActiveObjective = "- Make your way through the trainstation\n- Find Alyx\n- Reach Dr. Kleiners Lab"
	DeathObjective = "- Make your way through the trainstation - Objective Failed\n- Find Alyx - Objective Failed\n- Reach Dr. Kleiners Lab - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(-3258, 97, 180)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3256, -3185) and YPos == math.Clamp(YPos, 51, 142) )
end
if CurObjMarker == 16 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Follow the Metrocop %- Objective Complete", "")
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