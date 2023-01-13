AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.BogeyDistance = 650 -- Needed for gm trainspawner
ENT.SyncTable = {
    "EnableBVEmer","Ticker","KAH","KAHk","ALS","ALSk","BTB","BTBk","SD","SDk","FDepot","PassScheme","EnableBV","DisableBV","Ring","R_Program2","R_Announcer","R_Line","R_Micro","R_Emer","R_Program1","R_Program11","R_ChangeRoute","R_ToBack",
    "DoorSelectL","DoorSelectR","DoorBlock","CISRestart","CISRestartK",
    "EmerBrakeAdd","EmerBrakeRelease","EmerBrake","DoorClose","AttentionMessage","Attention","AttentionBrake","EmergencyBrake",   "Pr","OtklR","GlassHeating","Washer","SC",
    "SF1","SF2","SF3","SF4","SF5","SF6","SF7","SF8","SF9","SF10","SF11","SF12","SF13","SF14",
    "SF15","SF16","SF17","SF18","SF19","SF20","SF21","SF22","SF23","SF24","SF25","SF26","SF27","SF28",

    "SF31","SF32","SF33","SF34","SF36","SF37","SF38","SF39","SF40","SF41","SF42","SF57",
    "SF43","SF44","SF45","SF46","SF47","SF48","SF49","SF50","SF51","SF52","SF53","SF54","SF55","SF56",

    "Stand","EmergencyCompressor","EmergencyControls","EmergencyControlsK","Wiper","DoorLeft","AccelRate","HornB","DoorRight","AutoDrive","Micro",

    "SA16","SA17","Vent1","Vent2","Vent","PassLight","CabLight","HeadlightsSwitch",
    "ParkingBrake","SA15","BBER","BBE","Compressor","CabLightStrength","AppLights1","AppLights2",
    "Battery", "SA14",
    "VityazF1", "VityazF2", "VityazF3", "VityazF4", "Vityaz1",  "Vityaz4",  "Vityaz7",  "Vityaz2",  "Vityaz5",  "Vityaz8",  "Vityaz0",  "Vityaz3",  "Vityaz6",  "Vityaz9",  "VityazF5", "VityazF6", "VityazF7", "VityazF8", "VityazF9",
    "K29", "UAVA", "K9","K31",
    "EmerX1","EmerX2","EmerCloseDoors","EmergencyDoors",
    "R_ASNPMenu","R_ASNPUp","R_ASNPDown","R_ASNPOn",
    "VentHeatMode",

    "RearBrakeLineIsolation","RearTrainLineIsolation",
    "FrontBrakeLineIsolation","FrontTrainLineIsolation",
    "PB",   "GV","K23",

	"EmergencyBrakeValve","stopkran",

	"CAMS1","CAMS2","CAMS3","CAMS4","CAMS5","CAMS6","CAMS7","CAMS8","CAMS9","CAMS10",
	"SA1","SA1k","SA2","SA3","SA4","SA5","SA6","SA7","SA8","SA9","SA10","SA10k","SA11","SA12","SA13","SA14","SA14k","SA15","SA16","SA17","SA18",

	"IGLA1","IGLA2","IGLA3","IGLA4",
	
	"AB",
	
	"RVS_KV","RVS_UKV","RVS_S","RVS_F","RVS_0","RVS_1","RVS_2","RVS_3","RVS_4","RVS_5","RVS_6","RVS_7","RVS_8","RVS_9",

}
--------------------------------------------------------------------------------
function ENT:Initialize()
	self.Plombs = {
        --KAH = {true,"KAHk"},
        --KAHk = true,
	    BTB = {true,"BTBk"},
		BTBk = true,
		--EmergencyControls = {false,"EmergencyControlsK"},
		--EmergencyControlsK = true,
		SD = {true,"SDk"},
	    SDk = true,
        ALS = {true,"ALSk"},
        ALSk = true,
        K9 = true,
        BARSBlock = true,
        UAVA = true,
        R_ASNPOn = true,
        Init = true,
    }
   -- Set model and initialize
    self:SetModel("models/metrostroi_train/81-760/81_760_body.mdl")
    self.BaseClass.Initialize(self)
    self:SetPos(self:GetPos() + Vector(0,0,140))

    -- Create seat entities
    self.DriverSeat = self:CreateSeat("driver",Vector(459,18.1,-33))--Vector(427,17.5,-35))--  -- +Vector(21,7,-10)) 447.8   455            Vector(455,18.1,-35)
	self.InstructorsSeat = self:CreateSeat("instructor",Vector(435.8,-12,-40),Angle(0,90,0),"models/vehicles/prisoner_pod_inner.mdl")
    self.InstructorsSeat2 = self:CreateSeat("instructor",Vector(435.8,45,-40),Angle(0,90,0),"models/vehicles/prisoner_pod_inner.mdl")
    self.InstructorsSeat3 = self:CreateSeat("instructor",Vector(417,-43,-36))
    --self.InstructorsSeat4 = self:CreateSeat("instructor",Vector(465,-35,-40),Angle(0,90,0),"models/vehicles/prisoner_pod_inner.mdl")

    self.LightSensor = self:AddLightSensor(Vector(460,0,-130),Angle(0,90,0))--"models/metrostroi_train/81-717/dkp_reader.mdl")

    --self.LightSensor = self:AddLightSensor(Vector(0,65,-30),Angle(0,0,0),"models/metrostroi_train/81-717/dkp_reader.mdl")

    -- Hide seats
    self.DriverSeat:SetRenderMode(RENDERMODE_TRANSALPHA)
    self.DriverSeat:SetColor(Color(0,0,0,0))
	self.InstructorsSeat:SetRenderMode(RENDERMODE_TRANSALPHA)
    self.InstructorsSeat:SetColor(Color(0,0,0,0))
    self.InstructorsSeat2:SetRenderMode(RENDERMODE_TRANSALPHA)
    self.InstructorsSeat2:SetColor(Color(0,0,0,0))
    self.InstructorsSeat3:SetRenderMode(RENDERMODE_TRANSALPHA)
    self.InstructorsSeat3:SetColor(Color(0,0,0,0))
    --self.InstructorsSeat4:SetRenderMode(RENDERMODE_TRANSALPHA)
    --self.InstructorsSeat4:SetColor(Color(0,0,0,0))

    -- Create bogeys
    self.FrontBogey = self:CreateBogey(Vector( 297+20.8,0,-70),Angle(0,180,0),true,"760F")--z=-90
    self.RearBogey = self:CreateBogey(Vector(-338+20.8,0,-70),Angle(0,0,0),false,"760")

    self.FrontBogey:SetNWBool("Async",true)
    self.RearBogey:SetNWBool("Async",true)
	self.FrontBogey:SetNWInt("MotorSoundType",2)
	self.RearBogey:SetNWInt("MotorSoundType",2) 
    self.FrontBogey:SetNWFloat("SqualPitch",0.75)
    self.RearBogey:SetNWFloat("SqualPitch",0.75)

	
			
    --self.FrontBogey:SetNWBool("DisableEngines",true)
    --self.RearBogey:SetNWBool("DisableEngines",true)
    --if Metrostroi.BogeyOldMap then
        --self.FrontCouple = self:CreateCouple(Vector( 448-6,0,-68.5),Angle(0,0,0),true,"722")
        --self.RearCouple  = self:CreateCouple(Vector(-419.5-7.5+6,0,-68.5),Angle(0,180,0),false,"717")
    --else
		self.FrontCouple = self:CreateCouple(Vector( 442.2+20.8,0,-68),Angle(0,0,0),true,"722")
		self.RearCouple  = self:CreateCouple(Vector(-439+20.8,0,-68),Angle(0,180,0),false,"760")
    --end
    --self.FrontBogey.DisableSound = 1
    --self.RearBogey.DisableSound = 1

	self.FrontCouple:SetModel("models/metrostroi_train/81-760/81_760_couple_wtht_ekk.mdl")
	self.FrontCouple:PhysicsInit(SOLID_VPHYSICS)
	constraint.AdvBallsocket(
		self,
		self.FrontCouple,
		0, --bone
		0, --bone
		Vector(431.2+20.8,0,-68),
		Vector(0,0,0),
		1, --forcelimit
		1, --torquelimit
		-2, --xmin
		-2, --ymin
		-15, --zmin
		2, --xmax
		2, --ymax
		15, --zmax
		0.1, --xfric
		0.1, --yfric
		1, --zfric
		0, --rotonly
		1 --nocollide
	)
	self.FrontCouple.CouplingPointOffset = Vector(65,0,0)
	self.FrontCouple.SnakePos = Vector(65.1,1,-4.9)

	self:SetNW2Entity("FrontBogey",self.FrontBogey)
	self:SetNW2Entity("RearBogey",self.RearBogey)
	self:SetNW2Entity("FrontCouple",self.FrontCouple)
	self:SetNW2Entity("RearCouple",self.RearCouple)

    -- Initialize key mapping
    self.KeyMap = {
        [KEY_W] = "PanelKVUp",
        [KEY_S] = "PanelKVDown",
        [KEY_1] = "PanelKV1",
        [KEY_2] = "PanelKV2",
        [KEY_3] = "PanelKV3",
        [KEY_4] = "PanelKV4",
        [KEY_5] = "PanelKV5",
        [KEY_6] = "PanelKV6",
        [KEY_7] = "PanelKV7",
        [KEY_8] = "PanelKV8",
        [KEY_9] = "KRO-",
        [KEY_0] = "KRO+",

        [KEY_A] = "DoorLeft",
        [KEY_D] = "DoorRight",
        [KEY_V] = "DoorClose",
        [KEY_G] = "EnableBVSet",
        [KEY_SPACE] = "PBSet",

        [KEY_EQUAL] = "R_Program1Set",
        [KEY_RBRACKET] = "R_Program1Set",
        [KEY_MINUS] = "Micro",
		
        [KEY_B] = "AttentionMessageSet",
        [KEY_N] = "AttentionBrakeSet",
		[KEY_M] = "AttentionSet",
		[KEY_H] = "PrToggle",
		
        [KEY_LSHIFT] = {
			[KEY_W] = "PanelKVUp_Unlocked",

            [KEY_SPACE] = "AttentionBrakeSet",
            [KEY_V] = "EmergencyDoorsToggle",
            --[KEY_7] = "WrenchNone",
            --[KEY_8] = "WrenchKRR",
            [KEY_9] = "KRR-",--"WrenchKRO",
            [KEY_0] = "KRR+",--"WrenchKRO",
            [KEY_G] = "EnableBVEmerSet",
            [KEY_2] = "RingSet",
            [KEY_L] = "HornEngage",
			[KEY_UP] = "BMCISUpSet",
			[KEY_DOWN] = "BMCISDownSet",
			--[KEY_LEFT] = "BMCISEscSet",
			--[KEY_RIGHT] = "BMCISEnterSet",
        },
        [KEY_LALT] = {
            [KEY_V] = "DoorCloseToggle",
            [KEY_PAD_1] = "Vityaz1Set",
            [KEY_PAD_2] = "Vityaz2Set",
            [KEY_PAD_3] = "Vityaz3Set",
            [KEY_PAD_4] = "Vityaz4Set",
            [KEY_PAD_5] = "Vityaz5Set",
            [KEY_PAD_6] = "Vityaz6Set",
            [KEY_PAD_7] = "Vityaz7Set",
            [KEY_PAD_8] = "Vityaz8Set",
            [KEY_PAD_9] = "Vityaz9Set",
            [KEY_PAD_0] = "Vityaz0Set",
            [KEY_PAD_DECIMAL] = "VityazF5Set",
            [KEY_PAD_ENTER] = "VityazF8Set",
            [KEY_UP] = "VityazF6Set",
            [KEY_LEFT] = "VityazF5Set",
            [KEY_DOWN] = "VityazF7Set",
            [KEY_RIGHT] = "VityazF9Set",
            [KEY_PAD_MINUS] = "VityazF2Set",
            [KEY_PAD_PLUS] = "VityazF3Set",
            [KEY_PAD_MULTIPLY] = "VityazF4Set",
            [KEY_PAD_DIVIDE] = "VityazF1Set",
            [KEY_SPACE] = "AttentionMessageSet",			
        },
        [KEY_PAD_PLUS] = "EmerBrakeAddSet",
        [KEY_PAD_MINUS] = "EmerBrakeReleaseSet",
        [KEY_F] = "PneumaticBrakeUp",
        [KEY_R] = "PneumaticBrakeDown",
        [KEY_PAD_1] = "PneumaticBrakeSet1",
        [KEY_PAD_2] = "PneumaticBrakeSet2",
        [KEY_PAD_3] = "PneumaticBrakeSet3",
        [KEY_PAD_4] = "PneumaticBrakeSet4",
        [KEY_PAD_5] = "PneumaticBrakeSet5",
        [KEY_PAD_6] = "PneumaticBrakeSet6",

        [KEY_PAD_DIVIDE] = "EmerX1Set",
        [KEY_PAD_MULTIPLY] = "EmerX2Set",
        [KEY_PAD_9] = "EmerBrakeToggle",

        [KEY_BACKSPACE] = "EmergencyBrakeToggle",
        [KEY_L] = "HornBSet",
    }
    self.KeyMap[KEY_RALT] = self.KeyMap[KEY_LALT]
    self.KeyMap[KEY_RSHIFT] = self.KeyMap[KEY_LSHIFT]
    self.KeyMap[KEY_RCONTROL] = self.KeyMap[KEY_LCONTROL]
    -- Cross connections in train wires
    self.TrainWireCrossConnections = {
        [4] = 3, -- Orientation F<->B
        [13] = 12, -- Reverser F<->B
        [38] = 37, -- Doors L<->R
    }

    self.Lights = {
        --[1]  = { "light",           Vector(508.9  ,   -36, -39.5), Angle(0,0,0), Color(200,255,255), brightness = 1, scale = 0.3},--, texture = "sprites/light_glow02.vmt" },
        --[2]  = { "light",           Vector(508.9  ,   36.5, -39.5), Angle(0,0,0), Color(200,255,255), brightness = 1, scale = 0.3},--, texture = "sprites/light_glow02.vmt" },

        --[10] = { "dynamiclight",    Vector( 465, 0, 30), Angle(0,0,0), Color(245,238,223), brightness = 0.5, distance = 650 },
        -- Interior
        --[11] = { "dynamiclight",  Vector( 200, 0, 10), Angle(0,0,0), Color(255,175,50), brightness = 3, distance = 400 , fov=180,farz = 128

		-- Redlights
		--[3]  = { "light",           Vector(500,   -65, 15), Angle(0,0,0), Color(255,50,50), brightness = 0.2, scale = 4, texture = "sprites/light_glow02.vmt" },
        --[4]  = { "light",           Vector(509,   60, 15), Angle(0,0,0), Color(255,50,50), brightness = 0.2, scale = 4, texture = "sprites/light_glow02.vmt" },

        [1]  = { "light",           Vector(509.3  ,   -36, -39.5), Angle(0,0,0), Color(200,240,255), brightness = 0.5, scale = 2.5},--, texture = "sprites/light_glow02.vmt" },
        [2]  = { "light",           Vector(509.3 ,   36.5, -39.5), Angle(0,0,0), Color(200,240,255), brightness = 0.5, scale = 2.5},--, texture = "sprites/light_glow02.vmt" },
      
		[10] = { "dynamiclight",    Vector( 487, 16, 13), Angle(0,0,0), Color(255,255,255), brightness = 0.1, distance = 550 },
		
        -- Interior
        [11] = { "dynamiclight",    Vector( 190, 0, 10), Angle(0,0,0), Color(230,230,255), brightness = 2, distance = 630,fov=180,farz = 128},
        [12] = { "dynamiclight",    Vector( -65, 0, 10), Angle(0,0,0), Color(230,230,255), brightness = 2, distance = 630,fov=180,farz = 128},
        [13] = { "dynamiclight",    Vector(-320, 0, 10), Angle(0,0,0), Color(230,230,255), brightness = 2, distance = 630,fov=180,farz = 128},		
        -- Interior
		--[11] = { "dynamiclight",    Vector( 170+30, 0, -5), Angle(0,0,0), Color(230,230,255), brightness = 2, distance = 720},
        --[12] = { "dynamiclight",    Vector( -40+30, 0, -5), Angle(0,0,0), Color(230,230,255), brightness = 2, distance = 720},
        --[13] = { "dynamiclight",    Vector(-290+30, 0, -5), Angle(0,0,0), Color(230,230,255), brightness = 2, distance = 720},

		--[[
        [15] = { "dynamiclight",    Vector(-350, 0, 10), Angle(0,0,0), Color(238,238,197), brightness = 0.5, distance = 500, fov=180,farz = 128 },
        [16] = { "dynamiclight",    Vector(-60, 0, 10), Angle(0,0,0), Color(238,238,197), brightness = 0.5, distance = 500, fov=180,farz = 128 },
        [17] = { "dynamiclight",    Vector( 230, 0, 10), Angle(0,0,0), Color(238,238,197), brightness = 0.5, distance = 500, fov=180,farz = 128 },]]
        --[13] = { "dynamiclight",  Vector(-200, 0, 10), Angle(0,0,0), Color(255,175,50), brightness = 3, distance = 400 , fov=180,farz = 128 },
        --[11] = { "dynamiclight",  Vector( 100, 0, 10), Angle(0,0,0), Color(255,175,50), brightness = 3, distance = 400 , fov=180,farz = 128 },
        --[12] = { "dynamiclight",  Vector( 100, 0, 10), Angle(0,0,0), Color(255,175,50), brightness = 3, distance = 400, fov=180,farz = 128 },
    }
    self.InteractionZones = {
        {   Pos = Vector(466, 64, -15),
            Radius = 48,
            ID = "CabinDoorLeft" },
        {   Pos = Vector(466, -60, -15),
            Radius = 48,
            ID = "CabinDoorRight" },
    }
	
    
	self.BARSBlockAnim = -0.1	
	self.PassengerDoor = false
    self.CabinDoorLeft = false
    self.CabinDoorRight = false
    self.RearDoor = false
	self.Chair = false
	self.SpeedTimer = CurTime()
    self.WrenchMode = 0
	self.ALSVal = 0
	self.door_pvz = false
	self.door_add_1 = false
	self.door_add_2 = false
	self.door_k31 = false
	self.stopcrane_cap = false
	
	self:TrainSpawnerUpdate()
