CreateClientConVar("ObjFontColorR", "255", true, false, "Red color value of the font", 0, 255)
CreateClientConVar("ObjFontColorG", "255", true, false, "Green color value of the font", 0, 255)
CreateClientConVar("ObjFontColorB", "255", true, false, "Blue color value of the font", 0, 255)
CreateClientConVar("ObjFontColorA", "195", true, false, "Alpha value of the font", 0, 255)

hook.Add( "PopulateToolMenu", "ObjSysSettings2", function()

	spawnmenu.AddToolMenuOption( "Options", "Objective System Settings", "ObjSysMenu2", "Obj Sys (Color)", "", "", function( panel )
	panel:ClearControls()

	panel:ColorPicker( "Font Color", "ObjFontColorR", "ObjFontColorG", "ObjFontColorB", "ObjFontColorA" )

end)
end)