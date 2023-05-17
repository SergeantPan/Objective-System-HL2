	local X1 = ""
	local Y1 = ""
	local Z1 = ""

	local X2 = ""
	local Y2 = ""
	local Z2 = ""

	local XCoords = ""
	local YCoords = ""
	local ZCoords = ""

	local CurObjSpot = ""
	local CurObjCount = 1

CreateConVar("EnableZFactor", "0", 128, "Enable/Disable the ZPos from ObjPos")

concommand.Add("MarkObjSpot", function(ply)
	X = math.Round(ply:GetEyeTrace().HitPos.x, 0)
	Y = math.Round(ply:GetEyeTrace().HitPos.y, 0)
	Z = math.Round(ply:GetEyeTrace().HitPos.z + 20, 0)

print ("CurObjSpot = Vector(" .. X .. ", " .. Y .. ", " .. Z .. ")")

	CurObjSpot = "	CurObjSpot = Vector(" .. X .. ", " .. Y .. ", " .. Z .. ")"

end)

concommand.Add("MarkObjPos1", function(ply)
	X1 = math.Round(ply:GetEyeTrace().HitPos.x, 0)
	Y1 = math.Round(ply:GetEyeTrace().HitPos.y, 0)
	Z1 = math.Round(ply:GetEyeTrace().HitPos.z, 0)

	print( "Position 1 Marked:" )
	print( "X: " .. X1 )
	print( "Y: " .. Y1 )
	print( "Z: " .. Z1 )
end)

concommand.Add("MarkObjPos2", function(ply)
	X2 = math.Round(ply:GetEyeTrace().HitPos.x, 0)
	Y2 = math.Round(ply:GetEyeTrace().HitPos.y, 0)
	Z2 = math.Round(ply:GetEyeTrace().HitPos.z, 0)

	print( "Position 2 Marked:" )
	print( "X: " .. X2 )
	print( "Y: " .. Y2 )
	print( "Z: " .. Z2 )
end)

concommand.Add("CreateObjPos", function()

if X1 == "" then
	print( "You have not set a position with MarkObjPos1" )
	return
	end
if X2 == "" then
	print( "You have not set a position with MarkObjPos2" )
	return
end

	if X1 < X2 then
	XCoords = "( XPos == math.Clamp(XPos, " .. X1 .. ", " .. X2 .. ") and "
	else
	XCoords = "( XPos == math.Clamp(XPos, " .. X2 .. ", " .. X1 .. ") and "
end
	if Y1 < Y2 then
	YCoords = "YPos == math.Clamp(YPos, " .. Y1 .. ", " .. Y2 .. ")"
	else
	YCoords = "YPos == math.Clamp(YPos, " .. Y2 .. ", " .. Y1 .. ")"
end
	if Z1 < Z2 then
	ZCoords = " and ZPos == math.Clamp(ZPos, " .. Z1 .. ", " .. Z2 .. ") )"
	else
	ZCoords = " and ZPos == math.Clamp(ZPos, " .. Z2 .. ", " .. Z1 .. ") )"
end

if CurObjSpot == "" then
	print( "You have not set an objective point with MarkObjSpot" )
	return
end

	print( "" )
	print( "if CurObjMarker == " .. CurObjCount .. " then" )
	print( CurObjSpot )
if GetConVar("EnableZFactor"):GetInt() == 1 then
	print( "	CurObjTriggerSpot = " .. XCoords .. YCoords .. ZCoords )
else
	print( "	CurObjTriggerSpot = " .. XCoords .. YCoords .. " )" )
end
	print( "end" )
	CurObjCount = CurObjCount + 1
end)

concommand.Add("MarkSubObjSpot", function(ply)
	X = math.Round(ply:GetEyeTrace().HitPos.x, 0)
	Y = math.Round(ply:GetEyeTrace().HitPos.y, 0)
	Z = math.Round(ply:GetEyeTrace().HitPos.z, 0)

print ("SubObjSpot = Vector(" .. X .. ", " .. Y .. ", " .. Z .. ")")

end)

concommand.Add("CreateTriggerSpot", function()
if X1 == "" then
	print( "You have not set a position with MarkObjPos1" )
	return
	end
if X2 == "" then
	print( "You have not set a position with MarkObjPos2" )
	return
end
	if X1 < X2 then
	XCoords = "( XPos == math.Clamp(XPos, " .. X1 .. ", " .. X2 .. ") and "
	else
	XCoords = "( XPos == math.Clamp(XPos, " .. X2 .. ", " .. X1 .. ") and "
end
	if Y1 < Y2 then
	YCoords = "YPos == math.Clamp(YPos, " .. Y1 .. ", " .. Y2 .. ")"
	else
	YCoords = "YPos == math.Clamp(YPos, " .. Y2 .. ", " .. Y1 .. ")"
end
	if Z1 < Z2 then
	ZCoords = " and ZPos == math.Clamp(ZPos, " .. Z1 .. ", " .. Z2 .. ") )"
	else
	ZCoords = " and ZPos == math.Clamp(ZPos, " .. Z2 .. ", " .. Z1 .. ") )"
end

if GetConVar("EnableZFactor"):GetInt() == 1 then
	print( "	CurObjTriggerSpot = " .. XCoords .. YCoords .. ZCoords )
else
	print( "	CurObjTriggerSpot = " .. XCoords .. YCoords .. " )" )
end
end)

concommand.Add("MarkPlayerPosition", function(ply)
	X = math.Round(ply:GetPos().x, 0)
	Y = math.Round(ply:GetPos().y, 0)
	Z = math.Round(ply:GetPos().z, 0)

	print( "Player Position:" )
	print( "X: " .. X )
	print( "Y: " .. Y )
	print( "Z: " .. Z )
end)