end

function ENT:NonSupportTrigger()
    self.ALS:TriggerInput("Set",1)
    self.ALSk:TriggerInput("Set",0)
	self.ALSVal = 2
    --self.BARSBlock:TriggerInput("Set",3)
    self.Plombs.ALS = nil
    self.Plombs.ALSk = nil
    --self.Plombs.BARSBlock = nil
end

--------------------------------------------------------------------------------
-- Turn light on or off
--------------------------------------------------------------------------------
function ENT:SetLightPower(index,power,brightness)
    local lightData = self.Lights[index]
    self.GlowingLights = self.GlowingLights or {}
    self.LightBrightness = self.LightBrightness or {}
    brightness = brightness or 1

    -- Check if light already glowing
    if (power and (self.GlowingLights[index])) and
       (brightness == self.LightBrightness[index]) then return end

    -- If light already glowing and only brightness changed
    if (power and (self.GlowingLights[index])) and
       (brightness ~= self.LightBrightness[index]) then
        local light = self.GlowingLights[index]
        if (lightData[1] == "glow") or (lightData[1] == "light") then
            local brightness = brightness * (lightData.brightness or 0.5)
            light:SetKeyValue("rendercolor",
                Format("%i %i %i",
                    lightData[4].r*brightness,
                    lightData[4].g*brightness,
                    lightData[4].b*brightness
                )
            )
        end
        if (lightData[1] == "headlight") then
            -- Set Brightness
            local brightness = brightness * (lightData.brightness or 1.25)
            light:SetKeyValue("lightcolor",
                Format("%i %i %i 255",
                    lightData[4].r*brightness,
                    lightData[4].g*brightness,
                    lightData[4].b*brightness
                )
            )
        end
        if (lightData[1] == "dynamiclight") then
            --light:SetKeyValue("brightness", brightness * (lightData.brightness or 2))
            light:SetKeyValue("_light",
                Format("%i %i %i",
                    lightData[4].r*brightness,
                    lightData[4].g*brightness,
                    lightData[4].b*brightness
                )
            )
        end
        self.LightBrightness[index] = brightness
        return
    end

    -- Turn off light
    SafeRemoveEntity(self.GlowingLights[index])
    self.GlowingLights[index] = nil
    self.LightBrightness[index] = brightness

    -- Create light
    if (lightData[1] == "headlight") and (power) then
        local light = ents.Create("env_projectedtexture")
        light.DormantFix1 = true
        light:SetTransmitWithParent(true)
        light:SetParent(self)
        light:SetPos(self:LocalToWorld(lightData[2]))
        light:SetAngles(self:LocalToWorldAngles(lightData[3]))

        -- Set parameters
        light:SetKeyValue("enableshadows", lightData.shadows or 1)
        light:SetKeyValue("farz", lightData.farz or 2048)
        light:SetKeyValue("nearz", lightData.nearz or 16)
        light:SetKeyValue("lightfov", lightData.fov or 120)

        -- Set Brightness
        local brightness = brightness * (lightData.brightness or 1.25)
        light:SetKeyValue("lightcolor",
            Format("%i %i %i 255",
                lightData[4].r*brightness,
                lightData[4].g*brightness,
                lightData[4].b*brightness
            )
        )

        -- Turn light on
        light:Spawn() --"effects/flashlight/caustics"
        light:Input("SpotlightTexture",nil,nil,lightData.texture or "effects/flashlight001")
        self.GlowingLights[index] = light
    end
    if (lightData[1] == "glow") and (power) then
        local light = ents.Create("env_sprite")
        light.DormantFix1 = true
        light:SetTransmitWithParent(true)
        light:SetParent(self)
        light:SetLocalPos(lightData[2])
        light:SetLocalAngles(lightData[3])

        -- Set parameters
        local brightness = brightness * (lightData.brightness or 0.5)
        light:SetKeyValue("rendercolor",
            Format("%i %i %i",
                lightData[4].r*brightness,
                lightData[4].g*brightness,
                lightData[4].b*brightness
            )
        )
        light:SetKeyValue("rendermode", lightData.type or 3) -- 9: WGlow, 3: Glow
        light:SetKeyValue("renderfx", 14)
        light:SetKeyValue("model", lightData.texture or "sprites/glow1.vmt")
