// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Trainstation04Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_trainstation_04" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Find Alyx\n- Reach Dr. Kleiners Lab\n- Evade the Metropolice"
	DeathObjective = "- Find Alyx - Objective Failed\n- Reach Dr. Kleiners Lab - Objective Failed\n- Evade the Metropolice - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 15 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(-3366, -3457, 584)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3425, -3328) and YPos == math.Clamp(YPos, -3572, -3438) and ZPos == math.Clamp(ZPos, 566, 620) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-4086, -3455, 600)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4134, -4060) and YPos == math.Clamp(YPos, -3507, -3400) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-4870, -3426, 726)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4906, -4850) and YPos == math.Clamp(YPos, -3501, -3308) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-5202, -4421, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5235, -5185) and YPos == math.Clamp(YPos, -4465, -4364) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(-5769, -4460, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5839, -5710) and YPos == math.Clamp(YPos, -4554, -4382) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-6639, -4393, 532)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6798, -6593) and YPos == math.Clamp(YPos, -4431, -4352) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-6912, -4281, 596)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7152, -6856) and YPos == math.Clamp(YPos, -4270, -4235) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-7035, -3889, 536)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7214, -7024) and YPos == math.Clamp(YPos, -3919, -3856) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-7188, -3913, 404)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7424, -7074) and YPos == math.Clamp(YPos, -4047, -3936) and ZPos == math.Clamp(ZPos, 384, 512) )
	RemoveDelay = CurTime() + 3
end
if CurObjMarker == 10 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
if RemoveDelay < CurTime() then
	ActiveObjective = "- Find Alyx\n- Reach Dr. Kleiners Lab\n- Evade the Metropolice - Objective Failed"
	DeathObjective = "- Find Alyx - Objective Failed\n- Reach Dr. Kleiners Lab - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
end
if CurObjMarker == 11 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7808, -7672) and YPos == math.Clamp(YPos, -4034, -3886) and ZPos < 310 )
end
if CurObjMarker == 12 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find Alyx - Objective Complete\n- Reach Dr. Kleiners Lab"
	DeathObjective = "- Reach Dr. Kleiners Lab - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-7560, -3968, -236)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7647, -7432) and YPos == math.Clamp(YPos, -4031, -3872) and ZPos == math.Clamp(ZPos, -256, -123) )
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(-7719, -4127, -236)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7739, -7720) and YPos == math.Clamp(YPos, -4157, -4096) and ZPos == math.Clamp(ZPos, -255, -131) )
end
if CurObjMarker == 15 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Evade the Metropolice %- Objective Failed", "")
	ActiveObjective = string.gsub(ActiveObjective, "%- Find Alyx %- Objective Complete%\n", "")
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