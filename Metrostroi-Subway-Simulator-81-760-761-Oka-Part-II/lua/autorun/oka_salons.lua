------------------------------------------------------------------------

--[[

						Пак перекрасок для составов типа 81-760, 81-760a
				
					
					██╗░░██╗░█████╗░░██╗░░░░░░░██╗██████╗░██████╗░░██████╗
					██║░░██║██╔══██╗░██║░░██╗░░██║╚════██╗██╔══██╗██╔════╝
					███████║██║░░██║░╚██╗████╗██╔╝░█████╔╝██████╔╝╚█████╗░
					██╔══██║██║░░██║░░████╔═████║░░╚═══██╗██╔══██╗░╚═══██╗
					██║░░██║╚█████╔╝░░╚██╔╝░╚██╔╝░██████╔╝██║░░██║██████╔╝
					╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░░╚═════╝░╚═╝░░╚═╝╚═════╝░
					
					
									by h0w3rS | 2021
						
									


				p.s сделанно максимально колхозно, чего собственно и добивался:)
				
--]]

------------------------------------------------------------------------


-- Окраски для обычной оки 81-760

Metrostroi.AddSkin("train","oldcolor",{
    name = "STL / KalL Metal",
    typ = "81-760",
    textures = {
	
		["hull"] = "models/metrostroi_train/81-760/hull",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_metallic",
		["int_0"] = "models/metrostroi_train/81-760/int_metallic",
		
    }
	
})

Metrostroi.AddSkin("train","oldColorNewDecals",{
    name = "STL / KalL Metal (2022)",
    typ = "81-760",
    textures = {
	
		["hull"] = "models/metrostroi_train/81-760/hull_2022",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_metallic",
		["int_0"] = "models/metrostroi_train/81-760/int_metallic",
		["glass_shelk"] = "models/metrostroi_train/81-760/shelk_2021",
		
    }
})

Metrostroi.AddSkin("train","expirimental",{
    name = "Опытный",
    typ = "81-760",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull_old",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_metallic",
		["int_0"] = "models/metrostroi_train/81-760/int_metallic",
    }
})
Metrostroi.AddSkin("train","stlOka",{
    name = "STL",
    typ = "81-760",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
    }
})
Metrostroi.AddSkin("train","stlOkaNewDecals",{
    name = "STL (2022)",
    typ = "81-760",
    textures = {
	
		["hull"] = "models/metrostroi_train/81-760/hull_2022",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
		["glass_shelk"] = "models/metrostroi_train/81-760/shelk_2022",
    }
})

Metrostroi.AddSkin("train","bklOka",{
    name = "BKL",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_bkl",
		["hull"] = "models/metrostroi_train/81-760/hull_bkl",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_bkl",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
    }
})
Metrostroi.AddSkin("train","bklOkaNewDecals",{
    name = "BKL (2022)",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_bkl",
		["hull"] = "models/metrostroi_train/81-760/hull_bkl_2022",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_bkl",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
		["glass_shelk"] = "models/metrostroi_train/81-760/shelk_2022",
    }
})

Metrostroi.AddSkin("train","poexaliKRL",{
    name = "Поехали! (KRL 2022)",
    typ = "81-760",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull_poexali",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
		["glass_shelk"] = "models/metrostroi_train/81-760/shelk_2021",
    }
})

Metrostroi.AddSkin("train","mosbrendOka",{
    name = "MosBrend",
    typ = "81-760",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull_mosbrend",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_mosbrend",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
    }
})

Metrostroi.AddSkin("train","ladogaOka",{
    name = "Ладога (81-780)",
    typ = "81-760",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull_ladoga",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_ladoga",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
    }
})

-- Окраски для баклана 81-760a
Metrostroi.AddSkin("train","standartBaklan",{
    name = "Стандартный",
    typ = "81-760a",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull_baklajan",
    }
})

Metrostroi.AddSkin("train","kolhozBaklan",{
    name = "Колхоз",
    typ = "81-760a",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull_baklajan_kolxoz",
    }
})

-- Перекраски для пультов 81-760

Metrostroi.AddSkin("cab","standartConsole",{
    name = "Стандартный",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console",
    }
})

Metrostroi.AddSkin("cab","oldCPOConsole",{
    name = "ЦПО (Старый образец)",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_oldCPO",
    }
})

Metrostroi.AddSkin("cab","newCPOConsole",{
    name = "ЦПО (Новый образец)",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_newCPO",
    }
})

Metrostroi.AddSkin("cab","kolxozOneConsole",{
    name = "Колхоз 1",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_kolxozOne",
    }
})

Metrostroi.AddSkin("cab","kolxozTwoConsole",{
    name = "Колхоз 2",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_kolxozTwo",
    }
})

Metrostroi.AddSkin("cab","kolxozThreeConsole",{
    name = "Колхоз 3",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_kolxozThree",
    }
})

