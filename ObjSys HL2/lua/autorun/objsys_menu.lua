hook.Add( "PopulateToolMenu", "ObjSysSettings", function()

	spawnmenu.AddToolMenuOption( "Options", "Objective System Settings", "ObjSysMenu1", "Obj Sys (Base)", "", "", function( panel )
	panel:ClearControls()

	panel:CheckBox( "Enable the 'Objective System' addon", "ObjSysEnabled" )
//	panel:CheckBox( "Enable the fallback system for unsupported maps", "ObjSysFallbackEnabled" )
// Later...
	panel:CheckBox( "Reset objectives on player death", "ObjSysResetOnDeath" )
	panel:CheckBox( "Remove the 'Important NPC' marker", "ObjSysNoNPCMarker" )

	panel:NumSlider( "Horizontal text position", "ObjSysTextXPos", 0, 1, 2 )
	panel:Help( "Horizontal offset for the 'Current Objective' text.\nDefault is 0.05" )
	panel:NumSlider( "Vertical text position", "ObjSysTextYPos", 0, 1, 2 )
	panel:Help( "Vertical offset for the 'Current Objective' text.\nDefault is 0.1" )

	panel:NumSlider( "Marker max distance", "ObjSysMarkerDistance", 0, 10000, 0 )
	panel:Help( "Maximum distance (in meters) at which the markers are visible.\nDefault is 2500" )

	panel:Button( "Reset Objectives", "ResetObjectives", "1" )
	panel:Help( "Reset all objectives for the current map, use whenever." )

end)
end)