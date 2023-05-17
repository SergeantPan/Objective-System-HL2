// All the stuff for doing the other stuff

	local ActiveObjective = ""
	local CurObjMarker = 0
	local RemoveDelay = math.huge
	local SuitCharged = false

hook.Add("HUDPaint", "Trainstation05Obj", function(ply)

if GetConVar("ResetObjectives"):GetInt() == 1 then
	ActiveObjective = ""
	CurObjMarker = 0
	SubObjSpot = nil
	SuitCharged = false
	RemoveDelay = math.huge
	RunConsoleCommand("ResetObjectives", "0")
end

	local MarkerDistance = GetConVar("ObjSysMarkerDistance"):GetInt()

// Check the map + convars n shit
	if game.GetMap() == "d1_trainstation_05" and GetConVar("ObjSysEnabled"):GetInt() == 1 then

	local Alpha = Color( GetConVar("ObjFontColorR"):GetInt(), GetConVar("ObjFontColorG"):GetInt(), GetConVar("ObjFontColorB"):GetInt(), GetConVar("ObjFontColorA"):GetInt() )

	local Width = GetConVar("ObjSysTextXPos"):GetFloat()
	local Height = GetConVar("ObjSysTextYPos"):GetFloat()

	local ply = LocalPlayer()

	local SuitCharge = ply:Armor()
	local SuitArmor = SuitCharge .. "/25"

	local XPos = math.Round(tostring(ply:GetPos().x), 0)
	local YPos = math.Round(tostring(ply:GetPos().y), 0)
	local ZPos = math.Round(tostring(ply:GetPos().z), 0) + 3

if ActiveObjective != "" then
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
	ActiveObjective = "- Reach Dr. Kleiners Lab"
	DeathObjective = "- Reach Dr. Kleiners Lab - Objective Failed"
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
	CurObjSpot = Vector(-5991, -906, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6016, -5952) and YPos == math.Clamp(YPos, -944, -712) )
end
if CurObjMarker == 2 then
	CurObjSpot = Vector(-6348, -885, 20)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6406, -6354) and YPos == math.Clamp(YPos, -918, -832) )
end
if CurObjMarker == 3 then
	CurObjSpot = nil
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -6508, -6462) and YPos == math.Clamp(YPos, -1095, -1050) )
end
if CurObjMarker == 4 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Reach Dr. Kleiners Lab - Objective Complete"
	DeathObjective = "- Objective Failed"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 5 then
	for _,Heady in pairs(ents.FindByClass("generic_actor")) do
if Heady:GetModel() == "models/lamarr.mdl" and Heady:GetPos() != Vector(-6484.000000, -1630.000000, 90.031250) then
	ActiveObjective = "- Equip the HEV-suit"
	CurObjMarker = CurObjMarker + 1
end
end
end
if CurObjMarker == 6 then
	CurObjTriggerSpot = nil
for _,Suit in pairs(ents.FindByClass("item_suit")) do
	SuitCheck = Suit
end
if !IsValid(SuitCheck) then
	CurObjMarker = CurObjMarker + 1
end
end
if CurObjMarker == 7 then
	CurObjTriggerSpot = nil
	ActiveObjective = "- Equip the HEV-suit - Objective Complete"
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 8 and RemoveDelay < CurTime() then
	SubObjSpot = Vector(-7056, -1577, 74)
	CurObjMarker = CurObjMarker + 1
end
if CurObjMarker == 9 then
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -7080, -7060) and YPos == math.Clamp(YPos, -1487, -1300) )
	ActiveObjective = "- Use the Suit Charger - " .. SuitArmor .. "\n- Use the teleporter to reach Black Mesa East"
if SuitCharge >= 25 and SuitCharged == false then
	ActiveObjective = string.gsub(ActiveObjective, "%- Use the Suit Charger %- " .. SuitArmor, "- Use the Suit Charger - Objective Complete")
	SuitCharged = true
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
	CurObjMarker = CurObjMarker + 1