--      light:SetKeyValue("model", "sprites/light_glow02.vmt")
--      light:SetKeyValue("model", "sprites/yellowflare.vmt")
        light:SetKeyValue("scale", lightData.scale or 1.0)
        light:SetKeyValue("spawnflags", 1)

        -- Turn light on
        light:Spawn()
        self.GlowingLights[index] = light
    end
    if (lightData[1] == "light") and (power) then
        local light = ents.Create("env_sprite")
        light.DormantFix1 = true
        light:SetTransmitWithParent(true)
        light:SetParent(self)
        light:SetLocalPos(lightData[2])
        light:SetLocalAngles(lightData[3])

        -- Set parameters
        local brightness = brightness * (lightData.brightness or 0.5)
        light:SetKeyValue("rendercolor",
            Format("%i %i %i",
                lightData[4].r*brightness,
                lightData[4].g*brightness,
                lightData[4].b*brightness
            )
        )
        light:SetKeyValue("rendermode", lightData.type or 9) -- 9: WGlow, 3: Glow
        light:SetKeyValue("renderfx", 14)
--      light:SetKeyValue("model", "sprites/glow1.vmt")
        light:SetKeyValue("model", lightData.texture or "sprites/light_glow02.vmt")
--      light:SetKeyValue("model", "sprites/yellowflare.vmt")
        light:SetKeyValue("scale", lightData.scale or 1.0)
        --Size of Glow Proxy Geometry
        light:SetKeyValue("spawnflags", 1)

        -- Turn light on
        light:Spawn()
        self.GlowingLights[index] = light
		
		self:SetNW2Entity("GlowingLights"..index,self.GlowingLights[index])	
    end
    if (lightData[1] == "dynamiclight") and (power) then
        local light = ents.Create("light_dynamic")
        light:SetParent(self)

        -- Set position
        light:SetLocalPos(lightData[2])
        light:SetLocalAngles(lightData[3])

        -- Set parameters
        light:SetKeyValue("_light",
            Format("%i %i %i",
                lightData[4].r*brightness,
                lightData[4].g*brightness,
                lightData[4].b*brightness
            )
        )
        light:SetKeyValue("style", 0)
        light:SetKeyValue("distance", lightData.distance or 300)
        light:SetKeyValue("brightness", (lightData.brightness or 2))

        -- Turn light on
        light:Spawn()
        light:Fire("TurnOn","","0")
        self.GlowingLights[index] = light
    end
