// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "City17_09Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	RemoveDelay = math.huge
	SubObjSpot = nil
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d3_c17_09" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Find Barney\n- Assault the Citadel"
	DeathObjective = "- Find Barney - Objective Failed\n- Assault the Citadel - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 20 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

if CurObjMarker > 17 and CurObjMarker != 20 then
for _,BarneyAlive in pairs(ents.FindByClass( "npc_barney" )) do
	BarneyHP = (BarneyAlive:Health() / BarneyAlive:GetMaxHealth()) * 100
	BarneyAliveCheck = BarneyAlive
if GetConVar("ObjSysNoNPCMarker"):GetInt() == 0 and CurObjMarker > 17 and CurObjMarker != 20 then
	SubObjSpot = BarneyAlive:EyePos() + Vector(0,0,10)
else
	SubObjSpot = nil
end
end
if IsValid(BarneyAliveCheck) and CurObjMarker > 17 then
	ActiveObjective = "- Assault the Citadel\n- Keep Barney Alive - HP: " .. BarneyHP .. " %"
elseif !IsValid(BarneyAliveCheck) then
	ActiveObjective = "- Assault the Citadel\n- Keep Barney Alive - Objective Failed"
end
end

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(4276, 4091, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4224, 4400) and YPos == math.Clamp(YPos, 4029, 4087) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(4346, 3777, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 4352, 4400) and YPos == math.Clamp(YPos, 3710, 3840) )
end
if CurObjMarker == 3 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find Barney\n>He's pinned on a rooftop covered by snipers\n- Assault the Citadel"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(5403, 6010, 16)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5184, 5696) and YPos == math.Clamp(YPos, 5824, 6272) )
end
if CurObjMarker == 5 then
	CurObjSpot = Vector(7094, 6214, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7040, 7145) and YPos == math.Clamp(YPos, 6225, 6254) )
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(6460, 6658, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6152, 6509) and YPos == math.Clamp(YPos, 6584, 6720) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(6869, 6497, -108)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6705, 6960) and YPos == math.Clamp(YPos, 6248, 6769) and ZPos == math.Clamp(ZPos, -142, -62) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(6013, 6293, -76)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5968, 6064) and YPos == math.Clamp(YPos, 6249, 6344) and ZPos == math.Clamp(ZPos, -96, 29) )
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(6205, 6450, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6159, 6315) and YPos == math.Clamp(YPos, 6400, 6514) and ZPos == math.Clamp(ZPos, 172, 375) )
end
if CurObjMarker == 10 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(6934, 6518, 224)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(6205, 6450, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6173, 6960) and YPos == math.Clamp(YPos, 6248, 6775) and ZPos == math.Clamp(ZPos, 170, 251) )
end
if CurObjMarker == 12 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find Barney - Objective Complete\n- Assault the Citadel"
	DeathObjective = "- Assault the Citadel - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(6715, 6309, 212)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6591, 6712) and YPos == math.Clamp(YPos, 6216, 6392) and ZPos == math.Clamp(ZPos, 193, 310) )
end
if CurObjMarker < 16 and ( XPos == math.Clamp(XPos, 6457, 6696) and YPos == math.Clamp(YPos, 6784, 6860) and ZPos == math.Clamp(ZPos, 75, 263) ) then
	CurObjMarker = 16
end
if CurObjMarker == 14 then
	CurObjSpot = Vector(6011, 6371, 308)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 5968, 6069) and YPos == math.Clamp(YPos, 6249, 6496) and ZPos == math.Clamp(ZPos, 288, 381) )
end
if CurObjMarker == 15 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 6457, 6696) and YPos == math.Clamp(YPos, 6784, 6860) and ZPos == math.Clamp(ZPos, 75, 263) )
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(7710, 7016, 16)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 7638, 7751) and YPos == math.Clamp(YPos, 6090, 7296) )
	SubObjSpot = nil
end
if CurObjMarker == 17 then
	CurObjTriggerSpot = nil
	DeathObjective = "- Assault the Citadel - Objective Failed\n- Keep Barney Alive - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(8581, 7426, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8584, 8652) and YPos == math.Clamp(YPos, 7360, 7488) )
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(8921, 7161, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, 8896, 9028) and YPos == math.Clamp(YPos, 7056, 7160) )
end
if CurObjMarker == 20 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Find Barney %- Objective Complete%\n", "")
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