end
end
if CurObjMarker == 10 then // Teleporter
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -7300, -7000) and YPos == math.Clamp(YPos, -1300, -1000) and ZPos == math.Clamp(ZPos, 60, 130)) // Teleporter
if SuitCharge < 25 and SuitCharged == false then
	ActiveObjective = string.gsub(ActiveObjective, "%- Use the Suit Charger %- " .. SuitArmor, "- Use the Suit Charger - Objective Failed")
	SuitCharged = true
	SubObjSpot = nil
	RemoveDelay = CurTime() + 5
end
end
if CurObjMarker == 11 then // Wasteland
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, 3400, 3800) and YPos == math.Clamp(YPos, -4700, -4100) and ZPos == math.Clamp(ZPos, 9600, 10000)) // Wasteland
end
if CurObjMarker == 12 then // BME
	ActiveObjective = "- Use the teleporter to reach Black Mesa East - Objective Failed"
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -12000, -11000) and YPos == math.Clamp(YPos, -760, -680) and ZPos == math.Clamp(ZPos, -16, 16)) // BME
	RemoveDelay = math.huge
end
if CurObjMarker == 13 then // Citadel
	ActiveObjective = "- Use the teleporter to reach Black Mesa East - Objective Complete"
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -14000, -13000) and YPos == math.Clamp(YPos, -185, -125) and ZPos == math.Clamp(ZPos, -40, 60)) // Citadel
end
if CurObjMarker == 14 then // BME
	ActiveObjective = "- Use the teleporter to reach Black Mesa East - Objective Failed"
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -12000, -11000) and YPos == math.Clamp(YPos, -760, -680) and ZPos == math.Clamp(ZPos, -16, 16)) // BME
end
if CurObjMarker == 15 then // Breens
	ActiveObjective = "- Use the teleporter to reach Black Mesa East - Objective Complete"
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -14000, -13000) and YPos == math.Clamp(YPos, -185, -125) and ZPos == math.Clamp(ZPos, -40, 60)) // Citadel
end
if CurObjMarker == 16 then // Outside
	ActiveObjective = "- Use the teleporter to reach Black Mesa East - Objective Failed"
	CurObjTriggerSpot = (XPos == math.Clamp(XPos, -10600, -10100) and YPos == math.Clamp(YPos, -5000, -4300) and ZPos == math.Clamp(ZPos, 300, 340))
	RemoveDelay = CurTime() + 5
end
if CurObjMarker == 17 then
	CurObjSpot = Vector(-10596, -4707, 214)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -10911, -10594) and YPos == math.Clamp(YPos, -4750, -4668) )
end
if CurObjMarker == 18 then
	CurObjSpot = Vector(-10848, -4064, 276)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -10880, -10688) and YPos == math.Clamp(YPos, -4097, -4032) )
end
if CurObjMarker == 19 then
	CurObjSpot = Vector(-10560, -3970, 340)
	CurObjTriggerSpot = ( XPos == math.Clamp(XPos, -10610, -10496) and YPos == math.Clamp(YPos, -3967, -3918) )
end
if CurObjMarker == 20 then
	CurObjSpot = nil
	CurObjTriggerSpot = nil
end

if CurObjTriggerSpot then
	CurObjMarker = CurObjMarker + 1
end
if RemoveDelay < CurTime() then
	ActiveObjective = string.gsub(ActiveObjective, "%- Reach Dr. Kleiners Lab %- Objective Complete", "")
	ActiveObjective = string.gsub(ActiveObjective, "%- Equip the HEV%-suit %- Objective Complete", "- Use the charger")
	ActiveObjective = string.gsub(ActiveObjective, "%- Use the Suit Charger %- Objective Failed%\n", "")
	ActiveObjective = string.gsub(ActiveObjective, "%- Use the Suit Charger %- Objective Complete%\n", "")
	ActiveObjective = string.gsub(ActiveObjective, "%- Use the teleporter to reach Black Mesa East %- Objective Failed", "")
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