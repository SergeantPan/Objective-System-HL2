// This file exists for the sole purpose of adding in the default font, "ZektonRG"
// I like it, so I'm forcing all of you to use it aswell
// ;)

if SERVER then
	resource.AddFile( "resource/fonts/zektonrg.ttf" )
	return 
end

surface.CreateFont( "ObjSysBig", {
	font = "Zekton Rg",
	size = 30,
	weight = 500,
	shadow = true,
})

surface.CreateFont( "ObjSysSmall", {
	font = "Zekton Rg",
	size = 25,
	weight = 500,
	shadow = true,
})