end

function ENT:TriggerLightSensor(coil,plate)
	self.Prost_Kos:Think()
	--self.Prost_Kos:TriggerSensor(coil,plate)
end

function ENT:TrainSpawnerUpdate()
	
	-- select body version train
	local versionTrain = self:GetNW2String("Version")
	
	self:SetNW2String("texture", versionTrain)
	self:SetNW2String("Texture", versionTrain)
	
	-- select console type for train
	local cabVersionTrain = self:GetNW2String("CabVersion")
	self:SetNW2String("cabtexture", cabVersionTrain)
	self:SetNW2String("CabTexture", cabVersionTrain)
	
	for i=1,4 do
		self:SetNW2Int("DoorRBR"..i,1)--math.random(0,1))				
		self:SetNW2Int("DoorLBR"..i,1)--math.random(0,1))				
	end
	
	-- select ASNP for train
    local Announcer = {}
    for k,v in pairs(Metrostroi.AnnouncementsASNP or {}) do 
		if not v.riu then 
			Announcer[k] = v.name or k 
		end 
	end
	
	if #Metrostroi.CISConfig == 1 then
		self.CISConfig = 1
	else
		self.CISConfig = self:GetNW2Int("CISConfig",1)
	end
	
end
--------------------------------------------------------------------------------
function ENT:Think()
    local retVal = self.BaseClass.Think(self)

	local Panel = self.Panel
    local power = self.Electric.UPIPower > 0
	local power1 = self.Electric.Power > 0
	local powerReserve = self.Electric.PowerReserve > 0	
	--print(Metrostroi.FindNextStation()[1].start)
	--print(Metrostroi.GetReverserID(self:GetOwner(),true))
	
    local state = math.abs(self.AsyncInverter.InverterFrequency/(11+self.AsyncInverter.State*5))--(10+8*math.Clamp((self.AsyncInverter.State-0.4)/0.4,0,1)))
    self:SetPackedRatio("asynccurrent", math.Clamp(state*(state+self.AsyncInverter.State/1),0,1)*math.Clamp(self.Speed/6,0,1))
    self:SetPackedRatio("asyncstate", math.Clamp(self.AsyncInverter.State/0.2*math.abs(self.AsyncInverter.Current)/100,0,1))
    self:SetPackedRatio("chopper", math.Clamp(self.Electric.Chopper>0 and self.Electric.Iexit/100 or 0,0,1))
    self:SetPackedRatio("Speed", self.Speed)
    --self:SetLightPower(10,self.BUV.Power and self.SF25.Value > 0.5 and self.CabinLight.Value > 0.5,self.CabinLight.Value == 2 and 1 or 0.3)
    --self:SetPackedBool("PanelLighting",self.BUV.Power and self.SF25.Value > 0.5 and self.PanelLight.Value > 0.5)
    --local mul = self.SF45.Value > 0.5 and self.BUV.MainLights and 1 or self.SF46.Value > 0.5 and 0.5 or 0
    --self:SetLightPower(11,self.BUV.Power and mul > 0, mul)
    --self:SetLightPower(15,self.BUV.Power and mul > 0, mul)
	--print(Metrostroi.ASNPSetup[self:GetNW2Int("Announcer",1)][self.BMCIS.Line].English)
    self:SetNW2Int("Wrench",self.WrenchMode)
    self:SetPackedRatio("Controller",Panel.Controller)
    self:SetPackedRatio("KRO",(self.RV.KROPosition+1)/2)
    self:SetPackedRatio("KRR",(self.RV.KRRPosition+1)/2)
    self:SetPackedRatio("VentCondMode",self.VentCondMode.Value/3)
    self:SetPackedRatio("VentStrengthMode",self.VentStrengthMode.Value/3)
	
	--self:OnButtonPress("BARSBlock -")
    --self:SetPackedRatio("VentHeatMode",self.VentHeatMode.Value/2)
    --self:SetPackedRatio("BARSBlock",self.BARSBlock.Value/4)
    self:SetPackedRatio("BARSBlock",self.BARSBlockAnim or -0.1)

	local fB,rB = self.FrontBogey,self.RearBogey
	local validfB,validrB = IsValid(fB),IsValid(rB)
	for i=1,4 do
		self:SetPackedBool("TR"..i,self.BUV.Pant or i<=2 and validfB and fB.DisableContactsManual or i>2 and validrB and rB.DisableContactsManual)
	end
	--self:CreateShadow()
	--self:DrawShadow()
	--self:DestroyShadow()
	self:SetPackedBool("SK1",self.EmergencyValveTimer and CurTime()-self.EmergencyValveTimer < 1)
	if self.Pneumatic.EmergencyValve and not self.EmergencyValveTimer then
		self.EmergencyValveTimer = CurTime()
	elseif not self.Pneumatic.EmergencyValve and self.EmergencyValveTimer and CurTime()-self.EmergencyValveTimer > 1 then
		self.EmergencyValveTimer = nil
	end
    --self:SetPackedBool("PSNWork",power and self.BUV.PSN > 0)
    self:SetPackedBool("WorkBeep",power1)	
    self:SetPackedBool("WorkCabVent",Panel.CabVent > 0)	
	if Panel.CabVent > 0 then
		if not self.VentTimer then
			self.VentTimer = CurTime()
		end
	elseif self.VentTimer then
		self.VentTimer = nil
	end
	self:SetPackedRatio("VentTimer",self.VentTimer or 0)
	self:SetPackedBool("BUKPRing",power and self.BUKP.State == 5 and self.BUKP.ErrorRinging)
    self:SetPackedBool("RingEnabled",power and self.BUKP.Ring) 
    self:SetPackedBool("WorkFan",Panel.WorkFan > 0)
    self:SetPackedBool("PanelLighting",Panel.PanelLights > 0)
    --local HeadlightsPower = power and self.HeadlightsSwitch.Value >= 0 and (self.SF16.Value*self.SF17.Value > 0 and (self.RV["KRO11-12"] > 0 and self.HeadlightsSwitch.Value > 1 or self.SA13.Value*self.EmergencyControls.Value > 0) and 1 or (self.HeadlightsSwitch.Value > 0 and self.RV["KRO11-12"] > 0 or self.EmergencyControls.Value > 0.5) and self.SF16.Value+(self.HeadlightsSwitch.Value > 1 and self.SF17.Value or 0) > 0 and 0.5) or 0
	--if power and self.EmergencyControls.Value*self.SF16.Value > 0.5 and HeadlightsPower < 0.5 then HeadlightsPower = 0.5 end
    --print(0.4+math.max(0,math.min(1,1-(self.Speed-30)/30))*0.5)
    --print((80-self.Engines.Speed))
	local HeadlightsPower = Panel.HeadlightsFull > 0 and 1 or Panel.HeadlightsHalf > 0 and 0.5 or 0
	self:SetPackedRatio("HeadlightsSwitch",self.HeadlightsSwitch.Value/2)
    self:SetPackedBool("HeadlightsEnabled2",HeadlightsPower > 0.5)
    self:SetPackedBool("HeadlightsEnabled1",HeadlightsPower > 0 and HeadlightsPower < 1)
    self:SetPackedRatio("Headlights",HeadlightsPower)
    self:SetLightPower(1,HeadlightsPower > 0,HeadlightsPower^0.5)
    self:SetLightPower(2,HeadlightsPower > 0,HeadlightsPower^0.5)
	--local redlights = (power1 and (self.RV["KRO7-8"] > 0 or self.EmergencyControls.Value > 0) and self.SF1.Value > 0 or self.SF28.Value > 0.5 and not power) 
    self:SetPackedBool("BacklightsEnabled",Panel.RedLights > 0)
	--self:SetLightPower(3,redlights)
	--self:SetLightPower(4,redlights)
	local cablight = Panel.CabLight==1 and 0.25 or Panel.CabLight==2 and 0.8 or 0
    local cabl = cablight > 0
	self:SetLightPower(10,cabl,cablight)
    self:SetPackedBool("CabinEnabledEmer", cabl)
    self:SetPackedBool("CabinEnabledFull", cablight > 0.25)
    --local passlight = power1 and (self.BUV.MainLights and 1 or (self.SF44.Value > 0.5 and (self.SF31.Value+self.SF32.Value > 0.5)) and 0.25) or 0
	--[[
	local passlight = power1 and ((self.SF44.Value*self.Battery.Value > 0 and 0.25 or 0)+(self.BUV.MainLights and self.SF43.Value*self.Battery.Value > 0 and 0.75 or 0)) or 0
	local passl = passlight > 0
    self:SetLightPower(11,passl, passlight)
    self:SetLightPower(12,passl, passlight)
    self:SetLightPower(13,passl, passlight)
	self:SetPackedBool("SalonLighting1",power1 and self.SF44.Value*self.Battery.Value > 0)
	self:SetPackedBool("SalonLighting2",power1 and self.BUV.MainLights and self.SF43.Value*self.Battery.Value > 0)
	]]
	local passlight = Panel.SalonLighting1*0.25+Panel.SalonLighting2*0.75
	local passl = passlight > 0
    self:SetLightPower(11,passl, passlight)
    self:SetLightPower(12,passl, passlight)
    self:SetLightPower(13,passl, passlight)
	self:SetPackedBool("SalonLighting1",Panel.SalonLighting1 > 0)
	self:SetPackedBool("SalonLighting2",Panel.SalonLighting2 > 0)	
    --self:SetPackedRatio("SalonLighting",passlight)
	
	
    --self:SetPackedRatio("TrainLine",7.3/16)
    --self:SetPackedRatio("BrakeLine",5.2/16)
    --self:SetPackedRatio("BrakeCylinder",self.AsyncInverter.PN1*1.1/6)
    self:SetNW2Bool("BISpeedLimitBlink",power and (self.BARS.BINoFreq > 0 or self.BARS.NoFreq) and self.BARS.Active == 1)
	--self:SetNW2Bool("NoFrequency",power and self.BARS.NoFreq)
	--print(self.BARS.NoFreq)
    self:SetNW2Bool("BIForward",power and self.SpeedSign == 1 and self.BARS.Speed > 0.2)
    self:SetNW2Bool("BIBack",power and self.SpeedSign == -1 and self.BARS.Speed > 0.2)
	
    self:SetNW2Bool("VityazLamp",power and self.BUKP.State ~= 0)
    self:SetNW2Bool("DoorsClosed",powerReserve and self.BUKP.DoorClosed)
    self:SetNW2Bool("HVoltage",powerReserve and not self.BUKP.HVBad)
    self:SetNW2Bool("DoorLeftLamp",Panel.DoorLeftL > 0)
    self:SetNW2Bool("DoorRightLamp",Panel.DoorRightL > 0)
    self:SetNW2Bool("EmerBrakeWork",Panel.EmerBrakeL > 0)
    self:SetNW2Bool("EmerXod",Panel.EmerXodL > 0)

    self:SetNW2Bool("KAHLamp",Panel.KAHl > 0)
    self:SetNW2Bool("ALSLamp",Panel.ALSl > 0)
	self:SetNW2Bool("PrLamp",Panel.PRl > 0)
	self:SetNW2Bool("OtklRLamp",Panel.OtklRl > 0)
    self:SetNW2Bool("R_LineLamp",Panel.R_Linel > 0)
    self:SetNW2Bool("R_ChangeRouteLamp",Panel.R_ChangeRoutel > 0)
    self:SetNW2Bool("WasherLamp",Panel.Washerl > 0)
    self:SetNW2Bool("WiperLamp",Panel.Wiperl > 0)
    self:SetNW2Bool("AccelRateLamp",power and self.BUKP.Slope)
	self:SetNW2Bool("RS",power and self.BARS.F6)
	self:SetNW2Bool("DoorAlarm",self.CIS.DoorAlarm)
	self:SetNW2Bool("EmergencyControlsLamp",Panel.EmergencyControlsl > 0)
	self:SetNW2Bool("EmergencyDoorsLamp",Panel.EmergencyDoorsl > 0)
	self:SetNW2Bool("GlassHeatingLamp",Panel.GlassHeatingl > 0)

    self:SetPackedBool("AnnPlay",power1)
	self:SetPackedBool("AnnPlayHead",power1)

    self:SetNW2Bool("DoorCloseLamp",Panel.DoorCloseL > 0)
    self:SetNW2Bool("DoorBlockLamp",Panel.DoorBlockL > 0)
    self:SetPackedBool("AppLights", Panel.AppLights > 0)

    self:SetPackedRatio("LV",Panel.LV/150)--((self.Battery.Value+self.SF1.Value > 0) and 1 or 0)*self.Electric.Battery80V/150)
    self:SetPackedRatio("HV",self.Electric.Main750V/1000)
	self:SetPackedRatio("IVO",0.5+self.BUV.IVO/150)
    --self:SetPackedRatio("I13",(self.Electric.I13+500)/1000)
    --self:SetPackedRatio("I24",(self.Electric.I24+500)/1000)
    self:SetPackedBool("PassengerDoor",self.PassengerDoor)
	self:SetPackedBool("CabinDoorLeft",self.CabinDoorLeft)
	self:SetPackedBool("CabinDoorRight",self.CabinDoorRight)
	self:SetPackedBool("RearDoor",self.RearDoor)
	self:SetPackedBool("door_pvz",self.door_pvz)
	self:SetPackedBool("door_add_1",self.door_add_1)
	self:SetPackedBool("door_add_2",self.door_add_2)
	self:SetPackedBool("door_k31",self.door_k31)
	self:SetPackedBool("door_stopcrane",self.stopcrane_cap)
	self:SetPackedBool("cab_chair_add",self.Chair or self.InstructorsSeat3 and IsValid(self.InstructorsSeat3) and IsValid(self.InstructorsSeat3:GetDriver()))
    self:SetPackedBool("CompressorWork",self.Pneumatic.Compressor and CurTime()-self.Pneumatic.Compressor > 0)
    --self:SetPackedBool("Vent1Work",self.Electric.Vent1>0)
    --self:SetPackedBool("Vent2Work",self.Electric.Vent2>0)

	if self.FrontTrain ~= self.PrevFrontTrain then
		self:SetNW2Entity("FrontTrain",self.FrontTrain)
		self.PrevFrontTrain = self.FrontTrain
	end
	if self.RearTrain ~= self.PrevRearTrain then
		self:SetNW2Entity("RearTrain",self.RearTrain)
		self.PrevRearTrain = self.RearTrain	
	end

    self:SetNW2Int("PassSchemesLED",self.CIS.PassSchemeCurr)
    self:SetNW2Int("PassSchemesLEDN",self.CIS.PassSchemeArr)
    self:SetPackedBool("PassSchemesLEDO",self.CIS.PassSchemePath)
    self:SetPackedBool("PassSchemes",Panel.PassSchemes>0)
    self:SetPackedBool("PassSchemesL",Panel.PassSchemesL > 0)
    self:SetPackedBool("PassSchemesR",Panel.PassSchemesR > 0)
	
    self:SetPackedRatio("Cran", self.Pneumatic.DriverValvePosition)
    self:SetPackedRatio("BL", self.Pneumatic.BrakeLinePressure/16.0)
    self:SetPackedRatio("TL", self.Pneumatic.TrainLinePressure/16.0)
	self:SetPackedRatio("BC", math.min(3.8,self.Pneumatic.BrakeCylinderPressure)/6.0)
	for i=1,8 do
		if i==1 or i==4 or i==5 or i==8 then--  со стояночным
			self:SetPackedBool("BC"..i, math.max(self.Pneumatic.BrakeCylinderPressure,(i < 5 and (validfB and fB.DisableParking and 0 or 1) or i > 4 and (validrB and rB.DisableParking and 0 or 1))*(3.8-self.Pneumatic.ParkingBrakePressure)/2)<=0.1)
			self:SetPackedRatio("DPBTPressure"..i, math.max(self.Pneumatic.BrakeCylinderPressure,(i < 5 and (validfB and fB.DisableParking and 0 or 1) or i > 4 and (validrB and rB.DisableParking and 0 or 1))*(3.8-self.Pneumatic.ParkingBrakePressure)/2))
		else
			self:SetPackedBool("BC"..i,self.Pneumatic.BrakeCylinderPressure<=0.1)
			self:SetPackedRatio("DPBTPressure"..i,self.Pneumatic.BrakeCylinderPressure)
		end
	end
	--self.Engines:TriggerInput("Speed",self.Speed)
	--[[
	if CurTime()-self.SpeedTimer >= 1 and self.Speed > 0.5 then
		self.SpeedTimer = CurTime()
		self.a = self.Speed/3.6-(self.aSpeed or 0)
		self.aSpeed = self.Speed/3.6 or 0
		self.sec = (self.sec or 0)+1
		self.aitog = self.a+(self.aitog or 0)
	elseif self.Speed < 0.5 then
		self.aitog = 0
		self.sec = 0
	end
	RunConsoleCommand("say",self.a or 0)
	]]
	--RunConsoleCommand("say",self.aitog/self.sec or 0)

    self.AsyncInverter:TriggerInput("Speed",self.Speed)
    --self.AsyncInverter:TriggerInput("Speed1",self.Speed)
	
	--print(self.AsyncInverter.Torque)
	
	if IsValid(fB) and IsValid(rB) and not self.IgnoreEngine then
        local A = self.AsyncInverter.Torque
        local add = 1
        if math.abs(self:GetAngles().pitch) > 4 then
            add = math.min((math.abs(self:GetAngles().pitch)-4)/2,1)
        end
        fB.MotorForce = (40000+5000*(A < 0 and 1 or 0))*add --35300
        fB.Reversed = (self.BUV.Reverser < 0.5)--<
        rB.MotorForce  = (40000+5000*(A < 0 and 1 or 0))*add --35300
        rB.Reversed = (self.BUV.Reverser > 0.5)-->

        -- These corrections are required to beat source engine friction at very low values of motor power
        local P = math.max(0,0.04449 + 1.06879*math.abs(A) - 0.465729*A^2)
        if math.abs(A) > 0.4 then P = math.abs(A) end
        if math.abs(A) < 0.05 then P = 0 end
        if self.Speed < 10 then P = P*(1.0 + 0.6*(10.0-self.Speed)/10.0) end
        rB.MotorPower  = P*0.5*((A > 0) and 1 or -1)
        fB.MotorPower = P*0.5*((A > 0) and 1 or -1)

        -- Apply brakes
		fB.PneumaticBrakeForce = 50000.0--3000 --40000
        fB.BrakeCylinderPressure = self.Pneumatic.BrakeCylinderPressure--math.max(self.Pneumatic.BrakeCylinderPressure,(3.85-self.Pneumatic.ParkingBrakePressure))
		fB.ParkingBrakePressure = math.max(0,3.8-self.Pneumatic.ParkingBrakePressure)/2
        fB.BrakeCylinderPressure_dPdT = -self.Pneumatic.BrakeCylinderPressure_dPdT
        fB.DisableContacts = self.BUV.Pant
        rB.PneumaticBrakeForce = 50000.0--3000 --40000
		rB.BrakeCylinderPressure = self.Pneumatic.BrakeCylinderPressure--math.max(self.Pneumatic.BrakeCylinderPressure,(3.85-self.Pneumatic.ParkingBrakePressure))
		rB.ParkingBrakePressure = math.max(0,3.8-self.Pneumatic.ParkingBrakePressure)/2
        rB.BrakeCylinderPressure_dPdT = -self.Pneumatic.BrakeCylinderPressure_dPdT
        rB.DisableContacts = self.BUV.Pant
    end

    return retVal
