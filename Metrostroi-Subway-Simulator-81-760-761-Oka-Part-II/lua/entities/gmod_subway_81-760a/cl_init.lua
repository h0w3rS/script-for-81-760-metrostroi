include("shared.lua")

--------------------------------------------------------------------------------
ENT.ClientProps = {}
ENT.ButtonMap = {}
ENT.AutoAnims = {}
ENT.ClientSounds = {}
--------------------------------------------------------------------------------
ENT.ClientPropsInitialized = false
ENT.ButtonMap["PUU"] = {
    pos = Vector(512+21.08,50.45,-26.54)+Vector(-41.5,-1.2,17.5),--+Vector(32.5,17.85,-5.5), --446 -- 14 -- -0,5
    ang = Angle(0,-90,62),
    width = 750,
    height = 135,
    scale = 0.0625,
	hideseat=0.2,

    buttons = {
        {ID = "!DoorsClosed",x=333, y=23, radius=15, tooltip = "Двери закрыты",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_green.mdl",z=0, ang=Angle(0,-62,90),
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_green.mdl",var="DoorsClosed",anim=true,ang=Angle(62,0,0),z=0.5},
        }},
        {ID = "!HVoltage",x=357.3, y=23, radius=15, tooltip = "Сеть контактная",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_green.mdl",z=0, ang=Angle(0,-62,90),
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_green.mdl",var="HVoltage",anim=true,ang=Angle(62,0,0),z=0.5},
        }},
        {ID = "!Red1",x=333.7, y=66, radius=15, tooltip = "",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_red.mdl",z=-0.5, ang=Angle(0,-62,90),
            --lamp = {model = "models/metrostroi_train/common/lamps/svetodiod2.mdl",var="DoorsClosed",z=-5, color=Color(120,255,50)},
        }},
        {ID = "!Red2",x=357.9, y=66, radius=15, tooltip = "",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_red.mdl",z=-0.5, ang=Angle(0,-62,90),
            --lamp = {model = "models/metrostroi_train/common/lamps/svetodiod2.mdl",var="DoorsClosed",z=-5, color=Color(120,255,50)},
        }},

        {ID = "DisableBVSet",x=461.8, y=66, radius=15, tooltip = "Отключение БВ",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_black.mdl",z=-0.5, ang=Angle(0,-62,90),
            var="DisableBV",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		{ID = "!noname",x=486.1, y=66, radius=0, tooltip = "",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_green.mdl",z=0.5, ang=Angle(0,-62,90),
            speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "DoorBlockToggle",x=510.8, y=66, radius=15, tooltip = "Блокировка дверей",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_red.mdl",z=-0.5, ang=Angle(0,-62,90),
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_red.mdl",var="DoorBlockLamp",anim=true,ang=Angle(62,0,0),z=0.5},
            var="DoorBlock",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		{ID = "AutoDriveToggle",x=534.4, y=66, radius=15, tooltip = "Автоведение",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_green.mdl",z=0.5, ang=Angle(0,-62,90),
            var="AutoDrive",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EnableBVSet",x=559, y=66, radius=15, tooltip = "Включение защиты",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_black.mdl",z=-0.5, ang=Angle(0,-62,90),
            var="EnableBV",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "AccelRateSet",x=583, y=66, radius=15, tooltip = "Подъём",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_black.mdl",z=-0.5, ang=Angle(0,-62,90),
            var="AccelRate",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "GlassHeatingToggle",x=607, y=66, radius=15, tooltip = "Обогрев",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_green.mdl",z=0.5, ang=Angle(0,-62,90),
            var="GlassHeating",speed=12, vmin=0, vmax=1,
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_green.mdl",var="GlassHeatingLamp",anim=true,ang=Angle(62,0,0),z=0.5},
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "WiperToggle",x=631.7, y=66, radius=15, tooltip = "Стекло-очиститель",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_blue.mdl",z=-0.5, ang=Angle(0,-62,90),
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_blue.mdl",var="WiperLamp",anim=true,ang=Angle(62,0,0),z=0.5},
            var="Wiper",speed=12, vmin=0, vmax=1, ang=180,
            sndvol = 0.5, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "WasherSet",x=656, y=66, radius=15, tooltip = "Омыватель",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_blue.mdl",z=-0.5, ang=Angle(0,-62,90),
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_blue.mdl",var="WasherLamp",anim=true,ang=Angle(62,0,0),z=0.5},
            var="Washer",speed=12, vmin=0, vmax=1, ang=180,
            sndvol = 0.5, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		--[[
        {ID = "R_Program2Set",x=566.63+36.5*0, y=30.5, radius=15, tooltip = "Программа 2",model = {
            model = "models/metrostroi_train/81-720/buttons/b3.mdl",z=6,--blue
            var="R_Program2",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_AnnouncerToggle",x=566.63+36.5*1, y=30.5, radius=15, tooltip = "Информатор",model = {
            model = "models/metrostroi_train/81-720/buttons/b3.mdl",z=6,--blue
            lamp = {model = "models/metrostroi_train/81-720/buttons/l1.mdl",var="R_AnnouncerLamp",anim=true, color=Color(50,150,200)},
            var="R_Announcer",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_EmerSet",x=566.63+35.5*3, y=30.5, radius=15, tooltip = "Связь экстренная",model = {
            model = "models/metrostroi_train/81-720/buttons/b3.mdl",z=6,--blue
            var="R_Emer",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		]]
		--[[
        {ID = "KAHkToggle",x=137.5+37.83*2-20, y=30.5+10, w=40,h=20, tooltip="Крышка кнопки КАХ\nKAH button cover", model = {
            model = "models/metrostroi_train/81/krishka.mdl", ang = 0, z = 1,
            var="KAHk",speed=8,min=0.43,max=0.68, disable="KAHToggle",
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=70,x=15,y=-45,z=3,var="KAHPl", ID="KAHPl",},
            sndvol = 1, snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
		]]
        {ID = "ALSkToggle",x=420, y=13, w=40,h=20, tooltip="Крышка кнопки АЛС\nALS button cover", model = {
            model = "models/metrostroi_train/81-760/81_760_plomb_als.mdl", ang = Angle(0,-62,90),x=1,y=-0.45, z = 0,
            var="ALSk",speed=8,min=1,max=0,disable="ALSToggle",--disable="KAHToggle",
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=90,x=52,y=-18,z=-6,var="ALSPl", ID="ALSPl",},
            sndvol = 1, snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
        {ID = "ALSToggle",x=461.8, y=23, radius=15, tooltip = "АЛС",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_green.mdl",z=0.5, ang=Angle(0,-62,90),
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_green.mdl",var="ALSLamp",anim=true,ang=Angle(62,0,0),z=0.5},
            var="ALS",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},		
        {ID = "KAHToggle",x=486, y=23, radius=15, tooltip = "КАХ",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_green.mdl",z=0.5, ang=Angle(0,-62,90),
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_green.mdl",var="KAHLamp",anim=true,ang=Angle(62,0,0),z=0.5},
            var="KAH",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "OtklRToggle",x=510.2, y=23, radius=15, tooltip = "Откл рекуперации",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_green.mdl",z=0.5, ang=Angle(0,-62,90),
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_green.mdl",var="OtklRLamp",anim=true,ang=Angle(62,0,0),z=0.5},
            var="OtklR",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "PrToggle",x=534.5, y=23, radius=15, tooltip = "Прогрев колодок",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_green.mdl",z=0.5, ang=Angle(0,-62,90),
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_green.mdl",var="PrLamp",anim=true,ang=Angle(62,0,0),z=0.5},
            var="Pr",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "RingSet",x=559, y=23, radius=15, tooltip = "Передача управления(звонок)",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_black.mdl",z=-0.5, ang=Angle(0,-62,90),
            var="Ring",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "SCToggle",x=583, y=23, radius=15, tooltip = "Связь с СЦ",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_orange.mdl",z=-0.5, ang=Angle(0,-62,90),
            --lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_orange.mdl",var="SCLamp",anim=true,ang=Angle(0,-62,90),z=1},
            var="SC",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_ToBackSet",x=607, y=23, radius=15, tooltip = "Установка в начало",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_yellow.mdl",z=-0.5, ang=Angle(0,-62,90),
            var="R_ToBack",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_ChangeRouteToggle",x=631, y=23, radius=15, tooltip = "Выбор маршрута",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_yellow.mdl",z=-0.5, ang=Angle(0,-62,90),
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_yellow.mdl",var="R_ChangeRouteLamp",anim=true,ang=Angle(62,0,0),z=0.5},
            var="R_ChangeRoute",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_LineToggle",x=655.4, y=23, radius=15, tooltip = "Линия",model = {
			model = "models/metrostroi_train/81-760/81_760_rect_button_yellow.mdl",z=-0.5, ang=Angle(0,-62,90),
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_rect_yellow.mdl",var="R_LineLamp",anim=true,ang=Angle(62,0,0),z=0.5},
            var="R_Line",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},

		--[[
        {ID = "EnableBVEmerSet",x=42, y=110, radius=15, tooltip = "Возврат БВ резервный",model = {
            model = "models/metrostroi_train/81-720/button_circle2.mdl",z=3,
            var="EnableBVEmer",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},]]
    }
}
--[[
ENT.ButtonMap["PUL"] = {
    pos = Vector(473,36,-26.6+1.6), --446 -- 14 -- -0,5
    ang = Angle(0,-90,21.5),
    width = 100,
    height = 280,
    scale = 0.0625,

    buttons = {



    }
}]]
ENT.ButtonMap["PUR"] = {
    pos = Vector(435+20.8,5.7,-11.2+1.5)+Vector(32.5,17.85,-5.5),
    ang = Angle(0,-90,12),
    width = 280,
    height = 280,
    scale = 0.06,
	hideseat=0.2,

    buttons = {
        {ID = "DoorSelectLToggle",x=13, y=55, radius=15, tooltip = "Выбор левых дверей",model = {
            model = "models/metrostroi_train/81-760/81_760_button_white.mdl",z=0,
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_white.mdl",var="DoorLeftLamp",z=0.5,anim=true},
            var="DoorSelectL",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "DoorSelectRToggle",x=55.5, y=55, radius=15, tooltip = "Выбор правых дверей",model = {
            model = "models/metrostroi_train/81-760/81_760_button_white.mdl",z=0,
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_white.mdl",var="DoorRightLamp",z=0.5,anim=true},
            var="DoorSelectR",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "!NEZ1",x=98, y=55,radius = 15, tooltip = "",model = {
            model = "models/metrostroi_train/81-760/81_760_button_green.mdl",z=0.2,
            var="",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "!NEZ2",x=134.7, y=55.4,radius = 15, tooltip = "",model = {
            model = "models/metrostroi_train/81-760/81_760_button_white.mdl",z=0,
            var="",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_MicroSet",x=172.3, y=56,radius = 15, tooltip = "Микрофон",model = {
            model = "models/metrostroi_train/81-760/81_760_button_yellow.mdl",z=0,
            var="R_Micro",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "HeadlightsSwitchToggle",x=233, y=56,radius = 0, tooltip = "Фары",model = {
            getfunc = function(ent) return ent:GetPackedRatio("HeadlightsSwitch") end,var="HeadlightsSwitch",
            model = "models/metrostroi_train/81-760/81_760_button_front_lamps.mdl",z=0,ang=90,
			speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		{ID="HeadlightsSwitch+",x=235, y=56, w=32,h=20, tooltip="Фары +"},
		{ID="HeadlightsSwitch-",x=203, y=56, w=32,h=20, tooltip="Фары -"},

        {ID = "DoorCloseToggle",x=13, y=109, radius=15, tooltip = "Закрытие дверей",model = {
            model = "models/metrostroi_train/81-760/81_760_button_green.mdl",z=-0.5,
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_green.mdl",var="DoorCloseLamp",z=0.5,anim=true,color=Color(80,255,100)},
            var="DoorClose",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_Program1Set",x=55, y=109, radius=15, tooltip = "Пуск записи",model = {
            model = "models/metrostroi_train/81-760/81_760_button_yellow.mdl",z=-0.5,--blue
            var="R_Program1",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "HornBSet",x=97.5, y=109, radius=15, tooltip = "Сигнал",model = {
            model = "models/metrostroi_train/81-760/81_760_button_black.mdl",z=-0.5,
            var="HornB",speed=12, vmin=0, vmax=1,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "AttentionMessageSet",x=169.5, y=110.4, radius=15, tooltip = "Восприятие сообщения",model = {
            model = "models/metrostroi_train/81-760/81_760_button_red.mdl",z=0,
            var="AttentionMessage",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "AttentionBrakeSet",x=201, y=110.4, radius=15, tooltip = "Восприятие торможения",model = {
            model = "models/metrostroi_train/81-760/81_760_button_red.mdl",z=0,
            var="AttentionBrake",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "AttentionSet",x=233, y=110.4, radius=15, tooltip = "Бдительность",model = {
            model = "models/metrostroi_train/81-760/81_760_button_red.mdl",z=0,
            var="Attention",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},

        {ID = "DoorLeftSet",x=20, y=170, radius=15, tooltip = "Левые двери",model = {
            model = "models/metrostroi_train/81-760/81_760_button_white.mdl",z=-0.5,
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_white.mdl",var="DoorLeftLamp",z=0.2,anim=true},
            var="DoorLeft",speed=12, vmin=0, vmax=1,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "DoorRightSet",x=224.8, y=170, radius=15, tooltip = "Прав двери",model = {
            model = "models/metrostroi_train/81-760/81_760_button_white.mdl",z=-0.5,
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_white.mdl",var="DoorRightLamp",z=0.2,anim=true},
            var="DoorRight",speed=12, vmin=0, vmax=1,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["PUR2"] = {
    pos = Vector(418.5+20.8,-21.2,-11.42+1.42)+Vector(32.5,17.85,-8.5),
    ang = Angle(185.5,-115.2,170),
    width = 190,
    height = 160,
    scale = 0.06,
	hideseat=0.2,

    buttons = {
        {ID = "SDToggle",x=172, y=134, radius=15, tooltip = "СД\nSD",model = {
			model = "models/metrostroi_train/81-760/81_760_switch_under_glass.mdl",z=3, ang=90,
            --lamp = {model = "models/metrostroi_train/81-720/buttons/l3.mdl",var="ALSLamp",color=Color(255,80,100), anim=true},
            var="SD",speed=12, vmin=0, vmax=1,
            sndvol = 0.5, snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "SDkToggle",x=150, y=137, w=40,h=20, tooltip="Крышка кнопки СД\nSD button cover", model = {
            model = "models/metrostroi_train/81-760/81_760_cap_with_glass.mdl", ang = -90, z = 3,x=2,y=-13,
            var="SDk",speed=8,min=1,max=0, disable="SDToggle",
            plomb = {model = "",ang=180-70,x=-5,y=-45,z=3,var="SDPl", ID="SDPl",},
            sndvol = 1, snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
        {ID = "BTBToggle",x=122, y=134, radius=15, tooltip = "БТБ\nBTB",model = {
			model = "models/metrostroi_train/81-760/81_760_switch_under_glass.mdl",z=3, ang=90,
            --lamp = {model = "models/metrostroi_train/81-720/buttons/l3.mdl",var="ALSLamp",color=Color(255,80,100), anim=true},
            var="BTB",speed=12, vmin=0, vmax=1,
            sndvol = 0.5, snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "BTBkToggle",x=100, y=137, w=40,h=20, tooltip="Крышка кнопки БТБ\nBTB button cover", model = {
            model = "models/metrostroi_train/81-760/81_760_cap_with_glass.mdl", ang = -90, z = 3,x=2,y=-13,
            var="BTBk",speed=8,min=1,max=0, disable="BTBToggle",
            plomb = {model = "",ang=180-70,x=-5,y=-45,z=3,var="BTBPl", ID="BTBPl",},
            sndvol = 1, snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
        {ID = "MicroToggle",x=55, y=135, radius=15, tooltip = "Микрофон",model = {
            --model = "models/metrostroi_train/81-760/81_760_button_black.mdl",z=-3,
            var="Micro",speed=12, vmin=0, vmax=1,
            --sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},		
		
        {ID = "EmerBrakeAddSet",x=145, y=79.5, radius=15, tooltip = "(резервный) Тормоз",model = {
            model = "models/metrostroi_train/81-760/81_760_button_black.mdl",z=-3,
            var="EmerBrakeAdd",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmerBrakeReleaseSet",x=107, y=79.5, radius=15, tooltip = "(резервный) Отпуск",model = {
            model = "models/metrostroi_train/81-760/81_760_button_white.mdl",z=-3,
            var="EmerBrakeRelease",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_press" or "button_square_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmerBrakeToggle",x=67, y=79.5, radius=15, tooltip = "Тормоз резервный",model = {
            model = "models/metrostroi_train/81-760/81_760_button_with_hole.mdl",z=-3,
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_green.mdl",var="EmerBrakeWork",z=-0.5,anim=true,},
            var="EmerBrake",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},

        {ID = "R_Program11Set",x=120.3, y=29, radius=15, tooltip = "Пуск записи",model = {
            model = "models/metrostroi_train/81-760/81_760_button_yellow.mdl",z=-4,
            var="R_Program11",speed=12,
            sndvol = 0.3, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmergencyBrakeToggle",x=68, y=29, radius=15, tooltip = "Тормоз экстренный",model = {
            model = "models/metrostroi_train/81-760/81_760_switch_emergency.mdl",z=5, ang=180,
            var="EmergencyBrake",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
	},
}
ENT.ButtonMap["RV"] = {
    pos = Vector(478.5,52,-17.25),
    ang = Angle(185,113.5,192.2),--    ang = Angle(-12,13.5,0),
    width = 250,
    height = 250,
    scale = 0.0625,
	hideseat=0.2,

    buttons = {
        {ID = "EmergencyControlsToggle",x=129.6, y=50, radius=15, tooltip = "Управление резервное",model = {
            model = "models/metrostroi_train/81-760/81_760_button_red.mdl",z=0,
			lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_red.mdl",var="EmergencyControlsLamp",z=0.5,anim=true},
            var="EmergencyControls",speed=12, vmin=0, vmax=1, ang=180,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmergencyControlsKToggle",x=105.2, y=51.3, w=40,h=20, tooltip="Крышка кнопки Управление резервное", model = {
            model = "models/metrostroi_train/81-760/81_760_glass_cap.mdl", ang = 90, z = 3,x=2,y=-13,
            var="EmergencyControlsK",speed=8,min=1,max=0, disable="EmergencyControlsToggle",
            sndvol = 1, snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
       {ID = "EmergencyCompressorSet",x=76.5, y=103.5, radius=15, tooltip = "Компрессор резервный",model = {
            model = "models/metrostroi_train/81-760/81_760_button_black.mdl",z=0,
            var="EmergencyCompressor",speed=12, vmin=0, vmax=1,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmergencyDoorsToggle",x=116.5, y=103.5, radius=15, tooltip = "Двери резервные",model = {
            model = "models/metrostroi_train/81-760/81_760_button_green.mdl",z=0,
			lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_green.mdl",var="EmergencyDoorsLamp",z=0.5,anim=true},
            var="EmergencyDoors",speed=12, vmin=0, vmax=1, ang=180,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
		{ID = "EmerCloseDoorsSet",x=155, y=103.5, radius=15, tooltip = "Закрытие дверей резервное",model = {
            model = "models/metrostroi_train/81-760/81_760_button_black.mdl",z=0,
            var="EmerCloseDoors",speed=12, vmin=0, vmax=1,
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},

        {ID = "EmerX1Set",x=77, y=149, radius=15, tooltip = "Ход 1 резервный",model = {
            model = "models/metrostroi_train/81-760/81_760_button_with_hole.mdl",z=0,
            var="EmerX1",speed=12, vmin=0, vmax=1,
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_green.mdl",var="EmerXod",z=-0.8,anim=true,},
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "EmerX2Set",x=116.5, y=149, radius=15, tooltip = "Ход 2 резервный",model = {
            model = "models/metrostroi_train/81-760/81_760_button_with_hole.mdl",z=0,
            var="EmerX2",speed=12, vmin=0, vmax=1,
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_green.mdl",var="EmerXod",z=-0.82,anim=true,},
            sndvol = 0.5, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["PneumoHelper1"] = {
    pos = Vector(486,-14.8,-4.4),
    ang = Angle(5.3,246,61),
    width = 70,
    height = 76*2.5,
    scale = 0.0625,
	hideseat=0.2,

    buttons = {
        {ID = "!BrakeCylinder",x=35, y=38, radius=38, tooltip = "Тормозной цилиндр"},
        {ID = "!BrakeTrainLine",x=35, y=38*4, radius=38, tooltip = "Красная - тормозная, чёрная - напорная магистраль"},

    }
}
ENT.ButtonMap["VoltHelper1"] = {
    pos = Vector(492.55,58.9,15.5),
    ang = Angle(-4.6,-60,95),
    width = 60,
    height = 120,
    scale = 0.055,
	hideseat=0.2,

    buttons = {
        {ID = "!Battery",x=0, y=0, w=60, h=60, tooltip = "Вольтметр бортовой сети(батарея)"},
        {ID = "!HV",x=0, y=60, w=60, h=60, tooltip = "Киловольтметр высокого напряжения(контактный рельс)"},
    }
}
ENT.ButtonMap["ASNP"] = {
    pos = Vector(453.3,62.25,-1), --446 -- 14 -- -0,5
    ang = Angle(0,0,90),
    width = 180,
    height = 100,
    scale = 0.045,
    hideseat=0.2,

    buttons = {
        {ID = "R_ASNPMenuSet",x=63	, y=83.3, radius=15, tooltip = "АСНП: Меню",model = {
            model = "models/metrostroi_train/81-760/81_760_button_asnp.mdl", ang=Angle(-90,0,0),z=2,
            var="R_ASNPMenu",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.3, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_ASNPUpSet",x=158.5, y=29, radius=8, tooltip = "АСНП: Вверх",model = {
            model = "models/metrostroi_train/81-760/81_760_button_asnp.mdl", ang=Angle(-90,0,0),z=3,
            var="R_ASNPUp",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.3, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_ASNPDownSet",x=158.5, y=49, radius=8, tooltip = "АСНП: Вниз",model = {
            model = "models/metrostroi_train/81-760/81_760_button_asnp.mdl", ang=Angle(-90,0,0),z=3,
            var="R_ASNPDown",speed=12, vmin=0, vmax=0.9,
            sndvol = 0.3, snd = function(val) return val and "button_press" or "button_release" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},
        {ID = "R_ASNPOnToggle",x=10.4, y=40.2, radius=8, tooltip = "АСНП: Включение",model = {
            model = "models/metrostroi_train/81-760/81_760_switch_asnp.mdl", ang=Angle(-90,0,0),z=6,
            plomb = {model = "models/metrostroi_train/81/plomb_b.mdl",ang=-90,x=0,y=25,z=-15,var="R_ASNPOnPl", ID="R_ASNPOnPl",},
            var="R_ASNPOn",speed=12,
            sndvol = 0.5, snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),        
		}},
    }
}
ENT.ButtonMap["ASNPScreen"] = {
    pos = Vector(455.18,62.39,-2.33), --446 -- 14 -- -0,5
    ang = Angle(0,0,91),
    width = 512,
    height = 128,
    scale = 0.025/4.24,
	hideseat=0.2,
}
--color=Color(187,255,91) green
--color=Color(255,56,30)  red
--color=Color(255,168,000) yellow

ENT.ButtonMap["RVSScreen"] = {
    pos = Vector(454.817,60.54,-10.64), --446 -- 14 -- -0,5
    ang = Angle(0,0,45),
    width = 256,
    height = 140,
    scale = 0.014,
	hideseat=0.2,
	system = "RVS",
}
ENT.ButtonMap["RVSButtons"] = {
    pos = Vector(451,61.6,-9.4), --446 -- 14 -- -0,5
    ang = Angle(0,0,45),
    width = 400,
    height = 150,
    scale = 0.03,
	hideseat=0.2,
	buttons = {	
		{ID = "RVS_KVSet",x=26, y=32, w=30, h=20, tooltip="КВ", model = {
			z=1,ang=Angle(-90,0,0),
			lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="RVSKV", ang=90,color=Color(187,255,91),x=31,y=8,z=-5},
			var = "RVS_KV",speed=12, --vmin=0, vmax=0.9
		}},
		{ID = "!RVS_KVLamp",x=26, y=32, model = {
			z=1,ang=Angle(-90,0,0),
			lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="RVSKVPRD", ang=90,color=Color(255,56,30),x=46,y=6,z=-5},
		}},		
		{ID = "RVS_UKVSet",x=24, y=115, w=30, h=20, tooltip="УКВ", model = {
			z=1,ang=Angle(-90,0,0),
			lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="RVSUKV", ang=90,color=Color(187,255,91),x=31,y=8,z=-5},
			var = "RVS_UKV",speed=12, --vmin=0, vmax=0.9
		}},		
		{ID = "!RVS_UKVLamp",x=24, y=115, model = {
			z=1,ang=Angle(-90,0,0),
			lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="RVSUKVPRD", ang=90,color=Color(255,56,30),x=46,y=6,z=-5},
		}},			
		
		
		{ID = "RVS_SSet",x=277, y=42, radius = 15, tooltip="С", model = {
			z=1,ang=Angle(-90,0,0),
			lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="RVSPRD", ang=90,color=Color(187,255,91),x=17,y=0,z=-5},
			var = "RVS_S",speed=12, --vmin=0, vmax=0.9
		}},	
		{ID = "RVS_FSet",x=104, y=42, radius = 15, tooltip="F", model = {
			z=1,ang=Angle(-90,0,0),
			--lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="IGLA:ButtonL1", ang=90,color=Color(187,255,91),x=0,y=-5.5,z=0},
			var = "RVS_F",speed=12, --vmin=0, vmax=0.9
		}},			
		
		
		{ID = "RVS_1Set",x=278, y=79, radius = 12, tooltip="1", model = {
			z=1,ang=Angle(-90,0,0),
			lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="RVS1", ang=90,color=Color(187,255,91),x=0,y=-12,z=-5},
			var = "RVS_1",speed=12, --vmin=0, vmax=0.9
		}},	
		{ID = "RVS_2Set",x=303, y=79, radius = 12, tooltip="2", model = {
			z=1,ang=Angle(-90,0,0),
			lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="RVS2", ang=90,color=Color(187,255,91),x=0,y=-12,z=-5},
			var = "RVS_2",speed=12, --vmin=0, vmax=0.9
		}},	
		{ID = "RVS_3Set",x=328, y=79,radius = 12, tooltip="3", model = {
			z=1,ang=Angle(-90,0,0),
			--lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="IGLA:ButtonL1", ang=90,color=Color(187,255,91),x=0,y=-5.5,z=0},
			var = "RVS_3",speed=12, --vmin=0, vmax=0.9
		}},	
		{ID = "RVS_4Set",x=278, y=99, radius = 12, tooltip="4", model = {
			z=1,ang=Angle(-90,0,0),
			--lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="IGLA:ButtonL1", ang=90,color=Color(187,255,91),x=0,y=-5.5,z=0},
			var = "RVS_4",speed=12, --vmin=0, vmax=0.9
		}},	
		{ID = "RVS_5Set",x=303, y=99, radius = 12, tooltip="5", model = {
			z=1,ang=Angle(-90,0,0),
			--lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="IGLA:ButtonL1", ang=90,color=Color(187,255,91),x=0,y=-5.5,z=0},
			var = "RVS_5",speed=12, --vmin=0, vmax=0.9
		}},	
		{ID = "RVS_6Set",x=328, y=99, radius = 12, tooltip="6", model = {
			z=1,ang=Angle(-90,0,0),
			--lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="IGLA:ButtonL1", ang=90,color=Color(187,255,91),x=0,y=-5.5,z=0},
			var = "RVS_6",speed=12, --vmin=0, vmax=0.9
		}},	
		{ID = "RVS_7Set",x=278, y=115, radius = 12, tooltip="7", model = {
			z=1,ang=Angle(-90,0,0),
			--lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="IGLA:ButtonL1", ang=90,color=Color(187,255,91),x=0,y=-5.5,z=0},
			var = "RVS_7",speed=12, --vmin=0, vmax=0.9
		}},	
		{ID = "RVS_8Set",x=303, y=115, radius = 12, tooltip="8", model = {
			z=1,ang=Angle(-90,0,0),
			--lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="IGLA:ButtonL1", ang=90,color=Color(187,255,91),x=0,y=-5.5,z=0},
			var = "RVS_8",speed=12, --vmin=0, vmax=0.9
		}},	
		{ID = "RVS_9Set",x=328, y=115, radius = 12, tooltip="9", model = {
			z=1,ang=Angle(-90,0,0),
			--lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="IGLA:ButtonL1", ang=90,color=Color(187,255,91),x=0,y=-5.5,z=0},
			var = "RVS_9",speed=12, --vmin=0, vmax=0.9
		}},		
		{ID = "RVS_0Set",x=303, y=130, radius = 12, tooltip="0", model = {
			z=1,ang=Angle(-90,0,0),
			--lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl", var="IGLA:ButtonL1", ang=90,color=Color(187,255,91),x=0,y=-5.5,z=0},
			var = "RVS_0",speed=12, --vmin=0, vmax=0.9
		}},			
	}	
}


ENT.ButtonMap["IGLA"] = {
    pos = Vector(452.56,62,3.81), --446 -- 14 -- -0,5
    ang = Angle(0,0,90),
    width = 512,
    height = 93,
    scale = 0.018,
	hideseat=0.2,
	system = "IGLA",
}
ENT.ButtonMap["IGLAButtons"] = {
	pos = Vector(452.5,62,3.82),
	ang = Angle(0,0,90),
	width = 165,
	height = 70,
	scale = 0.0625,
	hideseat=0.2,
		buttons = {
			{ID = "IGLA1Set",x=22+34*0, y=43.5, w=14, h=12, tooltip="ИГЛА: Первая кнопка\nIGLA: First button", model = {
				model = "models/metrostroi_train/81-760/81_760_button_igla.mdl",z=1,ang=Angle(-90,0,0),
				lamp = {speed=16,model = "models/metrostroi_train/81-760/81_760_led_small_mfdu.mdl", var="IGLA:ButtonL1", ang=Angle(-90,0,0),color=Color(187,255,91),x=0,y=-5.5,z=-4.4},
				var = "IGLA1",speed=12, --vmin=0, vmax=0.9
			}},
			{ID = "IGLA2Set",x=21.5+31*1, y=43.5, w=14, h=12, tooltip="ИГЛА: Вторая кнопка\nIGLA: Second button", model = {
				model = "models/metrostroi_train/81-760/81_760_button_igla.mdl",z=1,ang=Angle(-90,0,0),
				lamp = {speed=16,model = "models/metrostroi_train/81-760/81_760_led_small_mfdu.mdl", var="IGLA:ButtonL2", ang=Angle(-90,0,0),color=Color(187,255,91),x=0,y=-5.5,z=-4.4},
				var = "IGLA2",speed=12, --vmin=0, vmax=0.9
			}},
			{ID = "IGLA23",x=21.5+31*1.5, y=43.5, w=14, h=12, tooltip="ИГЛА: Вторая и третья кнопка"},
			{ID = "IGLA3Set",x=21.5+31*1.98, y=43.5, w=14, h=12, tooltip="ИГЛА: Третья кнопка\nIGLA: Third button", model = {
				model = "models/metrostroi_train/81-760/81_760_button_igla.mdl",z=1,ang=Angle(-90,0,0),
				lamp = {speed=16,model = "models/metrostroi_train/81-760/81_760_led_small_mfdu.mdl", var="IGLA:ButtonL3", ang=Angle(-90,0,0),color=Color(187,255,91),x=0,y=-5.5,z=-4.4},
				var = "IGLA3",speed=12, --vmin=0, vmax=0.9
			}},
			{ID = "IGLA4Set",x=20+31*3, y=43.5, w=14, h=12, tooltip="ИГЛА: Четвёртая кнопка\nIGLA: Fourth button", model = {
				model = "models/metrostroi_train/81-760/81_760_button_igla.mdl",z=1,ang=Angle(-90,0,0),
				lamp = {speed=16,model = "models/metrostroi_train/81-760/81_760_led_small_mfdu.mdl", var="IGLA:ButtonL4", ang=Angle(-90,0,0),color=Color(187,255,91),x=0,y=-5.5,z=-4.4},
				var = "IGLA4",speed=12, --vmin=0, vmax=0.9
			}},
			--[[
			{ID = "!IGLAFire",x=151, y=51, radius=3, tooltip="ИГЛА: Пожар", model = {
				lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl", var="IGLA:Fire", color=Color(255,56,30),z=-2.5},
			}},
			{ID = "!IGLAErr",x=151, y=57, radius=3, tooltip="ИГЛА: Неисправность", model = {
				lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl", var="IGLA:Error", color=Color(255,168,000),z=-2.5},
			}},]]
		}
}
for i=1,2 do
	ENT.ButtonMap["Tickers"..i] = {
		pos = Vector((i==1 and 1 or -0.92)*4.35,(i==1 and 1 or -1)*-18.15,54.2), --446 -- 14 -- -0,5
		ang = Angle(0,(i==1 and 1 or -1)*90,95),
		width = 492,
		height = 64,
		scale = 0.074,
		hide=2,
	}
end
--[[
ENT.ButtonMap["BackVent"] = {
    pos = Vector(407.5,20,27.6), --446 -- 14 -- -0,5
    ang = Angle(0,83,90),
    width = 400,
    height = 150,
    scale = 0.0625,

    buttons = {
    {ID = "!VentCondMode",x=173, y=33, radius=0, model = {
        model = "models/metrostroi_train/81-720/rc_rotator1.mdl",z=10,ang=-91,
        sndvol = 0.8, snd = function(val) return val and "switch_batt_on" or "switch_batt_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        getfunc = function(ent) return ent:GetPackedRatio("VentCondMode") end,var="VentCondMode",
        speed=4, min=0.76,max=0.0
    }},
    {ID = "VentCondMode-",x=143,y=13,w=30,h=40,tooltip="Режим работы вентилятора: +"},
    {ID = "VentCondMode+",x=173,y=13,w=30,h=40,tooltip="Режим работы вентилятора: -"},
    {ID = "!VentHeatMode",x=80, y=60.5, radius=0,model = {
        model = "models/metrostroi_train/81-720/rc_rotator1.mdl",z=10,ang=-91,
        sndvol = 0.8, snd = function(val) return val and "switch_batt_on" or "switch_batt_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        --getfunc = function(ent) return ent:GetPackedRatio("VentHeatMode") end,
        var="VentHeatMode",
        speed=4, min=0.25,max=0.75
    }},
    {ID = "VentHeatMode+",x=50,y=40.5,w=30,h=40,tooltip="+"},
    {ID = "VentHeatMode-",x=80,y=40.5,w=30,h=40,tooltip="-"},
    {ID = "!VentStrengthMode",x=173, y=108, radius=0, model = {
        model = "models/metrostroi_train/81-720/rc_rotator1.mdl",z=10,ang=-91,
        sndvol = 0.8, snd = function(val) return val and "switch_batt_on" or "switch_batt_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        getfunc = function(ent) return ent:GetPackedRatio("VentStrengthMode") end,var="VentStrengthMode",
        speed=4, min=0.76,max=0.0
    }},
    {ID = "VentStrengthMode-",x=143,y=88,w=30,h=40,tooltip="Сила вентилятора: +"},
    {ID = "VentStrengthMode+",x=173,y=88,w=30,h=40,tooltip="Сила вентилятора: -"},
    }
}
]]
ENT.ButtonMap["BackPPZ"] = {
    pos = Vector(410.162,34.915,12.26), --446 -- 14 -- -0,5
    ang = Angle(0,90,90),
    width = 440,
    height = 440,
    scale = 0.0605,
	hideseat=0.2,

    buttons = {
        {ID = "SF1Toggle",x=61, y=73, w=34,h=40, tooltip = "SF1: Питание общее",},
        {ID = "SF2Toggle",x=61.5+2*16.5, y=73, w=17,h=40, tooltip = "SF2: Управление основное",},
        {ID = "SF3Toggle",x=61.5+3*16.5, y=73, w=17,h=40, tooltip = "SF3: Управление резервное",},
        {ID = "SF4Toggle",x=61.5+4*16.5, y=73, w=17,h=40, tooltip = "SF4",},--БАРС
        {ID = "SF5Toggle",x=61.5+5*16.5, y=73, w=17,h=40, tooltip = "SF5",},--БУП
        {ID = "SF6Toggle",x=61.5+6*16.5, y=73, w=17,h=40, tooltip = "SF6",},--БЦКУ
        {ID = "SF7Toggle",x=61.5+7*16.5, y=73, w=17,h=40, tooltip = "SF7",},--ППО
        {ID = "SF8Toggle",x=61.5+8*16.5, y=73, w=17,h=40, tooltip = "SF8",},--Оповещение
        {ID = "SF9Toggle",x=61.5+9*16.5, y=73, w=17,h=40, tooltip = "SF9",},--Радиосвязь
        --{ID = "SF10Toggle",x=61.5+10*16.5, y=73, w=17,h=40, tooltip = "SF10",},--Ориентация
        {ID = "SF11Toggle",x=61.5+10*16.5, y=73, w=17,h=40, tooltip = "SF11"},--Направление
        {ID = "SF12Toggle",x=61.5+11*16.5, y=73, w=17,h=40, tooltip = "SF12"},--цис1
        {ID = "SF13Toggle",x=61.5+12*16.5, y=73, w=17,h=40, tooltip = "SF13"},--цис2
        {ID = "SF14Toggle",x=61.5+13*16.5, y=73, w=17,h=40, tooltip = "SF14"},--кондей

        --{ID = "SF12Toggle",x=61.5+0*28.8, y=224.5, w=20,h=40, tooltip = "SF12: Фары 1-й группы",},--1гр фар
        --{ID = "SF13Toggle",x=61.5+1*28.8, y=224.5, w=20,h=40, tooltip = "SF13: Фары 2-й группы",},--2гр фар
        --{ID = "SF14Toggle",x=61.5+2*28.8, y=224.5, w=20,h=40, tooltip = "SF14: Огни габаритные",},--огни габаритные
        {ID = "SF15Toggle",x=61.5+0*16.5, y=213.5, w=17,h=40, tooltip = "SF15",},--осв кабин
        {ID = "SF16Toggle",x=61.5+1*16.5, y=213.5, w=17,h=40, tooltip = "SF16",},--отопление
        {ID = "SF17Toggle",x=61.5+2*16.5, y=213.5, w=17,h=40, tooltip = "SF17",},--конд кабины
        {ID = "SF18Toggle",x=61.5+3*16.5, y=213.5, w=17,h=40, tooltip = "SF18",},--гребнесмазыватель
        {ID = "SF19Toggle",x=61.5+4*16.5, y=213.5, w=17,h=40, tooltip = "SF19",},--крм осн
        {ID = "SF20Toggle",x=61.5+5*16.5, y=213.5, w=17,h=40, tooltip = "SF20",},--крм рез
        {ID = "SF21Toggle",x=61.5+6*16.5, y=213.5, w=17,h=40, tooltip = "SF21",},--двери откр
        {ID = "SF22Toggle",x=61.5+7*16.5, y=213.5, w=17,h=40, tooltip = "SF22"},--двери закр
        {ID = "SF23Toggle",x=61.5+8*16.5, y=213.5, w=17,h=40, tooltip = "SF23"},--двери закр
        --{ID = "SF242Toggle",x=61.5+9*16.5, y=224.5, w=17,h=40, tooltip = "SF24"},--двери закр
        {ID = "SF24Toggle",x=61.5+9*16.5, y=213.5, w=17,h=40, tooltip = "SF24"},--двери закр
        {ID = "SF26Toggle",x=61.5+10*16.5, y=213.5, w=17,h=40, tooltip = "SF26"},--двери закр
        {ID = "SF27Toggle",x=61.5+11*16.5, y=213.5, w=17,h=40, tooltip = "SF27"},--двери закр
        {ID = "SF29Toggle",x=61.5+12*16.5, y=213.5, w=17,h=40, tooltip = "SF29"},
        {ID = "SF28Toggle",x=61.5+13*16.5, y=213.5, w=17,h=40, tooltip = "SF28"},

        {ID = "SA1Toggle",x=51.7+0*20.7, y=313.48, w=20,h=40, tooltip = "SA1",model = {
			model = "models/metrostroi_train/81-760/81_760_switch_pmv_add.mdl",z=7.3,ang=Angle(-180,90,90),
			var="SA1",speed=9, --vmin=1,vmax=0,
			sndvol = 0.8, snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
		}},
        {ID = "SA1kToggle",x=51.7+0*20.7, y=313.48, w=20,h=20, tooltip = "SA1 крышка",model={
			model = "models/metrostroi_train/81-760/81_760_red_cap.mdl",y=4,z=18,ang=Angle(-180,90,90),
			var="SA1k",speed=9, vmin=1,vmax=0,disable="SA1Toggle",
			sndvol = 0.8, snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
		}},
        {ID = "SA2Toggle",x=51.7+1*20.7, y=313.5, w=20,h=40, tooltip = "SA2"},
        {ID = "SA3Toggle",x=51.7+2*20.7, y=313.5, w=20,h=40, tooltip = "SA3"},
        {ID = "SA4Toggle",x=51.7+3*20.7, y=313.5, w=20,h=40, tooltip = "SA4"},
        {ID = "SA5Toggle",x=51.7+4*20.7, y=313.5, w=20,h=40, tooltip = "SA5"},
        {ID = "SA6Toggle",x=51.7+5*20.7, y=313.5, w=20,h=40, tooltip = "SA6"},
        {ID = "SA7Toggle",x=51.7+6*20.7, y=313.5, w=20,h=40, tooltip = "SA7"},
        {ID = "SA8Toggle",x=51.7+7*20.7, y=313.5, w=20,h=40, tooltip = "SA8"},
        {ID = "SA9Toggle",x=51.7+8*20.7, y=313.5, w=20,h=40, tooltip = "SA9"},
        {ID = "SA10Toggle",x=51.7+9*20.7, y=313.5, w=20,h=40, tooltip = "SA10"},
        {ID = "SA10kToggle",x=51.7+9*20.7, y=313.48, w=20,h=20, tooltip = "SA10 крышка",model={
			model = "models/metrostroi_train/81-760/81_760_red_cap.mdl",y=4,z=18,ang=Angle(-180,90,90),
			var="SA10k",speed=9, vmin=1,vmax=0,disable="SA10Toggle",
			sndvol = 0.8, snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
		}},		
        {ID = "SA11Toggle",x=51.7+10*20.7, y=313.5, w=20,h=40, tooltip = "SA11 блокировка кнопок дверей салона"},
        {ID = "SA12Toggle",x=51.7+11*20.7, y=313.5, w=20,h=40, tooltip = "SA12 разблокировка дверей кабины"},		
        {ID = "SA13Toggle",x=51.7+12*20.7, y=313.5, w=20,h=40, tooltip = "SA13"},
        {ID = "SA14Toggle",x=51.7+13*20.7, y=313.5, w=20,h=40, tooltip = "SA14"},
        {ID = "SA14kToggle",x=51.7+13*20.7, y=313.48, w=20,h=20, tooltip = "SA14 крышка",model={
			model = "models/metrostroi_train/81-760/81_760_yellow_cap.mdl",y=4,z=18,ang=Angle(-180,90,90),
			var="SA14k",speed=9, vmin=1,vmax=0,disable="SA14Toggle",
			sndvol = 0.8, snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
		}},
        {ID = "SA15Toggle",x=51.7+14*20.7, y=313.5, w=20,h=40, tooltip = "SA15"},
        {ID = "SA16Toggle",x=51.7+15*20.7, y=313.5, w=20,h=40, tooltip = "SA16"},
        {ID = "SA17Toggle",x=51.7+16*20.7, y=313.5, w=20,h=40, tooltip = "SA17"},

		{ID = "BatteryToggle",x=361, y=63, radius=20, tooltip = "Выключатель батареи",model = {
            model = "models/metrostroi_train/81-760/81_760_switch_vb.mdl",z=6, ang=Angle(0,90,-90),
            var="Battery",speed=4,
            sndvol = 1, snd = function(val) return val and "switch_batt_on" or "switch_batt_off" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
            vmin=0, vmax=1
        }},
        {ID = "!BARSBlock",x=385, y=178, radius=0, model = {
            model = "models/metrostroi_train/81-760/81_760_switch_bcpu.mdl",z=2,ang=Angle(0,90,-90),
            --getfunc = function(ent) return ent:GetPackedRatio("BARSBlock") end,var="BARSBlock",
            plomb = {model = "models/metrostroi_train/81/plomb_b.mdl",ang=-90,x=0,y=27,z=-5,var="BARSBlockPl", ID="BARSBlockPl",},
            speed=4,--min=0.5,max=0.15,
            sndvol = 1, snd = function(_,val) return val==3 and "switch_batt_on" or val == 0 and "switch_batt_off" or "switch_batt" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},	
        {ID = "BARSBlock -",x=354,y=175,w=30,h=40,tooltip="Блокировка неисправных БАРСов: -",model={--  -31
            plomb = {var="BARSBlockPl", ID="BARSBlockPl", },
        }},
        {ID = "BARSBlock +",x=384,y=175,w=30,h=40,tooltip="Блокировка неисправных БАРСов: +", model={--  -1
            plomb = {var="BARSBlockPl", ID="BARSBlockPl", },
        }},
		
        {ID = "!PowerReserve",x=334, y=178, radius=0, model = {
            model = "models/metrostroi_train/81-760/81_760_switch_bcpu.mdl",z=2,ang=Angle(0,90,-90),color = Color(0,0,0),
            --getfunc = function(ent) return ent:GetPackedRatio("BARSBlock") end,var="BARSBlock",
            plomb = {model = "models/metrostroi_train/81/plomb_b.mdl",ang=-90,x=0,y=27,z=-25,var="PowerReservePl", ID="PowerReservePl",},
            speed=4,--min=0.5,max=0.15,
            sndvol = 1, snd = function(_,val) return val==2 and "switch_batt_on" or val == 0 and "switch_batt_off" or "switch_batt" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},	
        {ID = "PowerReserve -",x=303,y=175,w=30,h=40,tooltip="-",model={--  -31
            plomb = {var="PowerReservePl", ID="PowerReservePl", },
        }},
        {ID = "PowerReserve +",x=333,y=175,w=30,h=40,tooltip="+", model={--  -1
            plomb = {var="PowerReservePl", ID="PowerReservePl", },
        }},		
		
		{ID = "PowerOnSet",x=337.7, y=136, radius=20, tooltip = "Бортсеть вкл",model = {
            model = "models/metrostroi_train/81-760/81_760_button_green.mdl",z=-1,
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_green.mdl",var="PowerOnLamp",z=0.4,anim=true},
            var="PowerOn",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},		
		{ID = "PowerOffSet",x=380.7, y=136, radius=20, tooltip = "Бортсеть выкл",model = {
            model = "models/metrostroi_train/81-760/81_760_button_red.mdl",z=-1,
            lamp = {model = "models/metrostroi_train/81-760/81_760_lamp_red.mdl",var="PowerOffLamp",z=0.4,anim=true},
            var="PowerOff",speed=12, vmin=0, vmax=1,
            sndvol = 0.3, snd = function(val) return val and "button_square_on" or "button_square_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
        }},				
    }
}
ENT.ButtonMap["BackPPZ1"] = {
    pos = Vector(410.163,34.915,12.28), --446 -- 14 -- -0,5
    ang = Angle(0,90,90),
    width = 440,
    height = 440,
    scale = 0.0605,
	hideseat=0.2,

    buttons = {

    }
}

for k,buttbl in ipairs(ENT.ButtonMap["BackPPZ"].buttons) do
	if buttbl.ID:find("SF") then
		if k == 1 then
			buttbl.model = {
				model = "models/metrostroi_train/81-760/81_760_double_switch_pmv.mdl",z=-10,ang=Angle(-180,90,90),
				var=buttbl.ID:Replace("Toggle",""),speed=9, vmin=0,vmax=1,
				sndvol = 0.4, snd = function(val) return val and "sf_on" or "sf_off" end,
				sndmin = 90, sndmax = 1e3,
			}
		else
			buttbl.model = {
				model = "models/metrostroi_train/81-760/81_760_switch_pmv.mdl",z=-10,ang=Angle(-180,90,90),
				var=buttbl.ID:Replace("Toggle",""),speed=9, vmin=0,vmax=1,
				sndvol = 0.4, snd = function(val) return val and "sf_on" or "sf_off" end,
				sndmin = 90, sndmax = 1e3,
			}
		end
	elseif buttbl.ID:find("SA") and not buttbl.ID:find("k") and buttbl.ID ~= "SA1" then
		buttbl.model = {
			model = "models/metrostroi_train/81-760/81_760_switch_pmv_add.mdl",z=7.3,ang=Angle(-180,90,90),
			var=buttbl.ID:Replace("Toggle",""),speed=9, vmin=0,vmax=1,
			sndvol = 0.8, snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
		}
	end
end
ENT.ButtonMap["PVZ"] = {
    pos = Vector(394,10.8,12.6), --446 -- 14 -- -0,5
    ang = Angle(0,90,90),
    width = 250,
    height = 170,
    scale = 0.0625,
	hideseat=0.2,

    buttons = {
		{ID = "SF31Toggle",x=0*16+8,y=0,w=16,h=50,tooltip="SF31"},
		{ID = "SF32Toggle",x=1*16+8,y=0,w=32,h=50,tooltip="SF32"},
		{ID = "SF33Toggle",x=3*16+8,y=0,w=32,h=50,tooltip="SF33"},
		{ID = "SF34Toggle",x=5*16+8,y=0,w=16,h=50,tooltip="SF34"},
		{ID = "SF36Toggle",x=6*16+8,y=0,w=16,h=50,tooltip="SF36"},
		{ID = "SF37Toggle",x=7*16+8,y=0,w=16,h=50,tooltip="SF37"},
		{ID = "SF38Toggle",x=8*16+8,y=0,w=16,h=50,tooltip="SF38"},
		{ID = "SF39Toggle",x=9*16+8,y=0,w=16,h=50,tooltip="SF39"},
		{ID = "SF40Toggle",x=10*16+8,y=0,w=16,h=50,tooltip="SF40"},
		{ID = "SF41Toggle",x=11*16+8,y=0,w=16,h=50,tooltip="SF41"},
		{ID = "SF42Toggle",x=12*16+8,y=0,w=16,h=50,tooltip="SF42"},
		{ID = "SF57Toggle",x=13*16+8,y=0,w=16,h=50,tooltip="SF57"},

		{ID = "SF43Toggle",x=0*24+8,y=113,w=16,h=50,tooltip="SF43"},
		{ID = "SF44Toggle",x=1*16+8,y=113,w=16,h=50,tooltip="SF44"},
		{ID = "SF45Toggle",x=2*16+8,y=113,w=16,h=50,tooltip="SF45"},
		{ID = "SF46Toggle",x=3*16+8,y=113,w=16,h=50,tooltip="SF46"},
		{ID = "SF47Toggle",x=4*16+8,y=113,w=16,h=50,tooltip="SF47"},
		{ID = "SF48Toggle",x=5*16+8,y=113,w=16,h=50,tooltip="SF48"},
		{ID = "SF49Toggle",x=6*16+8,y=113,w=16,h=50,tooltip="SF49"},
		{ID = "SF50Toggle",x=7*16+8,y=113,w=16,h=50,tooltip="SF50"},
		{ID = "SF51Toggle",x=8*16+8,y=113,w=16,h=50,tooltip="SF51"},
		{ID = "SF52Toggle",x=9*16+8,y=113,w=16,h=50,tooltip="SF52"},
		{ID = "SF53Toggle",x=10*16+8,y=113,w=16,h=50,tooltip="SF53"},
		{ID = "SF54Toggle",x=11*16+8,y=113,w=16,h=50,tooltip="SF54"},
		{ID = "SF55Toggle",x=12*16+8,y=113,w=16,h=50,tooltip="SF55"},
		{ID = "SF56Toggle",x=13*16+8,y=113,w=16,h=50,tooltip="SF56"},
    }
}

for k,buttbl in ipairs(ENT.ButtonMap["PVZ"].buttons) do
	if k == 2 or k == 3 then
		buttbl.model = {
			model = "models/metrostroi_train/81-760/81_760_double_switch_pmv.mdl",z=-16, ang=Angle(-180,90,90),
			var=buttbl.ID:Replace("Toggle",""),speed=9,
			sndvol = 0.4, snd = function(val) return val and "sf_on" or "sf_off" end,
			sndmin = 90, sndmax = 1e3,
		}
	else
		buttbl.model = {
			model = "models/metrostroi_train/81-760/81_760_switch_pmv.mdl",z=-16, ang=Angle(-180,90,90),
			var=buttbl.ID:Replace("Toggle",""),speed=9,
			sndvol = 0.4, snd = function(val) return val and "sf_on" or "sf_off" end,
			sndmin = 90, sndmax = 1e3,
		}
	end
end
ENT.ButtonMap["VityazButtons"] = {
    pos = Vector(512.95+20.8,1.1,-22.1)+Vector(-41.5,0,17.5),
    ang = Angle(4.9,246,61),
    width = 275,
    height = 200,
    scale = 0.055,
	hideseat=0.2,
    buttons = {
        {ID = "VityazTVSet",x=10, y=10, w=15,h=15, tooltip = "Витязь: Упр ТВ",model = {
			var="VityazTV",speed=16,
        }},
        {ID = "VityazTV1Set",x=10, y=28, w=15,h=15, tooltip = "Витязь: ТВ1",model = {
			var="VityazTV1",speed=16,
        }},
        {ID = "VityazTV2Set",x=10, y=46, w=15,h=15, tooltip = "Витязь: ТВ2",model = {
			var="VityazTV2",speed=16,
        }},
        {ID = "VityazPSet",x=10, y=64, w=15,h=15, tooltip = "Витязь: ",model = {
			var="VityazP",speed=16,
        }},

        {ID = "Vityaz1Set",x=3*0+15.5*0+50, y=165, w=15,h=15, tooltip = "Витязь: 1",model = {
			var="Vityaz1",speed=16,
        }},
        {ID = "Vityaz2Set",x=3*1+15.5*1+50, y=165, w=15,h=15, tooltip = "Витязь: 2",model = {
            var="Vityaz2",speed=16,
        }},
        {ID = "Vityaz3Set",x=3*2+15.5*2+50, y=165, w=15,h=15, tooltip = "Витязь: 3",model = {
            var="Vityaz3",speed=16,
        }},
        {ID = "Vityaz4Set",x=3*3+15.5*3+50, y=165, w=15,h=15, tooltip = "Витязь: 4",model = {
            var="Vityaz4",speed=16,
        }},
        {ID = "Vityaz5Set",x=3*4+15.5*4+50, y=165, w=15,h=15, tooltip = "Витязь: 5",model = {
            var="Vityaz5",speed=16,
        }},
        {ID = "Vityaz6Set",x=3*5+15.5*5+50, y=165, w=15,h=15, tooltip = "Витязь: 6",model = {
            var="Vityaz6",speed=16,
        }},
        {ID = "Vityaz7Set",x=3*6+15.5*6+50, y=165, w=15,h=15, tooltip = "Витязь: 7",model = {
            var="Vityaz7",speed=16,
        }},
        {ID = "Vityaz8Set",x=3*7+15.5*7+50, y=165, w=15,h=15, tooltip = "Витязь: 8",model = {
            var="Vityaz8",speed=16,
        }},
        {ID = "Vityaz9Set",x=3*8+15.5*8+50, y=165, w=15,h=15, tooltip = "Витязь: 9",model = {
            var="Vityaz9",speed=16,
        }},
        {ID = "Vityaz0Set",x=3*9+15.5*9+50, y=165, w=15,h=15, tooltip = "Витязь: 0",model = {
			var="Vityaz0",speed=16,
        }},
        {ID = "VityazF5Set",x=255, y=80, w=20,h=20, tooltip = "Витязь: Сброс",model = {
            var="VityazF5",speed=16,
        }},
        {ID = "VityazF6Set",x=255, y=45, w=20,h=20, tooltip = "Витязь: Вверх",model = {
            var="VityazF6",speed=16,
        }},
        {ID = "VityazF7Set",x=255, y=65, w=20,h=20, tooltip = "Витязь: Вниз",model = {
            var="VityazF7",speed=16,
        }},
        {ID = "VityazF8Set",x=255, y=120, w=20,h=20, tooltip = "Витязь: Ввод",model = {
            var="VityazF8",speed=16,
        }},
        {ID = "VityazF9Set",x=255, y=100, w=20,h=20, tooltip = "Витязь: Выбор",model = {
            var="VityazF9",speed=16,
        }},
        {ID = "VityazHelpSet",x=255, y=25, w=20,h=20, tooltip = "Витязь: ?",model = {
            var="VityazHelp",speed=16,
        }},
        {ID = "VityazKontrSet",x=255, y=5, w=20,h=20, tooltip = "Витязь: КОНТР",model = {
            var="VityazKontr",speed=16,
        }},
        {ID = "!VityazLamp",x=16, y=171, radius=8, model = {
            lamp = {
                model = "models/metrostroi_train/81-760/81_760_led_small_mfdu.mdl",
				ang=Angle(-90,10,0),
                var="VityazLamp",
                z=-9,
                color=Color(255,255,255) --Color(175,250,20)
            },
        }},	
    }
}
ENT.ButtonMap["BMCISButtons"] = {
    pos = Vector(515+20.8,9.5,-21.2)+Vector(-41.5,0,17.5),
    ang = Angle(0,-89.5,62),
    width = 20,
    height = 160,
    scale = 0.035,
	hideseat=0.2,
    buttons = {
        {ID = "BMCISUpSet",x=0, y=0, w=20,h=20, tooltip = "БМЦИС: Вверх",model = {
            var="BMCISUp",speed=16,
        }},
        {ID = "BMCISDownSet",x=0, y=20, w=20,h=20, tooltip = "БМЦИС: Вниз",model = {
            var="BMCISDown",speed=16,
        }},
        {ID = "BMCISEnterSet",x=0, y=40, w=20,h=20, tooltip = "БМЦИС: Ввод",model = {
            var="BMCISEnter",speed=16,
        }},
        {ID = "BMCISEscSet",x=0, y=60, w=20,h=20, tooltip = "БМЦИС: Esc",model = {
            var="BMCISEsc",speed=16,
        }},
        {ID = "BMCISF1Set",x=0, y=80, w=20,h=20, tooltip = "БМЦИС: F1",model = {
            var="BMCISF1",speed=16,
        }},
        {ID = "BMCISF2Set",x=0, y=100, w=20,h=20, tooltip = "БМЦИС: F2",model = {
            var="BMCISF2",speed=16,
        }},
        {ID = "BMCISF3Set",x=0, y=120, w=20,h=20, tooltip = "БМЦИС: F3",model = {
            var="BMCISF3",speed=16,
        }},
        {ID = "BMCISF4Set",x=0, y=140, w=20,h=20, tooltip = "БМЦИС: F4",model = {
            var="BMCISF4",speed=16,
        }},
    }
}
ENT.ButtonMap["SpeedometerButtons"] = {
    pos = Vector(515+20.8,28,-21.2)+Vector(-41.5,0,17.5),
    ang = Angle(0,-89.5,62),
    width = 20,
    height = 160,
    scale = 0.035,
	hideseat=0.2,
    buttons = {
        {ID = "SpeedometerF3Set",x=0, y=120, w=20,h=20, tooltip = "Спидометр: F3",model = {
            var="SpeedometerF3",speed=16,
        }},
    }
}
ENT.ButtonMap["CAMSButtons"] = {
    pos = Vector(466.5+20.8,47.4,-4.72),
    ang = Angle(-4.9,-65,60.5),
    width = 265,
    height = 200,
    scale = 0.055,
	hideseat=0.2,

    buttons = {
        {ID = "CAMS1Set",x=20*0, y=175, w=20,h=20, tooltip = "▼",model = {
            model = "models/metrostroi_train/81-760/81_760_button_cam_green.mdl",z=2.1,
			var="CAMS1",speed=16,
        }},
        {ID = "CAMS2Set",x=20*1, y=175, w=20,h=20, tooltip = "▲",model = {
            model = "models/metrostroi_train/81-760/81_760_button_cam_green.mdl",z=2.1,
			var="CAMS2",speed=16,
        }},
        {ID = "CAMS3Set",x=20*2, y=175, w=20,h=20, tooltip = "3",model = {
            model = "models/metrostroi_train/81-760/81_760_button_cam_green.mdl",z=2.1,
			var="CAMS3",speed=16,
        }},
        {ID = "CAMS4Set",x=20*3, y=175, w=20,h=20, tooltip = "4",model = {
            model = "models/metrostroi_train/81-760/81_760_button_cam_green.mdl",z=2.1,
			var="CAMS4",speed=16,
        }},
        {ID = "CAMS5Set",x=20*4.47, y=175, w=20,h=20, tooltip = "5",model = {
            model = "models/metrostroi_train/81-760/81_760_button_cam_yellow.mdl",z=2.1,
			var="CAMS5",speed=16,
        }},
        {ID = "CAMS6Set",x=20*5.43, y=175, w=20,h=20, tooltip = "6",model = {
            model = "models/metrostroi_train/81-760/81_760_button_cam_yellow.mdl",z=2.1,
			var="CAMS6",speed=16,
        }},
        {ID = "CAMS7Set",x=20*6.39, y=175, w=20,h=20, tooltip = "7",model = {
            model = "models/metrostroi_train/81-760/81_760_button_cam_yellow.mdl",z=2.1,
			var="CAMS7",speed=16,
        }},
        {ID = "CAMS8Set",x=20*7.36, y=175, w=20,h=20, tooltip = "8",model = {
            model = "models/metrostroi_train/81-760/81_760_button_cam_yellow.mdl",z=2.1,
			var="CAMS8",speed=16,
        }},
        {ID = "CAMS9Set",x=20*8.32, y=175, w=20,h=20, tooltip = "9",model = {
            model = "models/metrostroi_train/81-760/81_760_button_cam_yellow.mdl",z=2.1,
			var="CAMS9",speed=16,
        }},
        {ID = "CAMS10Set",x=20*9.28, y=175, w=20,h=20, tooltip = "10",model = {
            model = "models/metrostroi_train/81-760/81_760_button_cam_yellow.mdl",z=2.1,
			var="CAMS10",speed=16,
        }},
    }
}
ENT.ButtonMap["StopKran"] = {
	pos = Vector(462,-62.5,30), --446 -- 14 -- -0,5
	ang = Angle(0,180,90),
	width = 95,
	height = 1300,
	scale = 0.0625,
	hideseat=0.2,

	buttons = {
		--[[
		{ID = "UAVAToggle", x=0,  y=0, w=95,h=200, tooltip="Выключатель автостопа",model = {
			plomb = {var="UAVAPl", ID="UAVAPl", },
		}},]]
		{ID = "EmergencyBrakeValveToggle", x=0,  y=0, w=95,h=1300, tooltip="Стопкран"},

	}
}
ENT.ClientProps["EmergencyBrakeValve"] = {
	model = "models/metrostroi_train/81-760/81_760_crane_emergency_brake.mdl",
	pos = Vector(0.15,0,0),--Vector(455,-55.2,26),
	ang = Angle(0,0,0),
	hideseat=0.5,
}
ENT.ButtonMap["BTO"] = {
    pos = Vector(465.8,58.57,-50), --446 -- 14 -- -0,5
    ang = Angle(0,0,0),
    width = 284,
    height = 50,
    scale = 0.0625,
	hideseat=0.2,

    buttons = {
        {ID = "K29Toggle", x=24,  y=26, radius=25, tooltip="К29", model = {
            --model = "models/metrostroi_train/81-720/720_cran.mdl", ang=-90,
            var="K29",speed=4, max=0.28,
        }},
        {ID = "K9Toggle", x=24+225,  y=22.8, radius=25, tooltip="РВТБ", model = {
            --model = "models/metrostroi_train/81-760/81_760_crane_rvtb.mdl", ang=-90,
            plomb = {model = "",ang=180-70,x=-5,y=-45,z=3,var="K9Pl", ID="K9Pl",},
            var="K9",speed=4, min=0.28,max=0,
        }},
		--[[
        {ID = "UAVAToggle", x=24+280,  y=26, radius=25, tooltip="УАВА", model = {
            model = "models/metrostroi_train/81-720/720_cran.mdl", ang=-90,
            plomb = {var="UAVAPl", ID="UAVAPl", },
            var="UAVA",speed=4, max=0.28
        }},]]
    }
}
ENT.ClientProps["RVTB"] = {
	model = "models/metrostroi_train/81-760/81_760_crane_rvtb.mdl",
	pos = Vector(0.13,0,0),
	ang = Angle(0,0,0),
	hideseat=0.5,
}
ENT.ClientProps["PPZ"] = {
	model = "models/metrostroi_train/81-760/81_760a_ppz.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0),	
	hide=2,
}
ENT.ClientProps["K29"] = {
	model = "models/metrostroi_train/81-760/81_760_crane_k29.mdl",
	pos = Vector(0.07,0,0),
	ang = Angle(0,0,0),
	hideseat=0.5,
}
ENT.ButtonMap["K35"] = {
	pos = Vector(397,-62.5,11.5), --446 -- 14 -- -0,5
	ang = Angle(0,180,90),
	width = 95,
	height = 1000,
	scale = 0.0625,
	hideseat=0.2,

	buttons = {
        {ID = "UAVAToggle", x=0,  y=0, w=95,h=1000, tooltip="К35(УАВА)", model = {
            --model = "models/metrostroi_train/81-720/720_cran.mdl", ang=-90,
            plomb = {var="UAVAPl", ID="UAVAPl", },
            var="UAVA",speed=4, max=0.28
        }},

	}
}
ENT.ClientProps["K35"] = {
	model = "models/metrostroi_train/81-760/81_760_crane_k35.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0),
	hideseat=0.5,
}
ENT.ButtonMap["K31Cap"] = {
    pos = Vector(76.9,57,-13.4), --28
    ang = Angle(0,0,90),
    width = 50,
    height = 50,
    scale = 0.1/2,
	hideseat=0.2,
    buttons = {
        {ID = "K31Cap",x=0,y=0,w=50,h=50, tooltip="Открыть крышку К31", model = {
            var="K31Cap",
        }},
    }
}
ENT.ButtonMap["K31"] = {
    pos = Vector(74.6,60,-13), --28
    ang = Angle(0,0,90),
    width = 150,
    height = 250,
    scale = 0.1/2,
	hideseat=0.2,
    buttons = {
        {ID = "K31Toggle",x=0,y=0,w=150,h=250, tooltip="К31", model = {
            var="K31",
        }},
    }
}
ENT.ClientProps["K31"] = {
	model = "models/metrostroi_train/81-760/81_760_crane_k31.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0),
	hide=0.5,
}
ENT.ClientProps["K31_cap"] = {
	model = "models/metrostroi_train/81-760/81_760_cap_k31.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0),
	hide=0.5,
}
-- Temporary panels (possibly temporary)
ENT.ButtonMap["FrontPneumatic"] = {
    pos = Vector(506,-45.0,-56.5),
    ang = Angle(0,90,90),
    width = 900,
    height = 100,
    scale = 0.1,
    hideseat=0.2,
    hide=true,
    screenHide = false,
    buttons = {
        {ID = "FrontBrakeLineIsolationToggle",x=132, y=64, radius=32, tooltip="Концевой кран тормозной магистрали", model = {
            var="FrontBrakeLineIsolation",sndid="FrontBrake",
            --model = "models/metrostroi_train/81-760/81_760_crane_tm_out.mdl", ang=Angle(0,90,-35), z=-1,y=0,
           -- speed=4,vmin=1,vmax=0,
            --sndvol = 1, snd = function(val) return "disconnectvalve" end,
            --sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
        {ID = "FrontTrainLineIsolationToggle",x=767.6, y=64, radius=32, tooltip="Концевой кран напорной магистрали", model = {
            var="FrontTrainLineIsolation",sndid="FrontTrain",
            --model = "models/metrostroi_train/81-760/81_760_crane_nm_out.mdl", ang=Angle(180,90,35), z=-1,y=0,
            --speed=4,vmin=1,vmax=0,
            --sndvol = 1, snd = function(val) return "disconnectvalve" end,
            --sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ClientProps["FrontBrake"] = {--
    model = "models/metrostroi_train/81-760/81_760_crane_tm_out.mdl",
    pos = Vector(509.06, -31.7, -63.1),
	ang=Angle(180,180,-165),
    hide = 2,
}
ENT.ClientProps["FrontTrain"] = {--
    model = "models/metrostroi_train/81-760/81_760_crane_nm_out.mdl",
    pos = Vector(509.06, 31.65, -63.1),
	ang=Angle(180,180,165),
    hide = 2,
}
ENT.ClientSounds["FrontBrakeLineIsolation"] = {{"FrontBrake",function() return "disconnectvalve" end,1,1,50,1e3,Angle(-90,0,0)}}
ENT.ClientSounds["FrontTrainLineIsolation"] = {{"FrontTrain",function() return "disconnectvalve" end,1,1,50,1e3,Angle(-90,0,0)}}

ENT.ButtonMap["RearPneumatic"] = {
    pos = Vector(-458.0,-65.0,-57.7),
    ang = Angle(0,0,90),
    width = 230,
    height = 100,
    scale = 0.1,
    hideseat=0.2,
    hide=true,
    --screenHide = true,
    buttons = {
        {ID = "RearBrakeLineIsolationToggle",x=92, y=64, radius=32, tooltip="Концевой кран тормозной магистрали", model = {
            var="RearBrakeLineIsolation",sndid="RearBrake",
            --model = "models/metrostroi_train/81-760/81_760_crane_tm_out.mdl", ang=Angle(0,90,-35), z=-1,y=0,
            --speed=4,vmin=1,vmax=0,
            --sndvol = 1, snd = function(val) return "disconnectvalve" end,
            --sndmin = 50, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
        {ID = "RearTrainLineIsolationToggle",x=192, y=64, radius=32, tooltip="Концевой кран напорной магистрали", model = {
            var="RearTrainLineIsolation",sndid="RearTrain",
            --model = "models/metrostroi_train/81-760/81_760_crane_nm_out.mdl", ang=Angle(180,90,35), z=-1,y=0,
            --speed=4,vmin=1,vmax=0,
            --sndvol = 1, snd = function(val) return "disconnectvalve" end,
            --sndmin = 50, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ClientProps["RearBrake"] = {--
    model = "models/metrostroi_train/81-760/81_760_crane_k23.mdl",
    pos = Vector(-449.1, -63.2, -64.1),
	ang=Angle(0,90,0),
    hide = 2,
}
ENT.ClientProps["RearTrain"] = {--
    model = "models/metrostroi_train/81-760/81_760_crane_k23.mdl",
    pos = Vector(-439.2, -60.35, -66.1),
	ang=Angle(0,90,0),
    hide = 2,
}
ENT.ClientSounds["RearBrakeLineIsolation"] = {{"RearBrake",function() return "disconnectvalve" end,1,1,50,1e3,Angle(-90,0,0)}}
ENT.ClientSounds["RearTrainLineIsolation"] = {{"RearTrain",function() return "disconnectvalve" end,1,1,50,1e3,Angle(-90,0,0)}}

ENT.ButtonMap["K23M"] = {
    pos = Vector(123,-60,-58),
    ang = Angle(0,0,90),
    width = 170,
    height = 150,
    scale = 0.1,
    buttons = {  
        {ID = "K23Toggle",x=0, y=0, w= 170,h = 150, tooltip="К23", model = {
            var="K23",sndid = "K23",
			--sndvol = 0.8,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
            --snd = function(val) return val and "gv_f" or "gv_b" end,
        }},
    }
}
ENT.ClientProps["K23Valve"] = {--
    model = "models/metrostroi_train/81-760/81_760_crane_k23.mdl",
    pos = Vector(131.42,-64.14, -64.6),
	ang=Angle(0,0,0),
    hide = 2,
}
ENT.ClientSounds["K23ValveIsolation"] = {{"K23Valve",function() return "disconnectvalve" end,1,1,50,1e3,Angle(-90,0,0)}}

ENT.ButtonMap["PassengerDoor"] = {
    pos = Vector(380,-28.5,40), --28
    ang = Angle(0,90,90),
    width = 730,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "PassengerDoor",x=0,y=0,w=730,h=2000, tooltip="Дверь в кабину машиниста из салона\nPass door", model = {
            var="PassengerDoor",sndid="door_cab_m",
            sndvol = 1, snd = function(val) return val and "door_cab_open" or "door_cab_close" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["PassengerDoor2"] = {
    pos = Vector(380,8,40), --28
    ang = Angle(0,-90,90),
    width = 730,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "PassengerDoor",x=0,y=0,w=730,h=2000, tooltip="Дверь в кабину машиниста из салона\nPass door"},
    }
}
ENT.ButtonMap["Chair"] = {
    pos = Vector(411,-54,-3), --28
    ang = Angle(0,90,90),
    width = 730,
    height = 1000,
    scale = 0.1/3.8	,

    buttons = {
        {ID = "Chair",x=0,y=0,w=730,h=1000, tooltip="Сидуха"},
    }
}
ENT.ButtonMap["Door_pvz"] = {
    pos = Vector(411.6,21,42), --28
    ang = Angle(0,90,90),
    width = 235,
    height = 1840,
    scale = 0.1/2,
    buttons = {
        {ID = "Door_pvz",x=0,y=0,w=235,h=1840, tooltip="Шкаф", model = {
            var="Door_pvz",
        }},
    }
}
ENT.ButtonMap["Door_pvzo"] = {
    pos = Vector(413.6,-13,42), --28
    ang = Angle(0,180,90),
    width = 235,
    height = 1840,
    scale = 0.1/2,
    buttons = {
        {ID = "Door_pvz",x=0,y=0,w=235,h=1840, tooltip="Шкаф", model = {
            var="Door_pvz",
        }},
    }
}
ENT.ButtonMap["Door_add_1"] = {
    pos = Vector(411.2,-57.5,45), --28
    ang = Angle(0,90,90),
    width = 100,
    height = 200,
    scale = 0.23,
    buttons = {
        {ID = "Door_add_1",x=0,y=0,w=100,h=200, tooltip="Шкаф", model = {
            var="Door_add_1",
        }},
    }
}
ENT.ButtonMap["Door_add_1o"] = {
    pos = Vector(435.2,-58.5,45), --28
    ang = Angle(0,180,90),
    width = 100,
    height = 200,
    scale = 0.23,
    buttons = {
        {ID = "Door_add_1",x=0,y=0,w=100,h=200, tooltip="Шкаф", model = {
            var="Door_add_1",
        }},
    }
}
ENT.ButtonMap["Door_add_2"] = {
    pos = Vector(406.5,-30.2,45.5), --28
    ang = Angle(0,180,90),
    width = 350,
    height = 1910,
    scale = 0.1/2,
    buttons = {
        {ID = "Door_add_2",x=0,y=0,w=350,h=1910, tooltip="Шкаф", model = {
            var="Door_add_2",
        }},
    }
}
ENT.ButtonMap["Door_add_2o"] = {
    pos = Vector(390.5,-30.2,45.5), --28
    ang = Angle(0,90,90),
    width = 350,
    height = 1910,
    scale = 0.1/2,
    buttons = {
        {ID = "Door_add_2",x=0,y=0,w=350,h=1910, tooltip="Шкаф", model = {
            var="Door_add_2",
        }},
    }
}

ENT.ButtonMap["CabinDoorL"] = {
    pos = Vector(413.82,64.5,49.2),
    ang = Angle(0,0,91),
    width = 710,
    height = 2030,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoorLeft",x=0,y=0,w=710,h=2030, tooltip="Дверь в кабину машиниста\nCabin door", model = {
            var="CabinDoorLeft",sndid="door_cab_l",
        }},
    }
}
ENT.ButtonMap["CabinDoorL1"] = {
    pos = Vector(413.82,67.5,-52.3),
    ang = Angle(0,0,-89),
    width = 710,
    height = 2030,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoorLeft",x=0,y=0,w=710,h=2030, tooltip="Дверь в кабину машиниста\nCabin door", model = {
            var="CabinDoorLeft",sndid="door_cab_l",
        }},
    }
}
ENT.ButtonMap["CabinDoorR"] = {
    pos = Vector(449.82,-64.5,49.2),
    ang = Angle(0,180,91),
    width = 710,
    height = 2030,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoorRight",x=0,y=0,w=710,h=2030, tooltip="Дверь в кабину машиниста\nCabin door", model = {
            var="CabinDoorRight",sndid="door_cab_r",
        }},
    }
}
ENT.ButtonMap["CabinDoorR1"] = {
    pos = Vector(449.82,-67.5,-52.3),
    ang = Angle(0,180,-89),
    width = 710,
    height = 2030,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoorRight",x=0,y=0,w=710,h=2030, tooltip="Дверь в кабину машиниста\nCabin door", model = {
            var="CabinDoorRight",sndid="door_cab_r",
        }},
    }
}

for i=0,4 do
    ENT.ClientProps["TrainNumber"..i] = {
        model = "models/metrostroi_train/81-760/numbers/number_0.mdl",
        pos = Vector(0,0,0),
        ang = Angle(-6,0,0),
		hide = 1.5,
        callback = function(ent)
            ent.WagonNumber = false
        end,
	}
    ENT.ClientProps["TrainNumberL"..i] = {
        model = "models/metrostroi_train/81-760/numbers/number_0.mdl",
        pos = Vector(0,0,0),
        ang = Angle(0,90,0),
		hide = 1.5,
        callback = function(ent)
            ent.WagonNumber = false
        end,
    }
    ENT.ClientProps["TrainNumberR"..i] = {
        model = "models/metrostroi_train/81-760/numbers/number_0.mdl",
        pos = Vector(0,0,0),
        ang = Angle(0,-90,0),
		hide = 1.5,
        callback = function(ent)
            ent.WagonNumber = false
        end,
    }
end

--[[
table.insert(ENT.ClientProps,{
    model = "models/cricket_metrostroi/81-760/760_interior_lod0.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0)
})
table.insert(ENT.ClientProps,{
    model = "models/cricket_metrostroi/81-760/760_interior_seats_lod0.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0)
})]]
ENT.ClientProps["Salon"] = {
    model = "models/metrostroi_train/81-760/81_760a_int.mdl",
    pos = Vector(0,0,0),--Vector(55.5,0,-54.25),
    ang = Angle(0,0,0),
	hide=2,
}
ENT.ClientProps["Cabin"] = {
    model = "models/metrostroi_train/81-760/81_760_cockpit.mdl",
    pos = Vector(0,0,0),--Vector(55.5,0,-54.25),
    ang = Angle(0,0,0),
	hide=2,
}
ENT.ClientProps["micro"] = {
    model = "models/metrostroi_train/81-760/81_760_microphone.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
	hide=2,
}
ENT.ClientProps["mfdu_stl"] = {
    model = "models/metrostroi_train/81-760/81_760_mfdu_stl.mdl",
    pos = Vector(0,0,0),--Vector(55.5,0,-54.25),
    ang = Angle(0,0,0),
	hide=2,
}
ENT.ClientProps["label_stl"] = {
	model = "models/metrostroi_train/81-760/81_760_label_stl.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0),
	hide = 2,
}
ENT.ClientProps["RedLights0"] = {
    model = "models/metrostroi_train/81-760/81_760_lamp_red_off.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["RedLights1"] = {
    model = "models/metrostroi_train/81-760/81_760_lamp_red_on.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["HeadLights0"] = {
    model = "models/metrostroi_train/81-760/81_760_headlamps.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["HeadLights1"] = {
    model = "models/metrostroi_train/81-760/81_760_headlamps_half.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["HeadLights2"] = {
    model = "models/metrostroi_train/81-760/81_760_headlamps_full.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    nohide=true,
}

table.insert(ENT.ClientProps,{
	model = "models/metrostroi_train/81-760/81_760_underwagon.mdl",
    pos = Vector(0,0,0),--Vector(-60,0,-79),
    ang = Angle(0,0,0),
	hide=2,
})
ENT.ClientProps["nm_tm"] = {
	model = "models/metrostroi_train/81-760/81_760a_crane_nm_tm.mdl",
    pos = Vector(0,0,0),--Vector(53,-12,-56.5),
    ang = Angle(0,0,0),
	hide=2,	
}
ENT.ClientProps["fan_kti"] = {
	model = "models/metrostroi_train/81-760/81_760_fan_kti.mdl",
    pos = Vector(0,0,0),--Vector(53,-12,-56.5),
    ang = Angle(0,0,0),
	hide=1.5,
}
ENT.ClientProps["fan_r"] = {
	model = "models/metrostroi_train/81-760/81_760_fan_r.mdl",
    pos = Vector(0,0,0),--Vector(-193.5,-39,-75.2),
    ang = Angle(0,0,0),
	hide=1.5,
}

ENT.ClientProps["PassSchemes"] = {
    model = "models/metrostroi_train/81-760/81_760_panel_l.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
	hide=1.5,
}
ENT.ClientProps["PassSchemesR"] = {
    model = "models/metrostroi_train/81-760/81_760_panel_r.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
	hide=1.5,
}
for i=1,5 do
    ENT.ClientProps["led_l_f"..i] = {
        model = "models/metrostroi_train/81-760/81_760_bnt_led_l_rev.mdl",--"models/metrostroi_train/81-720/720_led_l_r.mdl",
        pos = Vector((i-1)*6.73),--Vector((i-1)*10.5+0.2,0,0),
        ang = Angle(0,0,0),
        skin=6,
		hideseat=1.5,
    }
    ENT.ClientProps["led_l_b"..i] = {--b
        model = "models/metrostroi_train/81-760/81_760_bnt_led_l.mdl",--"models/metrostroi_train/81-720/720_led_l.mdl",
        pos = Vector(-(i-1)*6.73,0,0),
        ang = Angle(0,0,0),
        skin=6,
		hideseat=1.5,
    }
    ENT.ClientProps["led_r_f"..i] = {
        model = "models/metrostroi_train/81-760/81_760_bnt_led_r_rev.mdl",--"models/metrostroi_train/81-720/720_led_l_r.mdl",
        pos = Vector((i-1)*6.73-26.93),--Vector((i-1)*10.5+0.2,0,0),
        ang = Angle(0,0,0),
        skin=6,
		hideseat=1.5,
    }

    ENT.ClientProps["led_r_b"..i] = {
        model = "models/metrostroi_train/81-760/81_760_bnt_led_r.mdl",--"models/metrostroi_train/81-720/720_led_l_r.mdl",
        pos = Vector(-(i-1)*6.73+26.93),--Vector((i-1)*10.5+0.2,0,0),
        ang = Angle(0,0,0),
        skin=6,
		hideseat=1.5,
    }
end

ENT.ButtonMap["GV"] = {
    pos = Vector(-166.9,42,-52-15),
    ang = Angle(0,90,90),
    width = 170,
    height = 150,
    scale = 0.1,
    buttons = {
        {ID = "GVToggle",x=0, y=0, w= 170,h = 150, tooltip="Разъединитель БРУ (ГВ)", model = {
            var="GV",sndid = "gv_wrench",
            sndvol = 0.8,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
            snd = function(val) return val and "gv_f" or "gv_b" end,
        }},
    }
}
ENT.ClientProps["gv_wrench"] = {
    model = "models/metrostroi_train/reversor/reversor_classic.mdl",
    pos = Vector(-167.5,49.47,-74.07),
    ang = Angle(-90,180,0),
	hide=0.5,
}

--[[
local yventpos = {
    -414.5+0*117,
    -414.5+1*117+6.2,
    -414.5+2*117+5,
    -414.5+3*117+2,
    -414.5+4*117+0.5,
    -414.5+5*117-2.3,
    -414.5+6*117-2.3,
}
for i=1,7 do
    ENT.ClientProps["vent"..i] = {
        model = "models/metrostroi_train/81-720/vent.mdl",
        pos = Vector(yventpos[i],0,57.2),
        ang = Angle(0,0,0)
    }
end]]
--------------------------------------------------------------------------------
-- Add doors
--------------------------------------------------------------------------------
local function GetDoorPosition(i,k,j)
    if j == 0
    then return Vector(381 - 36.0 + 1*(k) -0.85*(k == 1 and 1 or 0) - 230*i,-66*(1-2*k),-1)
    else return Vector(381 - 36.0 + 1*(k) -0.85*(k == 1 and 1 or 0) - 230*i,-66*(1-2*k),-1)
    end
end
for i=0,3 do
    for k=0,1 do
		ENT.ClientProps["door"..i.."x"..k] = {
            model = "models/metrostroi_train/81-760/81_760_door_"..(i+1)..".mdl",
            pos = Vector(0,0,0),
            ang = Angle(0,180+k*180,0),
			hide=2,	
		}
    end
end
ENT.ClientProps["door_cab_m"] = {
    model = "models/metrostroi_train/81-760/81_760_door_cab_c.mdl",
    pos = Vector(0,0,0),--Vector(380,5,-12.3),
    ang = Angle(0,0,0),
	hide=2,
}
ENT.ClientProps["door_cab_l"] = {
    model = "models/metrostroi_train/81-760/81_760_door_cab_l.mdl",
    pos = Vector(0,0,0),--Vector(412.8,63.2,34.5),
    ang = Angle(0,0,0),
	hide=2,

}
ENT.ClientProps["door_cab_r"] = {
    model = "models/metrostroi_train/81-760/81_760_door_cab_r.mdl",
    pos = Vector(0,0,0),--Vector(412.8,-63.2,34.5),
    ang = Angle(0,0,0),
	hide=2,

}
ENT.ClientProps["door_add_1"] = {
    model = "models/metrostroi_train/81-760/81_760_door_add_1.mdl",
    pos = Vector(0,0,0),--Vector(410.5,-57.4,23.3),
    ang = Angle(0,0,0),
	hide=2,	
}
ENT.ClientProps["door_add_2"] = {
    model = "models/metrostroi_train/81-760/81_760_door_add_2.mdl",
    pos = Vector(0,0,0),--Vector(387.2,-28.1,-2.2),
    ang = Angle(0,0,0),
	hide=2,
}
ENT.ClientProps["door_pvz"] = {
    model = "models/metrostroi_train/81-760/81_760_door_pvz.mdl",
    pos = Vector(0,0,0),--Vector(385.93,7.5,-4),
    ang = Angle(0,0,0),
	hide=2,
}
ENT.ClientProps["cab_chair_add"] = {
    model = "models/metrostroi_train/81-760/81_760_cab_chair_add.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
	hideseat=0.5,
}
ENT.ClientProps["wiper"] = {
    model = "models/metrostroi_train/81-760/81_760_wiper.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
	hide=2,
}
ENT.ClientProps["KRO"] = {
    model = "models/metrostroi_train/81-760/81_760_switch_kro.mdl",
    pos = Vector(479.93,40.5,-15.8),
    ang = Angle(-12,26,0),
	hideseat=0.5,
}
ENT.ClientProps["KRR"] = {
    model = "models/metrostroi_train/81-760/81_760_switch_krr.mdl",
    pos = Vector(477.5,46.08,-16.3),
    ang = Angle(-12,26,0),
	hideseat=0.5,
}
ENT.ClientProps["controller"] = {
    model = "models/metrostroi_train/81-760/81_760_km.mdl",
    pos = Vector(0.25,0,0),
    ang = Angle(0,0,0),
	hideseat=0.5,
}
ENT.ClientProps["km013"] = {
    model = "models/metrostroi_train/81-760/81_760_km_013.mdl",
    pos = Vector(457.15+21.2,-10.9,-20.85),
    ang = Angle(0,0,0),
	hideseat=0.5,
}
if not ENT.ClientSounds["br_013"] then ENT.ClientSounds["br_013"] = {} end
table.insert(ENT.ClientSounds["br_013"],{"km013",function(ent,_,var) return "br_013" end,1,1,50,1e3,Angle(-90,0,0)})

ENT.ClientProps["PB"] = {
    model = "models/metrostroi_train/81-760/81_760_pedal.mdl",
    pos = Vector(489,53.6,-43.55),
    ang = Angle(0,0,0),
}
if not ENT.ClientSounds["PB"] then ENT.ClientSounds["PB"] = {} end
table.insert(ENT.ClientSounds["PB"],{"PB",function(ent,var) return var > 0 and "pb_on" or "pb_off" end,1,1,50,1e3,Angle(-90,0,0)})

--[[
ENT.ClientProps["mezhvag"] = {
    model = "models/metrostroi_train/81-760/81_760_fence.mdl",--"models/metrostroi/mezhvag.mdl",
    pos = Vector(-470.8,0,-15),-- -474.7 1.27 -467
    ang = Angle(0,90,0),
	hide=2,
}]]
ENT.ClientProps["fence"] = {
    model = "models/metrostroi_train/81-760/81_760_fence_corrugated_platform.mdl",--"models/metrostroi/mezhvag.mdl",
    pos = Vector(-480.15,0,0),-- -474.7 1.27 -467
    ang = Angle(0,90,0),
	hide=2,
}
local pos = {
	[1] = Vector(-27.93,40.5,-18.36),
	[2] = Vector(-27.93,-39.5,-18.36),
	[3] = Vector(27.93,39.5,-18.36),
	[4] = Vector(27.93,-40.5,-18.36),	
}
for i=1,8 do
	ENT.ClientProps["brake_shoe"..i] = {
		model = "models/metrostroi_train/81-760/81_760_brake_shoe.mdl",
		pos = Vector(0,0,-78),
		ang = Angle(0,180-180*(i%2),0),
		hide = 0.5,
		callback = function(ent,cl_ent)
			local bogey = i <= 4 and ent:GetNW2Entity("FrontBogey") or i > 4 and ent:GetNW2Entity("RearBogey")
			if not IsValid(bogey) then
				ent:ShowHide("brake_shoe"..i,false)
				return
			end
			cl_ent:SetParent(bogey)
			cl_ent:SetPos(bogey:LocalToWorld(pos[i > 4 and i-4 or i]))
			local ang = bogey:GetAngles()	
			cl_ent:SetAngles((i <= 2 or i > 4 and i <=6) and Angle(-ang.x,180+ang.y,-ang.z) or ang)
        end,			
	}
end
for i=1,4 do
	ENT.ClientProps["TR"..i] = {
		model = "models/metrostroi_train/81-760/81_760_pantograph.mdl",
		pos = Vector(0,0,0),
		ang = Angle(0,180*(i%2),0),
		hide = 2,
        callback = function(ent,cl_ent)
			local rearbogey,frontbogey = ent:GetNW2Entity("RearBogey"),ent:GetNW2Entity("FrontBogey")
			if i <= 2 then
				if not IsValid(frontbogey) then				
					ent:ShowHide("TR"..i,false)
					return
				end
				cl_ent:SetParent(frontbogey)
				cl_ent:SetPos(frontbogey:GetPos())
				local ang = frontbogey:GetAngles()
				cl_ent:SetAngles(i%2 == 1 and Angle(-ang.x,180+ang.y,-ang.z) or ang)				
			else
				if not IsValid(rearbogey) then
					ent:ShowHide("TR"..i,false)					
					return
				end
				cl_ent:SetParent(rearbogey)	
				cl_ent:SetPos(rearbogey:GetPos())
				local ang = rearbogey:GetAngles()
				cl_ent:SetAngles(i%2 == 1 and Angle(-ang.x,180+ang.y,-ang.z) or ang)					
			end
        end,		
	}
end
ENT.ClientProps["SK1"] = {
	model = "models/metrostroi_train/81-760/81_760_brake_valve.mdl",
	pos = Vector(0,0,-78),
	ang = Angle(0,180,0),
	hide = 1.1,
    callback = function(ent,cl_ent)
		local frontbogey = ent:GetNW2Entity("FrontBogey")
		if not IsValid(frontbogey) then
			ent:ShowHide("SK1",false)
			return
		end
		cl_ent:SetParent(frontbogey)
		cl_ent:SetPos(frontbogey:GetPos())
		local ang = frontbogey:GetAngles()
		cl_ent:SetAngles(Angle(-ang.x,180+ang.y,-ang.z))
	end,
}
ENT.ClientProps["brake_cylinder"] = {
	model = "models/metrostroi_train/81-760/81_760_arrow_nm.mdl",
	pos = Vector(484.55,-16.3,-7.06),
	ang = Angle(29,-21.65,-42),--Angle(28.65,-22,-42),
	hideseat = 0.2,
}
ENT.ClientProps["train_line"] = {
	model = "models/metrostroi_train/81-760/81_760_arrow_nm.mdl",
	pos = Vector(481.65,-14.35,-13.02),
	ang = Angle(29,-22,-52),
	hideseat = 0.2,
}
ENT.ClientProps["brake_line"] = {
	model = "models/metrostroi_train/81-760/81_760_arrow_tm.mdl",
	pos = Vector(481.65,-14.35,-12.95),
	ang = Angle(29,-22,-51),
	hideseat = 0.2,
}
ENT.ClientProps["lamp1"] = {
	model = "models/metrostroi_train/81-760/81_760_lamp_int_half.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0),
	hide = 2,
}
ENT.ClientProps["lamp2"] = {
	model = "models/metrostroi_train/81-760/81_760_lamp_int_full.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0),
	hide = 2,
}
ENT.ClientProps["cab_emer"] = {
    model = "models/metrostroi_train/81-760/81_760_lamp_cockpit.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat = 1.1,
    --color = Color(206,162,153),
}
ENT.ClientProps["box_int_1"] = {
	model = "models/metrostroi_train/81-760/81_760_box_int_1.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0),
	hideseat = 1.1,
}
ENT.ClientProps["box_int_2"] = {
	model = "models/metrostroi_train/81-760/81_760_box_int_2.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0),
	hideseat = 1.1,
}
ENT.ClientProps["zoomer_lamps"] = {
	model = "models/metrostroi_train/81-760/81_760_zoomer_lamps.mdl",
	pos = Vector(0,0,0),
	ang = Angle(0,0,0),
	hide=1.1,
}
ENT.ClientProps["volt_lv"] = {
	model = "models/metrostroi_train/81-760/81_760_arrow_electric.mdl",
    pos = Vector(493.91,57.413,13.55),
    ang = Angle(-4,-60,5),
	hide = 0.2,
}
ENT.ClientProps["volt_hv"] = {
	model = "models/metrostroi_train/81-760/81_760_arrow_electric.mdl",
    pos = Vector(494.54,57.23,9.04),
    ang = Angle(-6,-60,5),
	hide = 0.2,
}
ENT.ClientProps["ampermetr"] = {
	model = "models/metrostroi_train/81-760/81_760_arrow_electric.mdl",
    pos = Vector(389.2,17.99,19.6), 
    ang = Angle(0,90,0),
	hide = 0.2,
}
ENT.Lights = {
    -- Headlight glow 
    [1] = { "headlight",        Vector(507,0,-40), Angle(0,0,90), Color(120,153,255), hfov=80, vfov=80,farz=5144,brightness = 8},--Color(206,161,141),
    --[1] = { "headlight",        Vector(507,-36,-40), Angle(0,0,90), Color(120,153,255), hfov=80, vfov=80,farz=5144,brightness = 8},--Color(206,161,141),
    [2] = { "headlight",        Vector(510,0,-40), Angle(0,0,0), Color(255,0,0), fov=170 ,brightness = 0.1, farz=250,texture = "models/metrostroi_train/equipment/headlight2",shadows = 0,backlight=true},
	
	[11] = { "headlight",		Vector(484.4,-16.5,-4.3), Angle(95,240,0), Color(200,200,200), farz = 5, nearz = 2, shadows = 0, brightness = 0.5, fov = 130},--brake_cylinder
	[12] = { "headlight",		Vector(481.4,-14.6,-10.2), Angle(95,240,0), Color(200,200,200), farz = 5, nearz = 2, shadows = 0, brightness = 0.5, fov = 130},--nm tm
	[13] = { "headlight",		Vector(493.74,57.88,12.5), Angle(-85.4,90,0), Color(200,200,200), farz = 3, nearz = 2, shadows = 0, brightness = 2, fov = 150},--LV
	[14] = { "headlight",		Vector(494.48,57.55,8), Angle(-85.4,90,0), Color(200,200,200), farz = 3, nearz = 2, shadows = 0, brightness = 2, fov = 150},--HV

	[15] = { "headlight",    Vector( 394, 23, 55), Angle(90,0,0), Color(255,255,255), brightness = 0.2, fov=20 , farz=350},

    --[13] = { "headlight",       Vector(476.9,7,-3.56), Angle(130,0,0), Color(180,180,255), farz = 25.6, nearz = 1, shadows = 0, brightness = 0.4, fov = 178},
    [3] = { "headlight",        Vector(380,40,43.9), Angle(50,40,-0), Color(206,135,80), hfov=100, vfov=100,farz=200,brightness = 6,shadows=1},
}

ENT.ButtonMap["Vityaz"] = {
    pos = Vector(511.695+21.4,-1.15,-22.4)+Vector(-41.5,0,17.5),
    ang = Angle(4.8,245.39,60.92),
    width = 1024,
    height = 800,
    scale = 0.0115,
    hideseat=0.2,
	system="Vityaz",
	hide=0.5,
}

--239.3 расстояние между
for i=1,4 do
	ENT.ButtonMap["BNT"..i] = {
		pos = Vector(321.63-229.975*(i-1),47.1,52.5),
		ang = Angle(0,0,119.9),
		width = 640,
		height = 480,
		scale = 0.0134,--0.018
		system = "BNT",
		hide=1,
	}
	ENT.ButtonMap["BNT"..i+4] = {
		pos = Vector(-321.31-229.975*(i-4),-47.1,52.5),
		ang = Angle(180,0,-60.1),
		width = 640,
		height = 480,
		scale = 0.0134,--0.018
		system = "BNT",
		hide=1,
	}
end
ENT.ButtonMap["Speedometer"] = {
    pos = Vector(515.5+21,26,-20.5)+Vector(-41.5,0,17.5),
    ang = Angle(0,-90,62),
    width = 800,
    height = 600,
    scale = 0.0105,
	system = "Speedometer",
	hide=0.5,
}
ENT.ButtonMap["BMCIS"] = {
    pos = Vector(514.97+21,18,-21.5)+Vector(-41.5,0,17.5),--+Vector(32.3,19,-8.5),
    ang = Angle(0,-90,62),
    width = 800,
    height = 795,
    scale = 0.0105,
	system = "BMCIS",
	hide=0.5,
}
ENT.ButtonMap["CAMS"] = {
    pos = Vector(507.74+21.35,47.89,-22.24)+Vector(-41.5,0,17.5),
    ang = Angle(-4.79,-65.6,60.92),
    width = 1024,
    height = 768,
    scale = 0.0106,
	system = "CAMS",
	hide=0.5,
}
ENT.ButtonMap["RouteNumber"] = {
	pos = Vector(490.28,-9.01,49.35), --490.22 25
	ang = Angle(0,90,90),
	width = 552,
	height = 90,
	scale = 0.106,
	hide=2,
}
function ENT:Initialize()
    self.BaseClass.Initialize(self)
    self.Vityaz = self:CreateRT("760Vityaz",1024,1024)
    self.BNTScreen = self:CreateRT("760BNT",1024,1024)
	self.Speedometer = self:CreateRT("760Speedometer",1024,1024)
	self.BMCIS = self:CreateRT("760BMCIS",1024,1024)
	self.CAMS = self:CreateRT("760CAMS",1024,768)
    self.ASNP = self:CreateRT("760ASNP",512,128)
    self.IGLA = self:CreateRT("760IGLA",512,128)
    self.RVSScr = self:CreateRT("760RVS",256,256)	
    self.Tickers = self:CreateRT("760Ticker",2*1024,2*64)
	self.RouteNumbers = self:CreateRT("760RouteNumber",552,128)
    render.PushRenderTarget(self.Tickers,0,0,1024*2, 2*64)
    render.Clear(0, 0, 0, 0)
    render.PopRenderTarget()
    self.ReleasedPdT = 0
    self.PreviousRingState = false
    self.PreviousCompressorState = false
    self.TISUVol = 0

	self.EmergencyValveRamp = 0
	self.EmergencyValveEPKRamp = 0
	self.EmergencyBrakeValveRamp = 0

    self.CraneRamp = 0
    self.CraneRRamp = 0
    self.FrontLeak = 0
    self.RearLeak = 0
    self.CompressorVol = 0
    self.ParkingBrake = 0
    self.BrakeCylinder = 0.5
    self.BPSNBuzzVolume = 0
	self.VentVolume = 0
	self.VentVolume2 = 0

    self.VentRand = {}
    self.VentState = {}
    self.VentVol = {}
    for i=1,7 do
        self.VentRand[i] = math.Rand(0.5,2)
        self.VentState[i] = 0
        self.VentVol[i] = 0
    end
	self.FrontBogey = self:GetNW2Entity("FrontBogey")
	self.RearBogey = self:GetNW2Entity("RearBogey")
	
	self.FrontCouple = self:GetNW2Entity("FrontCouple")
	self.RearCouple = self:GetNW2Entity("RearCouple")
end

function ENT:UpdateTextures()
    self.Texture = self:GetNW2String("texture")
    self.PassTexture = self:GetNW2String("passtexture")
    self.CabinTexture = self:GetNW2String("cabtexture")
    self.LastStation = self:GetNW2Int("LastStation")
    self.RouteNumber = self:GetNW2Int("RouteNumber")
    self.Number = self:GetWagonNumber()
	
	self.Version = self:GetNW2String("Version")	

    self.Scheme = self:GetNW2Int("Scheme",1)
    self.InvertSchemes = self:GetNW2Bool("PassSchemesInvert",false)
    local sarmat,sarmatr = self.ClientEnts.PassSchemes,self.ClientEnts.PassSchemesR
    if IsValid(sarmat) and IsValid(sarmatr) and Metrostroi.Skins["760_schemes"] and Metrostroi.Skins["760_schemes"][self.Scheme] then
        local scheme = Metrostroi.Skins["760_schemes"][self.Scheme]
		--[[
        if self:GetNW2Bool("PassSchemesInvert") then
            sarmat:SetSubMaterial(0,scheme[2])
            sarmatr:SetSubMaterial(0,scheme[1])
		else
            sarmat:SetSubMaterial(0,scheme[1])
            sarmatr:SetSubMaterial(0,scheme[2])
        end]]
		--print(scheme[1])
		sarmat:SetSubMaterial(0,scheme[1])
		sarmatr:SetSubMaterial(0,scheme[1])
    end
	self.keyval = -1

	self.CISConfig = self:GetNW2Int("CISConfig",1)
    local Announcer = {}
    for k,v in pairs(Metrostroi.AnnouncementsASNP or {}) do if not v.riu then Announcer[k] = v.name or k end end
	if #Metrostroi.CISConfig == 1 then
		self.CISConfig = 1
	end

    for i=0,4 do
        local num = tostring(self.Number)[i+1]
		if not num or num == "" then num = "3" end		
        if IsValid(self.ClientEnts["TrainNumber"..i]) then
			local number = self.ClientEnts["TrainNumber"..i]
			number:SetPos(self:LocalToWorld(Vector(509.8,-48+i*5.8,-16)))
			number:SetAngles(self:LocalToWorldAngles(Angle(-6,0,0)))
            --number:SetPos(self:LocalToWorld(Vector(509.7,-48+i*5.8,-21)))
            number:SetModel("models/metrostroi_train/81-760/numbers/number_"..num..".mdl")
        end
		if IsValid(self.ClientEnts["TrainNumberL"..i]) then
			local number = self.ClientEnts["TrainNumberL"..i]
            number:SetPos(self:LocalToWorld(Vector(269-i*5.8,68,-21)))
			number:SetAngles(self:LocalToWorldAngles(Angle(0,90,0)))
            number:SetModel("models/metrostroi_train/81-760/numbers/number_"..num..".mdl")
		end
		if IsValid(self.ClientEnts["TrainNumberR"..i]) then
			local number = self.ClientEnts["TrainNumberR"..i]
            number:SetPos(self:LocalToWorld(Vector(-443.7+i*5.8,-68,-21)))
			number:SetAngles(self:LocalToWorldAngles(Angle(0,-90,0)))
            number:SetModel("models/metrostroi_train/81-760/numbers/number_"..num..".mdl")
		end
    end
	if not IsValid(self.RearBogey) then
		self.RearBogey = self:GetNW2Entity("RearBogey")		
	end
	if not IsValid(self.FrontBogey) then
		self.FrontBogey = self:GetNW2Entity("FrontBogey")
	end	
end
local Cpos = {
    0,0.28,0.38,0.48,0.85,1
}
local controllerpos = {
	0,0.13,0.265,0.432,0.568,0.708,0.877,1
}
function ENT:IsNumberError()
	local err = false
	for i=0,4 do
        if IsValid(self.ClientEnts["TrainNumber"..i]) and (self.ClientEnts["TrainNumber"..i]:GetPos()==self:GetPos()) then
			err = true
			break
        end
		if IsValid(self.ClientEnts["TrainNumberL"..i]) and (self.ClientEnts["TrainNumberL"..i]:GetPos()==self:GetPos()) then
			err = true
			break
		end
		if IsValid(self.ClientEnts["TrainNumberR"..i]) and (self.ClientEnts["TrainNumberR"..i]:GetPos()==self:GetPos()) then
			err = true
			break
		end
	end
	return err
end

local function PlyInTrain(ply,Train)
	local val = (ply.InMetrostroiTrain == Train)
	return val 
end
local C_MinimizedShow       = GetConVar("metrostroi_minimizedshow")
local C_Optimization		= GetConVar("760_optimization")
local C_Optimization2		= GetConVar("760_optimization2")
local C_ScreenshotMode      = GetConVar("metrostroi_screenshotmode")
function ENT:ShouldRenderClientEnts()
	local ply = LocalPlayer()
	local val = not self:IsDormant() and math.abs(LocalPlayer():GetPos().z - self:GetPos().z) < 500 and (system.HasFocus() or C_MinimizedShow:GetBool()) and (not Metrostroi or not Metrostroi.ReloadClientside)
	 if not C_ScreenshotMode:GetBool() then
		if C_Optimization:GetBool() then
			if not PlyInTrain(ply,self) then--and not self:CPPIGetOwner() == ply then
				val = false
			end
		elseif C_Optimization2:GetBool() then
			if (CPPI and IsValid(self:CPPIGetOwner()) and self:CPPIGetOwner() ~= ply) and not PlyInTrain(ply,self) then
				val = false
			end
		end
	end
    if (val and 1 or 0) ~= self.ShouldRenderClientEnt then
		self.ShouldRenderClientEnt = (val and 1 or 0)
		if not val then
			local glow1,glow2 = self:GetNW2Entity("GlowingLights1"),self:GetNW2Entity("GlowingLights2")
			if IsValid(glow1) and IsValid(glow2) and self.keyval ~= 0 then
				glow1:SetKeyValue("rendercolor","0 0 0")
				glow2:SetKeyValue("rendercolor","0 0 0")					
				self.keyval = 0			
			end
		end
	end
	return val
end
function ENT:ReInitBogeySounds(bogey)
	if not IsValid(bogey) then return end

    -- Bogey-related sounds
    bogey.SoundNames = {}
    bogey.EngineSNDConfig = {}
    
	bogey.MotorSoundType = bogey:GetNWInt("MotorSoundType",2)
    for k,v in pairs(bogey.EngineSNDConfig) do bogey:SetSoundState(v[1],0,0) end
    table.insert(bogey.EngineSNDConfig,{"ted1_720" ,08,00,16,  0.14})--40
    table.insert(bogey.EngineSNDConfig,{"ted2_720" ,16,08-4,24,0.13})--35
    table.insert(bogey.EngineSNDConfig,{"ted3_720" ,24,16-4,32,0.12})--32
    table.insert(bogey.EngineSNDConfig,{"ted4_720" ,32,24-4,40,0.10})--28
    table.insert(bogey.EngineSNDConfig,{"ted5_720" ,40,32-4,48,0.09})--22
    table.insert(bogey.EngineSNDConfig,{"ted6_720" ,48,40-4,56,0.06})--18
    table.insert(bogey.EngineSNDConfig,{"ted7_720" ,56,48-4,64,0.05})--15
    table.insert(bogey.EngineSNDConfig,{"ted8_720" ,64,56-4,72,0.04})--10
    table.insert(bogey.EngineSNDConfig,{"ted9_720" ,72,64-4,80,0.03})--07
    table.insert(bogey.EngineSNDConfig,{"ted10_720",80,72-4,88,0.02})--05
    --table.insert(bogey.EngineSNDConfig,{"ted11_720",88,80-4   ,0.01})--02

    bogey.SoundNames = {}
	
    bogey.SoundNames["ted1_703"]  = "subway_trains/bogey/engines/703/speed_8.wav"
    bogey.SoundNames["ted2_703"]  = "subway_trains/bogey/engines/703/speed_16.wav"
    bogey.SoundNames["ted3_703"]  = "subway_trains/bogey/engines/703/speed_24.wav"
    bogey.SoundNames["ted4_703"]  = "subway_trains/bogey/engines/703/speed_32.wav"
    bogey.SoundNames["ted5_703"]  = "subway_trains/bogey/engines/703/speed_40.wav"
    bogey.SoundNames["ted6_703"]  = "subway_trains/bogey/engines/703/speed_48.wav"
    bogey.SoundNames["ted7_703"]  = "subway_trains/bogey/engines/703/speed_56.wav"
    bogey.SoundNames["ted8_703"]  = "subway_trains/bogey/engines/703/speed_64.wav"
    bogey.SoundNames["ted9_703"]  = "subway_trains/bogey/engines/703/speed_72.wav"
    bogey.SoundNames["ted10_703"] = "subway_trains/bogey/engines/703/speed_80.wav"
    bogey.SoundNames["ted11_703"] = "subway_trains/bogey/engines/703/speed_88.wav"
    --bogey.SoundNames["tedm_703"]  = "subway_trains/bogey/engines/703/engines_medium.wav"

    bogey.SoundNames["ted1_717"]  = "subway_trains/bogey/engines/717/engines_8.wav"
    bogey.SoundNames["ted2_717"]  = "subway_trains/bogey/engines/717/engines_16.wav"
    bogey.SoundNames["ted3_717"]  = "subway_trains/bogey/engines/717/engines_24.wav"
    bogey.SoundNames["ted4_717"]  = "subway_trains/bogey/engines/717/engines_32.wav"
    bogey.SoundNames["ted5_717"]  = "subway_trains/bogey/engines/717/engines_40.wav"
    bogey.SoundNames["ted6_717"]  = "subway_trains/bogey/engines/717/engines_48.wav"
    bogey.SoundNames["ted7_717"]  = "subway_trains/bogey/engines/717/engines_56.wav"
    bogey.SoundNames["ted8_717"]  = "subway_trains/bogey/engines/717/engines_64.wav"
    bogey.SoundNames["ted9_717"]  = "subway_trains/bogey/engines/717/engines_72.wav"
    bogey.SoundNames["ted10_717"] = "subway_trains/bogey/engines/717/engines_80.wav"

    --bogey.SoundNames["ted11_720"] = "subway_trains/760/engines/engine_80.wav"
    bogey.SoundNames["ted1_720"]  = "subway_trains/760/engines/engine_8.wav"
    bogey.SoundNames["ted2_720"]  = "subway_trains/760/engines/engine_16.wav"
    bogey.SoundNames["ted3_720"]  = "subway_trains/760/engines/engine_24.wav"
    bogey.SoundNames["ted4_720"]  = "subway_trains/760/engines/engine_32.wav"
    bogey.SoundNames["ted5_720"]  = "subway_trains/760/engines/engine_40.wav"
    bogey.SoundNames["ted6_720"]  = "subway_trains/760/engines/engine_48.wav"
    bogey.SoundNames["ted7_720"]  = "subway_trains/760/engines/engine_56.wav"
    bogey.SoundNames["ted8_720"]  = "subway_trains/760/engines/engine_64.wav"
    bogey.SoundNames["ted9_720"]  = "subway_trains/760/engines/engine_72.wav"
    bogey.SoundNames["ted10_720"] = "subway_trains/760/engines/engine_80.wav"
    --*0.975
    --*1.025
    bogey.SoundNames["flangea"]      = "subway_trains/bogey/skrip1.wav"
    bogey.SoundNames["flangeb"]      = "subway_trains/bogey/skrip2.wav"
    bogey.SoundNames["flange1"]      = "subway_trains/bogey/flange_9.wav"
    bogey.SoundNames["flange2"]      = "subway_trains/bogey/flange_10.wav"
    bogey.SoundNames["brakea_loop1"]       = "subway_trains/bogey/braking_async1.wav"
    bogey.SoundNames["brakea_loop2"]       = "subway_trains/bogey/braking_async2.wav"
    bogey.SoundNames["brake_loop1"]       = "subway_trains/bogey/brake_rattle3.wav"
    bogey.SoundNames["brake_loop2"]       = "subway_trains/bogey/brake_rattle4.wav"
    bogey.SoundNames["brake_loop3"]       = "subway_trains/bogey/brake_rattle5.wav"
    bogey.SoundNames["brake_loop4"]       = "subway_trains/bogey/brake_rattle6.wav"
    bogey.SoundNames["brake_loopb"]       = "subway_trains/common/junk/junk_background_braking1.wav"
    bogey.SoundNames["brake2_loop1"]       = "subway_trains/bogey/brake_rattle2.wav"
    bogey.SoundNames["brake2_loop2"]       = "subway_trains/bogey/brake_rattle_h.wav"
    bogey.SoundNames["brake_squeal1"]       = "subway_trains/bogey/brake_squeal1.wav"
    bogey.SoundNames["brake_squeal2"]       = "subway_trains/bogey/brake_squeal2.wav"

    -- Remove old sounds
    if bogey.Sounds then
        for k,v in pairs(bogey.Sounds) do
            v:Stop()
        end
    end

    -- Create sounds
    bogey.Sounds = {}
    bogey.Playing = {}
    for k,v in pairs(bogey.SoundNames) do
        --if not file.Exists(v, "MOD") then
--          bogey.SoundNames[k] = nil
        --end
        util.PrecacheSound(v)
        local e = bogey
        if (k == "brake3a") and IsValid(bogey:GetNW2Entity("TrainWheels")) then
            e = bogey:GetNW2Entity("TrainWheels")
        end
        bogey.Sounds[k] = CreateSound(e, Sound(v))
    end

    bogey.Async = nil
    --bogey.MotorSoundType = nil

end
function ENT:PlayDoorSound(bool,door)
	if self[door] ~= bool then
		self[door] = bool
		self:PlayOnce(door.."_"..(self[door] and "open" or "close"),"",1,1)
	end	
end
function ENT:Think()
    self.BaseClass.Think(self)
    if not self.RenderClientEnts or self.CreatingCSEnts then
        self.Number = 0
        self.RouteNumber = 0
        self.LastStation = 0
        return
    end
	local refresh = false--true

	if IsValid(self.FrontBogey) and self.FrontBogey.SoundNames and (self.FrontBogey.SoundNames["ted1_720"] ~= "subway_trains/760/engines/engine_8.wav" or self.FrontBogey.EngineSNDConfig and self.FrontBogey.EngineSNDConfig[1] and self.FrontBogey.EngineSNDConfig[1][5] ~= 0.14) or refresh then
		self:ReInitBogeySounds(self.FrontBogey)
	end
	if IsValid(self.RearBogey) and self.RearBogey.SoundNames and (self.RearBogey.SoundNames["ted1_720"] ~= "subway_trains/760/engines/engine_8.wav" or self.RearBogey.EngineSNDConfig and self.RearBogey.EngineSNDConfig[1] and self.RearBogey.EngineSNDConfig[1][5] ~= 0.14) or refresh then
		self:ReInitBogeySounds(self.RearBogey)
	end	


    if self.LastStation ~= self:GetNW2Int("LastStation") then self:UpdateTextures() end
    if self.RouteNumber ~= self:GetNW2Int("RouteNumber") then self:UpdateTextures() end
    if self.Number ~= self:GetWagonNumber() then self:UpdateTextures() end
    if self.Texture ~= self:GetNW2String("texture") then self:UpdateTextures() end
    if self.PassTexture ~= self:GetNW2String("passtexture") then self:UpdateTextures() end
    if self.CabinTexture ~= self:GetNW2String("cabtexture") then self:UpdateTextures() end
    if self.Scheme ~= self:GetNW2Int("Scheme",1) then self:UpdateTextures() end
	if self.InvertSchemes ~= self:GetNW2Bool("PassSchemesInvert",false) then self:UpdateTextures() end
	if self:IsNumberError() then self:UpdateTextures() end
	
	local glow1,glow2 = self:GetNW2Entity("GlowingLights1"),self:GetNW2Entity("GlowingLights2")
	if IsValid(glow1) and IsValid(glow2) then
		if (IsValid(self.ClientEnts["HeadLights2"]) or IsValid(self.ClientEnts["HeadLights1"])) and self.keyval ~= 1 then
			glow1:SetKeyValue("rendercolor","100 120 128")
			glow2:SetKeyValue("rendercolor","100 120 128")			
			self.keyval = 1
		elseif not (IsValid(self.ClientEnts["HeadLights2"]) or IsValid(self.ClientEnts["HeadLights1"])) and self.keyval ~= 0 then
			glow1:SetKeyValue("rendercolor","0 0 0")
			glow2:SetKeyValue("rendercolor","0 0 0")					
			self.keyval = 0
		end
	end
	
	local ValidfB,ValidrB = IsValid(self.FrontBogey),IsValid(self.RearBogey)
	self:ShowHide("SK1",ValidfB)
	for i=1,4 do
		self:ShowHide("TR"..i,i<=2 and ValidfB or i>=3 and ValidrB)
		self:ShowHide("brake_shoe"..i,ValidfB)
		self:ShowHide("brake_shoe"..(i+4),ValidrB)
		self:Animate("TR"..i,self:GetPackedBool("TR"..i) and 1 or 0,0,1, 8, 0.5)
		self:Animate("brake_shoe"..i,self:GetPackedBool("BC"..i) and 1 or 0,1,0.722,32,2)
		self:Animate("brake_shoe"..(i+4),self:GetPackedBool("BC"..(i+4)) and 1 or 0,1,0.722,32,2)	
	end
		--[[
		fence:ManipulateBonePosition(0,Vector(vec.x/2,vec.y/2,vec.z/2)+Vector(0,0,0))
		fence:ManipulateBoneAngles(0,Angle(ang1.r/2,ang1.y/2,ang1.p/2)+Angle(0,90,0))]]

		--fence:ManipulateBonePosition(0,Vector(vec.x/2,vec.y/2,vec.z/2))		
		--fence:ManipulateBoneAngles(0,Angle(ang1.r,ang1.y,ang1.p)+Angle(0,90,0))

		--fence:ManipulateBoneAngles(0,Angle(ang1.r/2,ang1.y/2,ang1.p/2)+Angle(0,90,0))
		--fence:ManipulateBonePosition(0,Vector(vec.x/2,vec.y/2,vec.z/2))	
	local RearTrain,fence = self:GetNW2Entity("RearTrain"),self.ClientEnts["fence"]
	self:ShowHide("fence",IsValid(RearTrain) and (RearTrain:GetClass():find("760a") and not IsValid(RearTrain.ClientEnts["fence"]) and RearTrain:GetNW2Entity("FrontTrain") ~= self or RearTrain:GetClass():find("761a") or RearTrain:GetClass():find("763a")) and true)
	if IsValid(fence) and IsValid(RearTrain) then
		local a = 1
		if RearTrain:GetNW2Entity("RearTrain") == self then
			a = -1
		end
		--local ang1 = RearTrain:GetAngles()
		local ang1 = fence:WorldToLocalAngles(RearTrain:LocalToWorldAngles(Angle(0,0*a,0)))	
		local vec = fence:WorldToLocal(RearTrain:LocalToWorld(Vector(480.15*a,0,0)))


		local a = 1
		if RearTrain:GetNW2Entity("RearTrain") == self then
			a = -1
		end
		local ang1 = fence:WorldToLocalAngles(RearTrain:LocalToWorldAngles(Angle(0,90*a,0)))		
		local vec = fence:WorldToLocal(RearTrain:LocalToWorld(Vector(480.1*a,a*ang1.p*1.585,0.6)))
		fence:ManipulateBoneAngles(0,Angle(-ang1.r/2,ang1.y/2,ang1.p/3)+Angle(0,90,0))
		fence:ManipulateBonePosition(0,Vector(vec.x/2,vec.y/2,vec.z/2))			
		
	end
	self:Animate("SK1",self:GetPackedBool("SK1") and 1 or 0,0,1,8,0.5)

	local col = render.GetLightColor(self:GetPos()+530*self:GetForward())
	local val = math.floor((col.x*255+col.y*255+col.z*255)*5)/5
	if self.val ~= val and CurTime()-(self.valTimer or 0) > 0 or not self.val then
		self.valTimer = CurTime()+0.5
		self.val = val
	end
	local headl = math.max(0,self:GetPackedRatio("Headlights")+(self.val >= 6 and self:GetPackedRatio("Headlights") == 1 and -0.5 or 0))
    self:SetLightPower(1,headl > 0,headl)
	local RL = self:Animate("backlights4",self:GetPackedBool("BacklightsEnabled") and 1 or 0,0,1,4,false)
	self:SetLightPower(2,RL > 0,RL)
    self:ShowHideSmooth("RedLights0",1-RL)
    self:ShowHideSmooth("RedLights1",RL)	
	if IsValid(self.GlowingLights[1]) then
		self.GlowingLights[1]:SetEnableShadows(true)
		if headl < 1 and self.GlowingLights[1]:GetFarZ() ~= 5120 then
			self.GlowingLights[1]:SetFarZ(5120)
		end
		if headl == 1 and self.GlowingLights[1]:GetFarZ() ~= 8192 then
			self.GlowingLights[1]:SetFarZ(8192)
		end
	end
	self:ShowHideSmooth("HeadLights0",self:Animate("headlights0",(not self:GetPackedBool("HeadLightsEnabled1") and not self:GetPackedBool("HeadLightsEnabled2")) and 1 or 0,0,1,8,false))
	self:ShowHideSmooth("HeadLights1",self:Animate("headlights1",(self:GetPackedBool("HeadLightsEnabled1") or self:GetPackedBool("HeadLightsEnabled2") and self.val >= 6)  and 1 or 0,0,1,8,false))	
	self:ShowHideSmooth("HeadLights2",self:Animate("headlights2",(self:GetPackedBool("HeadLightsEnabled2") and self.val < 6) and 1 or 0,0,1,8,false))
	
	local PanelLighting = self:GetPackedBool("PanelLighting")
	self:SetLightPower(11,PanelLighting)
	self:SetLightPower(12,PanelLighting)
	self:SetLightPower(13,PanelLighting)
	self:SetLightPower(14,PanelLighting)
	
	--ANIMS
    self:Animate("brake_line", self:GetPackedRatio("BL"), 0, 0.853,  256,2)
    self:Animate("train_line", self:GetPackedRatio("TL"), 0, 0.853,  256,2)
    self:Animate("brake_cylinder", self:GetPackedRatio("BC"), 0,0.827,  256,2)
    --self:Animate("volt_lv",self:GetPackedRatio("LV"),1,0.712,92,2)
    --self:Animate("volt_hv",self:GetPackedRatio("HV"),1,0.726,92,2)
    --self:Animate("amp_i13",self:GetPackedRatio("I13"),1,0.722,92,2)
    --self:Animate("amp_i24",self:GetPackedRatio("I24"),1,0.726,92,2)
    self:Animate("controller", controllerpos[self:GetPackedRatio("Controller")+4] or 0, 0, 1,  3,false)
	self:Animate("EmergencyBrakeValve", self:GetPackedBool("EmergencyBrakeValve") and 1 or 0, 0, 1,  6,false)

    local speed = self:GetPackedRatio("Speed", 0)
	if IsValid(self.ClientEnts["fan_kti"]) and self:GetPackedBool("WorkFan",false) then
		self.ClientEnts["fan_kti"]:SetPoseParameter("position",1.0-(speed > 10 and CurTime()%0.5*2 or CurTime()%1))
	end
	if IsValid(self.ClientEnts["fan_r"]) and self:GetPackedBool("WorkFan",false) then
		self.ClientEnts["fan_r"]:SetPoseParameter("position",1.0-(speed > 10 and CurTime()%0.5*2 or CurTime()%1))
	end

    self:Animate("FrontBrake", self:GetNW2Bool("FbI") and 0 or 1,0,1, 3, false)
    self:Animate("FrontTrain",  self:GetNW2Bool("FtI") and 0 or 1,0,1, 3, false)
    self:Animate("RearBrake",   self:GetNW2Bool("RbI") and 0 or 1,0,1, 3, false)
    self:Animate("RearTrain",   self:GetNW2Bool("RtI") and 0 or 1,0,1, 3, false)	
    self:Animate("K23Valve",   self:GetNW2Bool("K23") and 0 or 1,0,1, 3, false)	

    if self.LastValue ~= self:GetPackedBool("GV") then
        self.ResetTime = CurTime()+1.5
        self.LastValue = self:GetPackedBool("GV")
    end
    self:Animate("gv_wrench",   (self:GetPackedBool("GV") and 0 or 1),  0,0.5, 128,  1,false)
    self:ShowHideSmooth("gv_wrench",    CurTime() < self.ResetTime and 1 or 0.1)
    --self:Animate("controller", (self:GetPackedRatio("Controller")+3)/6, 0.75, 0.15,  2,false)
    --self:SetPackedRatio("BL", self.Pneumatic.BrakeLinePressure/16.0)
    --self:SetPackedRatio("TL", self.Pneumatic.TrainLinePressure/16.0)
    --self:SetPackedRatio("BC", math.min(3.2,self.Pneumatic.BrakeCylinderPressure)/6.0)

	self:Animate("RVTB", self:GetPackedBool("K9") and 0 or 1,0,1,16,0.5)
	self:Animate("K29", self:GetPackedBool("K29") and 1 or 0,0,1,16,0.5)
	self:Animate("K31", self:GetPackedBool("K31") and 0 or 1,0,1,16,0.5)
	self:Animate("K35", self:GetPackedBool("UAVA") and 1 or 0,0,1,32,0.5)
    self:Animate("KRO", self:GetPackedRatio("KRO",0),0, 1,  3,false)
    self:Animate("KRR", self:GetPackedRatio("KRR",0),0, 1,  3,false)
    --self:ShowHide("KRO",self:GetNW2Int("Wrench",0) == 1)
    --self:ShowHide("KRR",self:GetNW2Int("Wrench",0) == 2)
    self:Animate("km013", Cpos[7-self:GetPackedRatio("Cran")] or 0, 0, 1,  2,false)
    self:Animate("PB",  self:GetPackedBool("PB") and 1 or 0,0,1,8,false)

    self:ShowHideSmooth("lamp1",self:Animate("LampsEmer",self:GetPackedBool("SalonLighting1") and 1 or 0,0,1,5,false))
    self:ShowHideSmooth("lamp2",self:Animate("LampsFull",self:GetPackedBool("SalonLighting2") and 1 or 0,0,1,5,false))

    self:ShowHideSmooth("cab_emer",self:Animate("CabEmer",self:GetPackedBool("CabinEnabledEmer") and 1 or 0,0,1,5,false))
    --self:ShowHideSmooth("cab_full",self:Animate("CabFull",self:GetPackedBool("CabinEnabledFull") and 1 or 0,0,1,5,false))

    self:ShowHideSmooth("zoomer_lamps",self:Animate("zoomerl",self:GetNW2Bool("DoorAlarmState") and 1 or 0,0,1,16,false))

	self:ShowHide("micro",not self:GetNW2Bool("Micro",false))

   local led_back = not self:GetPackedBool("PassSchemesLEDO",false)
    --if self:GetPackedBool("PassSchemesInvert",false)  then led_back = not led_back end
	--if self.InvertSchemes then led_back = not led_back end
    local extraled = self:GetPackedBool("BMCISExtra",false)
	local extradir = self:GetPackedBool("BMCISExtraDir",false)
	for i=1,5 do
        self:ShowHide("led_l_f"..i,not led_back)
        self:ShowHide("led_l_b"..i,led_back)
        self:ShowHide("led_r_f"..i,not led_back)
        self:ShowHide("led_r_b"..i,led_back)
    end
    local scurr = self:GetNW2Int("PassSchemesLED")
    local snext = self:GetNW2Int("PassSchemesLEDN")
    local led = scurr
    if snext ~= 0 and CurTime()%2 > 1 then led = led + snext end
	local ledwork = scurr >= 0 and self:GetPackedBool("PassSchemes")	
	if led_back then
        for i=1,5 do
			if IsValid(self.ClientEnts["led_l_b"..i]) then
				local skin = 0		
				if (ledwork and self:GetPackedBool("PassSchemesL",false)) and extraled then
					local num = extradir and 1+math.floor(CurTime()%0.8*10) or math.floor(CurTime()%0.9*10)--(math.floor(CurTime()%0.9*10))
					local tbl
					if not extradir then
						tbl = {num,num+8,num+16,num+24}	
					else
						tbl = {31-num,23-num,15-num,7-num}
					end
					local min,max = (i-1)*6+1,i*6
					for k,v in pairs(tbl) do
						if v >= min and v <= max then
							skin = (v == min and 1 or v-min+6)
						end
					end
				elseif (ledwork and self:GetPackedBool("PassSchemesL",false)) then
					skin = math.Clamp(led-((i-1)*6),0,6)
				end	
				self.ClientEnts["led_l_b"..i]:SetSkin(skin)	
			end
			if IsValid(self.ClientEnts["led_r_b"..i]) then
				local skin = 0		
				if (ledwork and self:GetPackedBool("PassSchemesR",false)) and extraled then
					local num = extradir and 1+math.floor(CurTime()%0.8*10) or math.floor(CurTime()%0.9*10)--(math.floor(CurTime()%0.9*10))
					local tbl
					if not extradir then
						tbl = {num,num+8,num+16,num+24}	
					else
						tbl = {31-num,23-num,15-num,7-num}
					end
					local min,max = (i-1)*6+1,i*6
					for k,v in pairs(tbl) do
						if v >= min and v <= max then
							skin = (v == min and 1 or v-min+6)
						end
					end
				elseif (ledwork and self:GetPackedBool("PassSchemesR",false)) then
					skin = math.Clamp(led-((i-1)*6),0,6)
				end	
				self.ClientEnts["led_r_b"..i]:SetSkin(skin)			
			end
		end
    else
        for i=1,5 do
			if IsValid(self.ClientEnts["led_l_f"..i]) then			
				local skin = 0		
				if (ledwork and self:GetPackedBool("PassSchemesL",false)) and extraled then
					local num = not extradir and 1+math.floor(CurTime()%0.8*10) or math.floor(CurTime()%0.9*10)--(math.floor(CurTime()%0.9*10))
					local tbl
					if extradir then
						tbl = {num,num+8,num+16,num+24}	
					else
						tbl = {31-num,23-num,15-num,7-num}
					end
					local min,max = (i-1)*6+1,i*6
					for k,v in pairs(tbl) do
						if v >= min and v <= max then
							skin = (v == min and 1 or v-min+6)
						end
					end
				elseif (ledwork and self:GetPackedBool("PassSchemesL",false)) then
					skin = math.Clamp(led-((i-1)*6),0,6)
				end	
				self.ClientEnts["led_l_f"..i]:SetSkin(skin)			
			end
			if IsValid(self.ClientEnts["led_r_f"..i]) then
				local skin = 0		
				if (ledwork and self:GetPackedBool("PassSchemesR",false)) and extraled then
					local num = not extradir and 1+math.floor(CurTime()%0.8*10) or math.floor(CurTime()%0.9*10)--(math.floor(CurTime()%0.9*10))
					local tbl
					if extradir then
						tbl = {num,num+8,num+16,num+24}	
					else
						tbl = {31-num,23-num,15-num,7-num}
					end
					local min,max = (i-1)*6+1,i*6
					for k,v in pairs(tbl) do
						if v >= min and v <= max then
							skin = (v == min and 1 or v-min+6)
						end
					end
				elseif (ledwork and self:GetPackedBool("PassSchemesR",false)) then
					skin = math.Clamp(led-((i-1)*6),0,6)
				end	
				self.ClientEnts["led_r_f"..i]:SetSkin(skin)				
			end			
		end
    end
    --
    --print(self:GetPackedRatio("async2vol"), self:GetPackedRatio("async2"))
    if not self.DoorStates then self.DoorStates = {} end
    if not self.DoorLoopStates then self.DoorLoopStates = {} end
    for i=0,3 do
        for k=0,1 do
            local st = k==1 and "DoorL" or "DoorR"
            local doorstate = self:GetPackedBool(st)
            local id,sid = st..(i+1),"door"..i.."x"..k
            local state = self:GetPackedRatio(id)
			local randval = self:GetNW2Int("Door"..(k==1 and "L" or "R").."BR"..(i+1),0)
            --print(state,self.DoorStates[state])
            if (state ~= 1 and state ~= 0) ~= self.DoorStates[id] then
                if doorstate and state < 1 or not doorstate and state > 0 then
					if doorstate then self:PlayOnce(sid.."op"..randval,"",1,1) end--math.Rand(0.9,1.3))
                else
                    if state > 0 then
                        self:PlayOnce(sid.."o","",1,1)--math.Rand(0.9,1.3))
                    else
                        self:PlayOnce(sid.."c","",1,1)--math.Rand(0.9,1.3))
                    end
                end
				if state > 0 and doorstate then

				end
                self.DoorStates[id] = (state ~= 1 and state ~= 0)
            end
            if (state ~= 1 and state ~= 0) then
                self.DoorLoopStates[id] = math.Clamp((self.DoorLoopStates[id] or 0) + 2*self.DeltaTime,0,1)
            else
                self.DoorLoopStates[id] = math.Clamp((self.DoorLoopStates[id] or 0) - 6*self.DeltaTime,0,1)
            end
            self:SetSoundState(sid.."r"..randval,self.DoorLoopStates[id],1)--0.9+self.DoorLoopStates[id]*0.1)
            self:SetSoundState(sid.."r"..math.abs(1-randval),0,0)
            local n_l = "door"..i.."x"..k
            self:Animate(n_l,1-state,0,1,15,1)--0.8 + (-0.2+0.4*math.random()),0)
        end
    end
    local door_cab_m = self:Animate("door_cab_m",self:GetPackedBool("PassengerDoor") and 1 or 0,0,1, 2, 0.5)
	self:PlayDoorSound(door_cab_m > 0.2,"door_cab_m")
    local door_cab_l = self:Animate("door_cab_l",self:GetPackedBool("CabinDoorLeft") and 1 or 0,0,1, 2, 0.5)
	self:PlayDoorSound(door_cab_l > 0.2,"door_cab_l")
	self:HidePanel("BackPPZ1",door_cab_l == 0)
	
    local door_cab_r = self:Animate("door_cab_r",self:GetPackedBool("CabinDoorRight") and 1 or 0,0,1, 2, 0.5)
	self:PlayDoorSound(door_cab_r > 0.2, "door_cab_r")
	local cab_chair_add = self:Animate("cab_chair_add",self:GetPackedBool("cab_chair_add") and 1 or 0,0,1,4,0.5)
	local door_pvz = self:Animate("door_pvz",(self:GetPackedBool("door_pvz") or self.CurrentCamera == 7) and 1 or 0,0,1,2,0.5)
	self:PlayDoorSound(door_pvz > 0, "door_pvz")
	local door_add_1 = self:Animate("door_add_1",self:GetPackedBool("door_add_1") and 1 or 0,0,1,2,0.5)
	self:PlayDoorSound(door_add_1 > 0, "door_add_1")
	local door_add_2 = self:Animate("door_add_2",self:GetPackedBool("door_add_2") and 1 or 0,0,1,2,0.5)
	self:PlayDoorSound(door_add_2 > 0, "door_add_2")
	self:HidePanel("Door_add_1",door_add_1>0)
	self:HidePanel("Door_add_1o",door_add_1<1)
	self:HidePanel("Door_add_2",door_add_2>0)
	self:HidePanel("Door_add_2o",door_add_2<1)
	self:ShowHide("K35",door_add_1+door_add_2>0)
	self:HidePanel("K35",door_add_1+door_add_2==0)
	self:ShowHide("box_int_1",door_pvz>0)
	self:ShowHide("box_int_2",door_add_1+door_add_2>0)
	self:HidePanel("Door_pvz",door_pvz>0)
	self:HidePanel("Door_pvzo",door_pvz<1)
	self:ShowHide("ampermetr",door_pvz>0)
	
	self:SetLightPower(15,self:GetPackedBool("AppLights") and door_pvz > 0)	

	local K31_cap = self:Animate("K31_cap",self:GetPackedBool("door_k31") and 1 or 0,0,1,4,0.5)
	self:ShowHide("K31",K31_cap>0)
	self:HidePanel("K31",K31_cap<1)

	if (self:GetPackedBool("WorkBeep") and self:GetPackedBool("wiper")) and self.Anims["wiper"] and self:GetPackedBool("WorkCabVent") then
		local anim = self.Anims["wiper"].value		
		if anim == 0 then
			self.WiperDir = true
		elseif anim == 1 then
			self.WiperDir = false
		end
		self:Animate("wiper",self.WiperDir and 1 or 0,0,1,0.32,false)
	elseif self:GetPackedBool("WorkCabVent") then
		self:Animate("wiper",0,0,1,0.32,false)		
	end

	local dT = self.DeltaTime
    local state = self:GetPackedBool("WorkCabVent",false)
	self.VentTimer = self:GetPackedRatio("VentTimer",0) > 0 and self:GetPackedRatio("VentTimer")
	
    if self.VentVolume < 1 and state then
        self.VentVolume = math.min(1,self.VentVolume + dT)--5*dT
    elseif self.VentVolume > 0 and not state then
        self.VentVolume = math.max(0,self.VentVolume - dT)--3*dT
    end
	local state = self.VentTimer and CurTime()-self.VentTimer > 4 and CurTime()-self.VentTimer < 11
	if self.VentVolume2 < 1 and state then
        self.VentVolume2 = math.min(1,self.VentVolume2 + dT)--5*dT	
	elseif self.VentVolume2 > 0 and not state then
        self.VentVolume2 = math.max(0,self.VentVolume2 - 0.75*dT)--3*dT		
	end
	
	if self.VentTimer then
		if CurTime()-self.VentTimer <= 4 then
			self:SetSoundState("vent_loop",0.07*self.VentVolume,0.9+self.VentVolume/10)
			self:SetSoundState("vent_loop_max",0.0,1)
		elseif CurTime()-self.VentTimer > 11 then
			--self:SetSoundState("vent_loop",0.07,1)
			--self:SetSoundState("vent_loop_max",0.33*self.VentVolume2/2,0.9+self.VentVolume2/10)
			self:SetSoundState("vent_loop",0.0,1)
			self:SetSoundState("vent_loop_max",0.33*self.VentVolume2/2,0.9+self.VentVolume2/10)			
		elseif CurTime()-self.VentTimer > 4 then
			self:SetSoundState("vent_loop",0.25*self.VentVolume/2,1)
			self:SetSoundState("vent_loop_max",0.33*self.VentVolume2/2,0.9+self.VentVolume2/10)					
		end
	else
		self:SetSoundState("vent_loop",0.0,0.9+self.VentVolume/10)
		self:SetSoundState("vent_loop_max",0.0,1)			
	end
	self:HideButton("KAHToggle",self:GetPackedBool("ALSk"))
	
	self:SetSoundState("ring_ppz",self:GetPackedBool("BUKPRing",false) and 1.6 or 0,1)
	
	self:HidePanel("PVZ",door_pvz==0)

	self:Animate("volt_lv",self:GetPackedRatio("LV"),0,1,16,1)--0.035,0.965,16,1)
	self:Animate("volt_hv",self:GetPackedRatio("HV"),0,1,16,6)--0.035,0.965,16,1)
	self:Animate("ampermetr",self:GetPackedRatio("IVO"),0,1,16,1)--0.035,0.965,16,1)

	--print(dPdT)
    local parking_brake = math.max(0,-self:GetPackedRatio("ParkingBrakePressure_dPdT",0))
    self.ParkingBrake = self.ParkingBrake+(parking_brake-self.ParkingBrake)*dT*10
    self:SetSoundState("parking_brake",self.ParkingBrake,1.4)

    local dPdT = self:GetPackedRatio("BrakeCylinderPressure_dPdT")
    self.ReleasedPdT = math.Clamp(self.ReleasedPdT + 10*(-self:GetPackedRatio("BrakeCylinderPressure_dPdT",0)-self.ReleasedPdT)*dT*1.5,0,1)
    local release1 = math.Clamp(self.ReleasedPdT,0,1)^2
    self:SetSoundState("release",release1,1)

    self.FrontLeak = math.Clamp(self.FrontLeak + 10*(-self:GetPackedRatio("FrontLeak")-self.FrontLeak)*dT,0,1)
    self.RearLeak = math.Clamp(self.RearLeak + 10*(-self:GetPackedRatio("RearLeak")-self.RearLeak)*dT,0,1)
    self:SetSoundState("front_isolation",self.FrontLeak,0.9+0.2*self.FrontLeak)
    self:SetSoundState("rear_isolation",self.RearLeak,0.9+0.2*self.RearLeak)
    local ramp = self:GetPackedRatio("Crane_dPdT",0)
    if ramp > 0 then
        self.CraneRamp = self.CraneRamp + ((0.4*ramp)-self.CraneRamp)*dT
    else
        self.CraneRamp = self.CraneRamp + ((1.2*ramp)-self.CraneRamp)*dT
    end
    self.CraneRRamp = math.Clamp(self.CraneRRamp + 1.0*((1*ramp)-self.CraneRRamp)*dT,0,1)
    self:SetSoundState("crane013_release",self.CraneRRamp^1.5,1.0)
    self:SetSoundState("crane013_brake",math.Clamp(-self.CraneRamp*1.5,0,1)^1.3,1.0)
    self:SetSoundState("crane013_brake2",math.Clamp(-self.CraneRamp*1.5-0.95,0,1.5)^2,1.0)

    local emergencyValveEPK = self:GetPackedRatio("EmergencyValveEPK_dPdT",0)
    self.EmergencyValveEPKRamp = math.Clamp(self.EmergencyValveEPKRamp + 1.0*((0.5*emergencyValveEPK)-self.EmergencyValveEPKRamp)*dT,0,1)
    if self.EmergencyValveEPKRamp < 0.01 then self.EmergencyValveEPKRamp = 0 end
    self:SetSoundState("epk_brake",self.EmergencyValveEPKRamp,1.0)

    local emergencyBrakeValve = self:GetPackedRatio("EmergencyBrakeValve_dPdT", 0)
    self.EmergencyBrakeValveRamp = math.Clamp(self.EmergencyBrakeValveRamp + (emergencyBrakeValve-self.EmergencyBrakeValveRamp)*dT*8,0,1)
    self:SetSoundState("valve_brake",self.EmergencyBrakeValveRamp,0.8+math.min(0.2,self.EmergencyBrakeValveRamp*0.8))
	self:SetSoundState("valve_brake_open",self.EmergencyBrakeValveRamp > 0.0001 and CurTime()-self:GetPackedRatio("EmerValve",1e9) < 0 and 1 or 0,1)
	
    local emergencyValve = self:GetPackedRatio("EmergencyValve_dPdT", 0)^0.4*1.2
    self.EmergencyValveRamp = math.Clamp(self.EmergencyValveRamp + (emergencyValve-self.EmergencyValveRamp)*dT*16,0,1)
    self:SetSoundState("emer_brake",self.EmergencyValveRamp,1.0)

    local state = self:GetPackedBool("RingEnabled")
    self:SetSoundState("ring",state and 1 or 0,1)

    local state = self:GetPackedBool("CompressorWork")
    if self.CompressorVol < 1 and state then
        self.CompressorVol = math.min(1,self.CompressorVol + (self.CompressorVol < 0.2 and 0.1 or 0.2)*dT)--5*dT
    elseif self.CompressorVol > 0 and not state then
        self.CompressorVol = math.max(0,self.CompressorVol - dT)--3*dT
    end
    --if state then
        self:SetSoundState("compressor",self.CompressorVol/6,0.8+0.2*self.CompressorVol)
    --else
        --self:SetSoundState("compressor",0,0)
    --end
    self.PreviousCompressorState = state

    local state = self:GetPackedBool("WorkBeep")
    self:SetSoundState("work_beep",state and 1 or 0,1)

    -- Parking brake animation
    self.TrueAngle = self.TrueAngle or 0
    self.TrueAngle = self.TrueAngle + (self:GetPackedRatio("BARSBlock")*900 - self.TrueAngle)*5.0*(self.DeltaTime or 0)
    if self.ClientEnts and IsValid(self.ClientEnts["!BARSBlock"]) then
        self.ClientEnts["!BARSBlock"]:SetPoseParameter("position",1.0-((self.TrueAngle % 360)/360))
    end
	
    self.TrueAngle1 = self.TrueAngle1 or 0
    self.TrueAngle1 = self.TrueAngle1 + (self:GetPackedRatio("PowerReserve")*900 - self.TrueAngle1)*5.0*(self.DeltaTime or 0)
    if self.ClientEnts and IsValid(self.ClientEnts["!PowerReserve"]) then
        self.ClientEnts["!PowerReserve"]:SetPoseParameter("position",1.0-((self.TrueAngle1 % 360)/360))
    end	
	--[[
	self:SetModelScale(0.1)
	for k,v in pairs(self.ClientEnts) do
		v:SetModelScale(0.1)
	end]]
	--print(self:GetAmbientLight())
    local speed = self:GetPackedRatio("Speed", 0)
--[[
    local ventSpeedAdd = math.Clamp(speed/30,0,1)

    local v1state = self:GetPackedBool("Vent1Work")
    local v2state = self:GetPackedBool("Vent2Work")
    for i=1,7 do
        local rand = self.VentRand[i]
        local vol = self.VentVol[i]
        local even = i%2 == 0
        local work = (even and v1state or not even and v2state)
        local target = math.min(1,(work and 1 or 0)+ventSpeedAdd*rand*0.4)*2
        if self.VentVol[i] < target then
            self.VentVol[i] = math.min(target,vol + dT/1.5*rand)
        elseif self.VentVol[i] > target then
            self.VentVol[i] = math.max(0,vol - dT/8*rand*(vol*0.3))
        end
        self.VentState[i] = (self.VentState[i] + 10*((self.VentVol[i]/2)^3)*dT)%1
        local vol1 = math.max(0,self.VentVol[i]-1)
        local vol2 = math.max(0,(self.VentVol[i-1] or self.VentVol[i+1])-1)
        self:SetSoundState("vent"..i,vol1*(0.7+vol2*0.3),0.5+0.5*vol1+math.Rand(-0.01,0.01))
        if IsValid(self.ClientEnts["vent"..i]) then
            --self.ClientEnts["vent"..i]:SetPoseParameter("position",self.VentState[i])
        end
    end]]
    --Vector(409,25.6,-26.3)
    local rollingi = math.min(1,self.TunnelCoeff+math.Clamp((self.StreetCoeff-0.82)/0.5,0,1))
    local rollings = math.max(self.TunnelCoeff*0.6,self.StreetCoeff)
    local tunstreet = (rollingi+rollings*0.2)
    local speed = self:GetPackedRatio("Speed", 0)
    local rol10 = math.Clamp(speed/25,0,1)*(1-math.Clamp((speed-25)/8,0,1))
    local rol45 = math.Clamp((speed-23)/8,0,1)*(1-math.Clamp((speed-50)/8,0,1))
    local rol45p = Lerp((speed-25)/25,0.8,1)
    local rol60 = math.Clamp((speed-50)/8,0,1)*(1-math.Clamp((speed-65)/5,0,1))
    local rol60p = Lerp((speed-50)/15,0.8,1)
    local rol70 = math.Clamp((speed-65)/5,0,1)
    local rol70p = Lerp((speed-65)/25,0.8,1.2)
    self:SetSoundState("rolling_10",rollingi*rol10,1)
    self:SetSoundState("rolling_45",rollingi*rol45,1)
    self:SetSoundState("rolling_60",rollingi*rol60,1)
    self:SetSoundState("rolling_70",rollingi*rol70,1)


    local rol10 = math.Clamp(speed/15,0,1)*(1-math.Clamp((speed-18)/35,0,1))
    local rol10p = Lerp((speed-15)/14,0.6,0.78)
    local rol40 = math.Clamp((speed-18)/35,0,1)*(1-math.Clamp((speed-55)/40,0,1))
    local rol40p = Lerp((speed-15)/66,0.6,1.3)
    local rol70 = math.Clamp((speed-55)/20,0,1)--*(1-math.Clamp((speed-72)/5,0,1))
    local rol70p = Lerp((speed-55)/27,0.78,1.15)
    --local rol80 = math.Clamp((speed-70)/5,0,1)
    --local rol80p = Lerp(0.8+(speed-72)/15*0.2,0.8,1.2)
    self:SetSoundState("rolling_low"    ,rol10*rollings,rol10p) --15
    self:SetSoundState("rolling_medium2",rol40*rollings,rol40p) --57
    --self:SetSoundState("rolling_medium1",0 or rol40*rollings,rol40p) --57
    self:SetSoundState("rolling_high2"  ,rol70*rollings,rol70p) --70

    local state = self:GetPackedRatio("asynccurrent")--^1.5--RealTime()%2.5/2	
    local strength = self:GetPackedRatio("asyncstate")*(1-math.Clamp((speed-23)/23,0,1))*0.5
	--print(state/0.3+0.2)
	self:SetSoundState("async1", tunstreet*math.Clamp((state)/0.26+0.2,0,1)*strength, 1)--+math.Clamp(state,0,1)*0.1)
	--[[
    local state = 1-self:GetPackedRatio("RNState")
    self.TISUVol = math.Clamp(self.TISUVol+(state-self.TISUVol)*dT*8,0,1)
    self:SetSoundState("tisu", self.TISUVol, 1)
    self:SetSoundState("tisu2", self.TISUVol, 1)
    self:SetSoundState("tisu3", 0 or self.TISUVol, 1)
    ]]
	--self:SetSoundState("bbe", self:GetPackedBool("BBEWork") and 1 or 0, 1)

    local work = self:GetPackedBool("AnnPlay")
	local head = self:GetPackedBool("AnnPlayHead")
    for k,v in ipairs(self.AnnouncerPositions) do
        if self.Sounds["announcer"..k] and IsValid(self.Sounds["announcer"..k]) then
            self.Sounds["announcer"..k]:SetVolume((work and (k > 1 or k == 1 and head)) and (v[3] or 1)  or 0)
        end
    end
end

function ENT:Draw()
    self.BaseClass.Draw(self)
end

function ENT:DrawPost(special)
    self.RTMaterial:SetTexture("$basetexture", self.Vityaz)
    self:DrawOnPanel("Vityaz",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(518-18,520-80,1024-20,1024-160,0)
    end)
    self.RTMaterial:SetTexture("$basetexture", self.ASNP)
    self:DrawOnPanel("ASNPScreen",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(256*1.36,64,512*1.36,128*1.36,0)
    end)
    self.RTMaterial:SetTexture("$basetexture", self.IGLA)
    self:DrawOnPanel("IGLA",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(256,74,512,150,0)
    end)
    self.RTMaterial:SetTexture("$basetexture", self.RVSScr)
    self:DrawOnPanel("RVSScreen",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(128,128,256,256,0)
    end)	
    self.RTMaterial:SetTexture("$basetexture", self.Tickers)
	for i=1,2 do
		self:DrawOnPanel("Tickers"..i,function(...)
			surface.SetMaterial(self.RTMaterial)
			surface.SetDrawColor(255,255,255)
			surface.DrawTexturedRectRotated(512*2,32*2,2*1024,64*2,0)
		end)
	end
    self.RTMaterial:SetTexture("$basetexture", self.BNTScreen)
	for i=1,8 do
		self:DrawOnPanel("BNT"..i,function(...)
			if not self:GetPackedBool("PassSchemesL",false) and i <= 4 or i>4 and not self:GetPackedBool("PassSchemesR",false) then return end
			if self:GetNW2Bool("BMCISExtra",false) then
				local dir = self:GetNW2Bool("BMCISExtraDir",false)
				if (i > 4 and dir or not dir and i <= 4) then
					if dir then
						surface.SetTexture(surface.GetTextureID("bnt/bnt_evac_forward_l"))
					else
						surface.SetTexture(surface.GetTextureID("bnt/bnt_evac_back_l"))
					end
				elseif (i > 4 and not dir or dir and i <= 4) then
					if dir then
						surface.SetTexture(surface.GetTextureID("bnt/bnt_evac_forward_r"))
					else
						surface.SetTexture(surface.GetTextureID("bnt/bnt_evac_back_r"))
					end
				end
				surface.SetDrawColor(255,255,255,170)
				surface.DrawTexturedRectRotated(512,512,1024,1024,0)
			else
				surface.SetMaterial(self.RTMaterial)
				surface.SetDrawColor(255,255,255,170)
				surface.DrawTexturedRectRotated(512,512,1024,1024,0)
			end
		end)
	end
    self.RTMaterial:SetTexture("$basetexture", self.Speedometer)
    self:DrawOnPanel("Speedometer",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(512,512,1024,1024,0)
    end)
    self.RTMaterial:SetTexture("$basetexture", self.BMCIS)
    self:DrawOnPanel("BMCIS",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(512,512,1024,1024,0)
    end)
	self.RTMaterial:SetTexture("$basetexture", self.CAMS)
    self:DrawOnPanel("CAMS",function(...)
		--local brightness = self:GetNW2Int("CAMSBrightness",100)/100
		--surface.SetAlphaMultiplier(brightness)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(529,446,1024,768,0)
		--surface.SetAlphaMultiplier(1.0)
    end)
	self.RTMaterial:SetTexture("$basetexture", self.RouteNumbers)
	self:DrawOnPanel("RouteNumber",function(...)
		--[[
		if not self:GetPackedBool("WorkBeep",false) then return end
		local routenum = Format("%03d",self.RouteNumber)
		local route = routenum[1].." "..routenum[2].." "..routenum[3]
		draw.DrawText(route.." "..route.." "..route.." "..route.." "..route.." "..route[1],"bmt09",8,-18,Color(0,255,0),TEXT_ALIGN_LEFT)
		]]
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(277,64,534,132,0)--547
	end)
	--[[
	self.RTMaterial:SetTexture("$basetexture",self.BMCIS)
	self:DrawOnPanel("BMCIS",function(...)
		surface.SetMaterial(self.RTMaterial)
		surface.SetDrawColor(255,255,255)
		surface.DrawTexturedRectRotated(512-10,512-80,1024-20,1024-160,0)
	end)
	]]
end
function ENT:OnButtonPressed(button)
    if button == "ShowHelp" then
        RunConsoleCommand("metrostroi_train_manual")
    end
end

local dist = {
    BackVent = 550,
    BackPPZ = 550,
    BackDown = 550,
}
for id,panel in pairs(ENT.ButtonMap) do
    if not panel.buttons then continue end
    for k,v in pairs(panel.buttons) do
        if v.model then
            local dist = dist[id] or 150
            if v.model.model then
                v.model.hideseat=dist
            elseif v.model.lamp then
                v.model.lamp.hideseat=dist
            end
        end
    end
end
Metrostroi.GenerateClientProps()
