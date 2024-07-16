// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local PickItUp = false
	local PutItInTheTrash = false
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Trainstation02Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	PickItUp = false
	PutItInTheTrash = false
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_trainstation_02" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Make your way through the trainstation\n- Find Alyx\n- Reach Dr. Kleiners Lab"
	DeathObjective = "- Make your way through the trainstation - Objective Failed\n- Find Alyx - Objective Failed\n- Reach Dr. Kleiners Lab - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 13 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(-4319, -669, 84)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4353, -4258) and YPos == math.Clamp(YPos, -731, -672) )
end
if CurObjMarker == 2 then
if PickItUp == false then
	CurObjSpot = Vector(-3733, -1015, 84)
end
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3920, -3648) and YPos == math.Clamp(YPos, -1108, -976) )
for _,ThatCan in pairs(ents.FindByClass("prop_physics")) do

	local TheCanIndex = math.Clamp(ThatCan:EntIndex(), 505, (505 + game.MaxPlayers()))

if ThatCan:EntIndex() == TheCanIndex then
	CanX = math.Round(tostring(ThatCan:WorldSpaceCenter().x), 0)
	CanY = math.Round(tostring(ThatCan:WorldSpaceCenter().y), 0)
	CanZ = math.Round(tostring(ThatCan:WorldSpaceCenter().z), 0)
	TheTrash = ( CanX == math.Clamp(CanX, -3724, -3688) and CanY == math.Clamp(CanY, -937, -899) and CanZ < 100 )

if CanZ < 110 and PickItUp == false then
	CurObjSpot = nil
	PickItUp = true
	ActiveObjective = "- Pick up that can"
	RemoveDelay = CurTime() + 2
end
if PickItUp == true and CanZ > 70 and RemoveDelay < CurTime() then
	ActiveObjective = "- Pick up that can - Objective Complete\n- Now put it in the trash can"
	PutItInTheTrash = true
end
if PutItInTheTrash == true and TheTrash then
	ActiveObjective = "- Pick up that can - Objective Complete\n- Now put it in the trash can - Objective Complete"
	PutItInTheTrash = false
	RemoveDelay = CurTime() + 5
	CurObjSpot = Vector(-3733, -1015, 84)
end
end
end
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-3481, -2454, 84)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3485, -3446) and YPos == math.Clamp(YPos, -2512, -2352) )
end
if CurObjMarker == 4 then
	CurObjSpot = Vector(-3198, -2048, 84)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3195, -3148) and YPos == math.Clamp(YPos, -2097, -2000) )
end
if CurObjMarker == 5 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Make your way through the trainstation - Objective Complete\n- Find Alyx\n- Reach Dr. Kleiners Lab"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 6 and RemoveDelay < CurTime() then
	CurObjSpot = Vector(-2882, -3277, 16)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3072, -2688) and YPos == math.Clamp(YPos, -3306, -3225) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-2870, -4273, 16)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3072, -2656) and YPos == math.Clamp(YPos, -4331, -4216) )
end
if CurObjMarker == 8 then
	CurObjSpot = Vector(-3218, -4577, 244)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3251, -3180) and YPos == math.Clamp(YPos, -4608, -4547) and ZPos > 220)
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-3668, -4500, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3728, -3572) and YPos == math.Clamp(YPos, -4596, -4398) )
end
if CurObjMarker == 10 then
	CurObjSpot = Vector(-3715, -3875, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4109, -3584) and YPos == math.Clamp(YPos, -4107, -3762) )
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-5120, -3824, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5238, -5028) and YPos == math.Clamp(YPos, -4160, -3328) )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-5131, -4168, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -5178, -5096) and YPos == math.Clamp(YPos, -4272, -4168) )
end
if CurObjMarker == 13 then
	CurObjTriggerSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end

if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Pick up that can %- Objective Complete%\n%- Now put it in the trash can %- Objective Complete", "- Make your way through the trainstation\n- Find Alyx\n- Reach Dr. Kleiners Lab")
	ActiveObjective = string.gsub(ActiveObjective, "%- Make your way through the trainstation %- Objective Complete%\n", "" )
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