end
function ENT:OnCouple(train,isfront)
    if isfront and self.FrontAutoCouple then
        self.FrontBrakeLineIsolation:TriggerInput("Open",1.0)
        self.FrontTrainLineIsolation:TriggerInput("Open",1.0)
        self.FrontAutoCouple = false
    elseif not isfront and self.RearAutoCouple then
        self.RearBrakeLineIsolation:TriggerInput("Open",1.0)
        self.RearTrainLineIsolation:TriggerInput("Open",1.0)
        self.RearAutoCouple = false
    end
    self.BaseClass.OnCouple(self,train,isfront)
end

function ENT:OnButtonPress(button,ply)
    if string.find(button,"PneumaticBrakeSet") then
        self.Pneumatic:TriggerInput("BrakeSet",tonumber(button:sub(-1,-1)))
        return
    end
	if button:find("SA") and button:find("k") then
		local butt1 = button:gsub("Toggle","")	
		local butt = button:gsub("kToggle","")
		if self[butt1] and self[butt] and self[butt1].Value == 0 then
			self[butt]:TriggerInput("Set",0)
		end
	end
    if button == "Attention" then
        if self.BARS.Ringing then
            self.AttentionBrake:TriggerInput("Set",1)
        else
            self.PB:TriggerInput("Set",1)
        end
    end	
	if button == "BARSBlock -" then
		self.BARSBlockAnim = (self.BARSBlockAnim or -0.1)+0.1
		self.BARSBlock:TriggerInput("Set",self.BARSBlock.Value == 0 and 3 or self.BARSBlock.Value-1)
		self:PlayOnce("bkpu","",1,0.85)	
	end
	if button == "BARSBlock +" then
		self.BARSBlockAnim = (self.BARSBlockAnim or -0.1)-0.1
		self.BARSBlock:TriggerInput("Set",self.BARSBlock.Value == 3 and 0 or self.BARSBlock.Value+1)
		self:PlayOnce("bkpu","",1,0.85)	
	end
    if button == "IGLA23" then
        self.IGLA2:TriggerInput("Set",1)
        self.IGLA3:TriggerInput("Set",1)
    end	
	if button == "K31Cap" then self.door_k31 = not self.door_k31 end
	if button == "stopkranToggle" then self:PlayOnce("stopkran_"..(self.stopkran.Value == 0 and "open" or "disconnect"),"") end
	if button == "StopcraneCap" then if self.stopkran.Value == 0 or not self.stopcrane_cap then self.stopcrane_cap = not self.stopcrane_cap end end--self.stopkran:TriggerInput("Block",self.stopcrane_cap and 0 or 1)
    if button == "Chair" and not (self.InstructorsSeat3 and IsValid(self.InstructorsSeat3) and IsValid(self.InstructorsSeat3:GetDriver()) or self.CabinDoorRight) then self.Chair = not self.Chair end
	if button == "PassengerDoor" and not self.door_pvz and not self.door_add_2 then self.PassengerDoor = not self.PassengerDoor --[[self:PlayOnce("door_cab_m_"..(self.PassengerDoor and "open" or "close"),"")]] end
	if button == "Door_pvz" and not self.CabinDoorLeft then self.door_pvz = not self.door_pvz --[[self:PlayOnce("door_cab_m_"..(self.door_pvz and "open" or "close"),"")]] end
	if button == "Door_add_1" and not self.CabinDoorRight then self.door_add_1 = not self.door_add_1 --[[self:PlayOnce("door_cab_m_"..(self.door_add_1 and "open" or "close"),"")]] end
	if button == "Door_add_2" and not self.PassengerDoor and not self.door_pvz then self.door_add_2 = not self.door_add_2 --[[self:PlayOnce("door_cab_m_"..(self.door_add_2 and "open" or "close"),"")]] end
    if button == "CabinDoorLeft" and (self.CabinDoorLeft or self.SA12.Value == 1 or self.Speed < 20) then self.CabinDoorLeft = not self.CabinDoorLeft --[[self:PlayOnce("door_cab_l_"..(self.CabinDoorLeft and "open" or "close"),"")]] end
    if button == "CabinDoorRight" and (self.CabinDoorRight or (self.SA12.Value == 1 or self.Speed < 20) and not (self.door_add_1 or self.Chair or self.InstructorsSeat3 and IsValid(self.InstructorsSeat3) and IsValid(self.InstructorsSeat3:GetDriver()))) then
		self.CabinDoorRight = not self.CabinDoorRight
		--self:PlayOnce("door_cab_r_"..(self.CabinDoorRight and "open" or "close"),"")
		if self.CabinDoorRight and self.InstructorsSeat3 and IsValid(self.InstructorsSeat3) then
			self.InstructorsSeat3:SetSolid(SOLID_NONE)
		elseif self.InstructorsSeat3 and IsValid(self.InstructorsSeat3) then
			self.InstructorsSeat3:SetSolid(SOLID_VPHYSICS)
		end
	end
    if button == "RearDoor" and (self.RearDoor or not self.BUV.BlockTorec) then self.RearDoor = not self.RearDoor --[[self:PlayOnce("door_cab_t_"..(self.RearDoor and "open" or "close"),"")]] end
    if button == "DoorLeft" then
        self.DoorSelectL:TriggerInput("Set",1)
        self.DoorSelectR:TriggerInput("Set",0)
        if self.EmergencyDoors.Value == 1 or self.DoorClose.Value == 0 then
            self.DoorLeft:TriggerInput("Set",1)
        end
    end
    if button == "DoorRight" then
        self.DoorSelectL:TriggerInput("Set",0)
        self.DoorSelectR:TriggerInput("Set",1)
        if self.EmergencyDoors.Value == 1 or self.DoorClose.Value == 0 then
          self.DoorRight:TriggerInput("Set",1)
        end
    end
    if button == "DoorClose" then
        if self.EmergencyDoors.Value == 1 then
            self.EmerCloseDoors:TriggerInput("Set",1)
        else
                 self.DoorClose:TriggerInput("Set",1-self.DoorClose.Value)
            self.EmerCloseDoors:TriggerInput("Set",0)
        end
    end
    if button == "KRO+" then
		if self.RV.KRRPosition == 0 then
			self.RV:TriggerInput("KROSet",self.RV.KROPosition+1)
		else
			--self.RV:TriggerInput("KRRSet",self.RV.KRRPosition+1)
		end
    end
    if button == "KRO-" then
		if self.RV.KRRPosition == 0 then
			self.RV:TriggerInput("KROSet",self.RV.KROPosition-1)
		else
			--self.RV:TriggerInput("KRRSet",self.RV.KRRPosition-1)
		end
    end
	if button == "KRR+" and self.RV.KROPosition == 0 then
        self.RV:TriggerInput("KRRSet",self.RV.KRRPosition+1)
	end
	if button == "KRR-" and self.RV.KROPosition == 0 then
        self.RV:TriggerInput("KRRSet",self.RV.KRRPosition-1)
	end
    if button == "WrenchKRO" then
        if self.RV.KRRPosition == 0 then
            --self:PlayOnce("kro_in","cabin",1)
            self.WrenchMode = 1
        end
    end
    if button == "WrenchKRR" then
        if self.RV.KROPosition == 0 and self.WrenchMode ~= 2 then
            --self:PlayOnce("krr_in","cabin",1)
            self.WrenchMode = 2
            RunConsoleCommand("say",ply:GetName().." want drive with KRU!")
        end
    end
	if button:find("KRO") or button:find("KRR") then
		self.WrenchMode = (self.RV.KROPosition ~= 0 and 1 or (self.RV.KRRPosition ~= 0 and 2) or 0)
	end
	if button == "Micro" then
		self.R_Line:TriggerInput("Set",1)
		self.R_Micro:TriggerInput("Set",1)
	end
	if button == "ALSToggle" then
		if self.ALS.Value*self.SF6.Value == 1 then --выключается
			if self.ALSVal == 2 then
				self.ALSVal = 0
			else
				self.ALSVal = self.ALSVal + 1
			end
		end
	end
	if button == "EmergencyBrakeValveToggle" and (self.K29.Value == 1 or self.Pneumatic.V4 and self:ReadTrainWire(27) == 1) and not self.Pneumatic.RVTBTimer and self.Pneumatic.BrakeLinePressure > 2 then
		--self:PlayOnce("valve_brake_open","",1.1,1)
		self:SetPackedRatio("EmerValve",CurTime()+3.8)
	end
	if button:find("RVS_") then
		button = button:gsub("RVS_",""):gsub("Set","")
		local num = tonumber(button)
		if num then
			self.RVS.RVSVal = self.RVS.RVSVal + 1
		end
	end
	--[[
    if button == "WrenchNone" then
        if self.WrenchMode ~= 0 then
            if self.WrenchMode == 2 and self.RV.KRRPosition == 0 then
                self:PlayOnce("krr_out","cabin",1,1)
                RunConsoleCommand("say",ply:GetName().." stop drive with KRU!")
                self.WrenchMode = 0
            elseif self.WrenchMode == 1 and self.RV.KROPosition == 0 then
                self:PlayOnce("kro_out","cabin",1,1)
                self.WrenchMode = 0
            end
        end
    end]]
end

function ENT:OnButtonRelease(button,ply)
    if button == "Attention" then
        self.AttentionBrake :TriggerInput("Set",0)
        self.PB:TriggerInput("Set",0)
    end
	if button:find("RVS_") then
		button = button:gsub("RVS_",""):gsub("Set","")
		local num = tonumber(button)
		if num then
			self.RVS.RVSVal = self.RVS.RVSVal - 1
		end
	end		
    if button == "DoorLeft" then
        self.DoorLeft:TriggerInput("Set",0)
    end
    if button == "DoorRight" then
        self.DoorRight:TriggerInput("Set",0)
    end
    if button == "DoorClose" then
         self.EmerCloseDoors:TriggerInput("Set",0)
    end
	if button == "Micro" then
		self.R_Line:TriggerInput("Set",0)
		self.R_Micro:TriggerInput("Set",0)
	end	
	if button == "EmergencyBrakeValveToggle" and (self.K29.Value == 1 or self.Pneumatic.V4 and self:ReadTrainWire(27) == 1) and not self.Pneumatic.RVTBTimer then
		self:PlayOnce("valve_brake_close","",1,1)
	end	
end
