// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge

hook.Add("HUDPaint", "Prison03Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d2_prison_03" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

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
	ActiveObjective = "- Find Alyx\n- Find Eli"
	DeathObjective = "- Find Alyx - Objective Failed\n- Find Eli - Objective Failed"
	CurObjMarker = 1
end
	if CurObjMarker == 20 then // Final number
	ActiveObjective = "- Proceed to the next level"
end

	draw.DrawText( CurObjective, "ObjSysSmall", ScrW() * Width, ScrH() * (Height + 0.04), Alpha, 0 )

// Marker stuff
local Marker = Material("ping.png")
local CuriosityMarker = Material("locationping.png")

if CurObjMarker == 1 then
	CurObjSpot = Vector(-2578, 3179, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2666, -2592) and YPos == math.Clamp(YPos, 3125, 3218) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-2764, 1797, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2814, -2720) and YPos == math.Clamp(YPos, 1740, 1792) )
end
if CurObjMarker == 3 then
	CurObjSpot = Vector(-2919, 1638, 17)
	CurObjTriggerSpot = ZPos < 110
end
if CurObjMarker == 4 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	ActiveObjective = "- Find Alyx\n- Find Eli\n- Kill the Antlion Guard"
	DeathObjective = "- Find Alyx - Objective Failed\n- Find Eli - Objective Failed\n- Kill the Antlion Guard - Objective Failed"
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 5 then
	for _,AntyCorpse in pairs(ents.FindByClass("prop_ragdoll")) do
if AntyCorpse:GetModel() == "models/antlion_guard.mdl" then
	ActiveObjective = "- Find Alyx\n- Find Eli\n- Kill the Antlion Guard - Objective Complete"
	DeathObjective = "- Find Alyx - Objective Failed\n- Find Eli - Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 6 then
	CurObjSpot = Vector(-3491, 3277, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3584, -3393) and YPos == math.Clamp(YPos, 3280, 3370) )
end
if CurObjMarker == 7 then
	CurObjSpot = Vector(-2991, 3520, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -2984, -2911) and YPos == math.Clamp(YPos, 3392, 3616) )
end
if CurObjMarker == 8 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3349, -3281) and YPos == math.Clamp(YPos, 4160, 4384) )
	CurObjSpot = nil
	for _,Gate in pairs(ents.FindByClass("prop_dynamic")) do
if Gate:GetModel() == "models/props_wasteland/prison_slidingdoor001a.mdl" and Gate:GetPos() == Vector(-3270.000000, 4400.000000, 60.382000) then
	CurObjSpot = Vector(-3288, 4271, 20)
end
end
end
if CurObjMarker == 9 then
	CurObjSpot = Vector(-4061, 4390, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -4176, -3910) and YPos == math.Clamp(YPos, 4160, 4383) )
end
if CurObjMarker == 10 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-4163, 4547, 65)
for _,Plug in pairs(ents.FindByClass("prop_dynamic")) do
if Plug:GetModel() == "models/props_combine/combine_fence01a.mdl" and Plug:GetPos() == Vector(-4177.470215, 4400.560059, 23.882999) and Plug:GetSkin() == 1 then
	SubObjSpot = nil
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 11 then
	CurObjSpot = Vector(-3928, 4595, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3919, -3858) and YPos == math.Clamp(YPos, 4550, 4632)  )
end
if CurObjMarker == 12 then
	CurObjSpot = Vector(-3617, 4704, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3711, -3520) and YPos == math.Clamp(YPos, 4710, 4759) and ZPos == math.Clamp(ZPos, 0, 44) )
end
if CurObjMarker == 13 then
	CurObjSpot = Vector(-3604, 4493, 148)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3712, -3520) and YPos == math.Clamp(YPos, 4400, 4560) and ZPos == math.Clamp(ZPos, 128, 256) )
end
if CurObjMarker == 14 then
	CurObjTriggerSpot = nil
	SubObjSpot = Vector(-3544, 4164, 183)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 15 then
	CurObjSpot = Vector(-3045, 4762, 180)
	CurObjTriggerSpot = nil
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -3599, -3472) and YPos == math.Clamp(YPos, 3968, 4144) )
	for _,Gate2 in pairs(ents.FindByClass("prop_dynamic")) do
if Gate2:GetModel() == "models/props_wasteland/prison_slidingdoor001a.mdl" and Gate2:GetPos() == Vector(-2752.000000, 5102.000000, 60.382000) then
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 16 then
	CurObjSpot = Vector(-2883, 5100, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3007, -2752) and YPos == math.Clamp(YPos, 5099, 5176) )
	SubObjTriggerSpot = ( XPos == math.Clamp(XPos, -3599, -3472) and YPos == math.Clamp(YPos, 3968, 4144) )
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(-3080, 5691, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3098, -3058) and YPos == math.Clamp(YPos, 5695, 5753) )
	SubObjSpot = nil
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(-3588, 5826, 22)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3635, -3592) and YPos == math.Clamp(YPos, 5808, 5848) )
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(-3768, 6047, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -3770, -3702) and YPos == math.Clamp(YPos, 5952, 6144) )
end
if CurObjMarker == 20 then
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
	ActiveObjective = string.gsub(ActiveObjective, "%\n%- Kill the Antlion Guard %- Objective Complete", "")
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