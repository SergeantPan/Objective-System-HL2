if SERVER then
	AddCSLuaFile("objsys_shared.lua")
end
if CLIENT then
	include("objsys_shared.lua")
end

// Menu 1
CreateConVar( "ObjSysEnabled", "1", 128, "Enable/Disable the addon in its entirety." )
// CreateConVar( "ObjSysFallbackEnabled", "1", 128, "Enable/Disable the fallback system." )
// I may/may not add this feature later, so lets just keep this here

// CreateConVar( "ObjSysToggle", "1", 0, "Toggle the Objectives text on/off." )
// This might be interesting, so lets keep it here

CreateConVar( "ObjSysTextXPos", "0.05", 128, "Horizontal (Left-to-Right) offset of the text." )
CreateConVar( "ObjSysTextYPos", "0.1", 128, "Vertical (Up-and-Down) offset of the text." )

CreateConVar( "ObjSysMarkerDistance", "2500", 128, "The distance at which objective markers should be visible at (in meters.) Default is 2500." )

CreateConVar( "ResetObjectives", "0", 0, "Reset the objectives for the current map. ResetObjectives 1 to reset" )
CreateConVar( "ObjSysResetOnDeath", "0", 128, "Reset objectives on player death." )

CreateConVar("ObjSysNoNPCMarker", "0", 128, "Remove the green marker over an important NPC's head")