AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.BogeyDistance = 650 -- Needed for gm trainspawner
ENT.SyncTable = {
	"SF31","SF32","SF33","SF34","SF36","SF37","SF38","SF39","SF40","SF41","SF42","SF57",
	"SF43","SF44","SF45","SF46","SF47","SF48","SF49","SF50","SF51","SF52","SF53","SF54","SF55","SF56",
		"RearBrakeLineIsolation","RearTrainLineIsolation",
		"FrontBrakeLineIsolation","FrontTrainLineIsolation",
	"GV","K31","Battery","K23","DriverValveTLDisconnect","DriverValveBLDisconnect","EmergencyBrakeValve","stopkran",
}
--------------------------------------------------------------------------------
function ENT:Initialize()
	-- Set model and initialize
	self:SetModel("models/metrostroi_train/81-760/81_761_body.mdl")
	self.BaseClass.Initialize(self)
	self:SetPos(self:GetPos() + Vector(0,0,140))

	-- Create seat entities
	self.DriverSeat = self:CreateSeat("instructor",Vector(425,0,-55),Angle(0,90,0),"models/vehicles/prisoner_pod_inner.mdl")

	-- Hide seats
	self.DriverSeat:SetRenderMode(RENDERMODE_TRANSALPHA)
	self.DriverSeat:SetColor(Color(0,0,0,0))

	-- Create bogeys
    self.FrontBogey = self:CreateBogey(Vector(338-20.8,0,-70),Angle(0,180,0),true,"760")--z=-90
    self.RearBogey = self:CreateBogey(Vector(-338+20.8,0,-70),Angle(0,0,0),false,"760")
    self.FrontBogey:SetNWBool("Async",true)
    self.RearBogey:SetNWBool("Async",true)
	self.FrontBogey:SetNWInt("MotorSoundType",2)
	self.RearBogey:SetNWInt("MotorSoundType",2) 	
    self.FrontBogey:SetNWFloat("SqualPitch",0.75)
    self.RearBogey:SetNWFloat("SqualPitch",0.75)
	

    --self.FrontBogey:SetNWBool("DisableEngines",true)
    --self.RearBogey:SetNWBool("DisableEngines",true)
    --self.FrontBogey.DisableSound = 1
    --self.RearBogey.DisableSound = 1	
	
	--if Metrostroi.BogeyOldMap then
	--else
		self.FrontCouple = self:CreateCouple(Vector( 437.4-20.8,0,-68),Angle(0,0,0),true,"760")
		self.RearCouple  = self:CreateCouple(Vector(-437+20.8,0,-68),Angle(0,180,0),false,"760")
	--end

	self:SetNW2Entity("FrontBogey",self.FrontBogey)
	self:SetNW2Entity("RearBogey",self.RearBogey)
	self:SetNW2Entity("FrontCouple",self.FrontCouple)
	self:SetNW2Entity("RearCouple",self.RearCouple)	
	
	-- Initialize key mapping
	self.KeyMap = {
		[KEY_F] = "PneumaticBrakeUp",
		[KEY_R] = "PneumaticBrakeDown",
		[KEY_PAD_1] = "PneumaticBrakeSet1",
		[KEY_PAD_2] = "PneumaticBrakeSet2",
		[KEY_PAD_3] = "PneumaticBrakeSet3",
		[KEY_PAD_4] = "PneumaticBrakeSet4",
		[KEY_PAD_5] = "PneumaticBrakeSet5",
		[KEY_PAD_6] = "PneumaticBrakeSet6",
		[KEY_PAD_7] = "PneumaticBrakeSet7",
	}
	-- Cross connections in train wires
	self.TrainWireCrossConnections = {
		[4] = 3, -- Orientation F<->B
		[13] = 12, -- Reverser F<->B
		[38] = 37, -- Doors L<->R
	}

	self.Lights = {
		-- Interior
		--[11] = { "dynamiclight",	Vector( 200, 0, 10), Angle(0,0,0), Color(255,175,50), brightness = 3, distance = 400 , fov=180,farz = 128
		--[[
		[15] = { "dynamiclight",	Vector(-330, 0, 10), Angle(0,0,0), Color(238,238,197), brightness = 0.5, distance = 500, fov=180,farz = 128 },
		[16] = { "dynamiclight",	Vector(-0, 0, 10), Angle(0,0,0), Color(238,238,197), brightness = 0.5, distance = 500, fov=180,farz = 128 },
		[17] = { "dynamiclight",	Vector( 330, 0, 10), Angle(0,0,0), Color(238,238,197), brightness = 0.5, distance = 500, fov=180,farz = 128 },]]
        -- Interior
        [11] = { "dynamiclight",    Vector( 285, 0, 10), Angle(0,0,0), Color(230,230,255), brightness = 2, distance = 650,fov=180,farz = 128},
        [12] = { "dynamiclight",    Vector(  -5, 0, 10), Angle(0,0,0), Color(230,230,255), brightness = 2, distance = 650,fov=180,farz = 128},
        [13] = { "dynamiclight",    Vector(-295, 0, 10), Angle(0,0,0), Color(230,230,255), brightness = 2, distance = 650,fov=180,farz = 128},		
		
		--[13] = { "dynamiclight",	Vector(-200, 0, 10), Angle(0,0,0), Color(255,175,50), brightness = 3, distance = 400 , fov=180,farz = 128 },
		--[11] = { "dynamiclight",	Vector( 100, 0, 10), Angle(0,0,0), Color(255,175,50), brightness = 3, distance = 400 , fov=180,farz = 128 },
		--[12] = { "dynamiclight",	Vector( 100, 0, 10), Angle(0,0,0), Color(255,175,50), brightness = 3, distance = 400, fov=180,farz = 128 },
	}
	
	self.FrontDoor = false
	self.RearDoor = false
	
	self.CouchCapL = false
	self.CouchCapR = false
	self.door_k31 = false
	self.stopcrane_cap = false
	
	
	self:TrainSpawnerUpdate()
end


function ENT:TrainSpawnerUpdate()
	
	-- select color body train
	local bodyVersionTrain = self:GetNW2String("Version")
	
	self:SetNW2String("Texture", bodyVersionTrain)
	self:SetNW2String("texture", bodyVersionTrain)
	

	for i=1,4 do
		self:SetNW2Int("DoorRBR"..i,1)--math.random(0,1))				
		self:SetNW2Int("DoorLBR"..i,1)--math.random(0,1))				
	end
	

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
	local power = self.Electric.Power > 0
	self:SetPackedBool("WorkBeep",power)
    self:SetPackedBool("WorkFan",Panel.WorkFan>0)--power and self.Battery.Value*self.GV.Value*(550 <= self.Electric.Main750V and self.Electric.Main750V <= 975 and 1 or 0) > 0)	
    local state = math.abs(self.AsyncInverter.InverterFrequency/(11+self.AsyncInverter.State*5))--(10+8*math.Clamp((self.AsyncInverter.State-0.4)/0.4,0,1)))
    self:SetPackedRatio("asynccurrent", math.Clamp(state*(state+self.AsyncInverter.State/1),0,1)*math.Clamp(self.Speed/6,0,1))
    self:SetPackedRatio("asyncstate", math.Clamp(self.AsyncInverter.State/0.2*math.abs(self.AsyncInverter.Current)/100,0,1))
    self:SetPackedRatio("chopper", math.Clamp(self.Electric.Chopper>0 and self.Electric.Iexit/100 or 0,0,1))
	
    self:SetPackedBool("CompressorWork",self.Pneumatic.Compressor and CurTime()-self.Pneumatic.Compressor > 0)
	--self:SetPackedBool("Vent1Work",self.Electric.Vent1>0)
	--self:SetPackedBool("Vent2Work",self.Electric.Vent2>0)
	--self:SetPackedBool("PSNWork",power and self.BUV.PSN > 0)
    self:SetPackedRatio("Cran", self.Pneumatic.DriverValvePosition)	
	--print(self.DriverValveBLDisconnect.Value,self.DriverValveTLDisconnect.Value)

    self:SetNW2Int("PassSchemesLED",self.CIS.PassSchemeCurr)
    self:SetNW2Int("PassSchemesLEDN",self.CIS.PassSchemeArr)
    self:SetPackedBool("PassSchemesLEDO",self.CIS.PassSchemePath)
    self:SetPackedBool("PassSchemes",Panel.PassSchemes>0)-- power and (self.BUV.Power*(self.SF37.Value+self.SF38.Value) > 0) and self.CIS.BMCISInit)
    self:SetPackedBool("PassSchemesL",Panel.PassSchemesL>0) --power and self.BUV.Power*self.SF37.Value > 0)
    self:SetPackedBool("PassSchemesR",Panel.PassSchemesR>0) --power and self.BUV.Power*self.SF38.Value > 0)
	self:SetPackedBool("FrontDoor",self.FrontDoor)
	self:SetPackedBool("RearDoor",self.RearDoor)
    self:SetPackedBool("CouchCapR",self.CouchCapR)
    self:SetPackedBool("CouchCapL",self.CouchCapL)	
	self:SetPackedBool("door_k31",self.door_k31)
	self:SetPackedBool("door_stopcrane",self.stopcrane_cap)
	
    self:SetPackedRatio("LV",Panel.LV/150)--self.Battery.Value*self.SF44.Value*self.Electric.Battery80V/150)	
    self:SetPackedRatio("HV",self.Electric.Main750V/1000)	
	self:SetPackedRatio("IVO",0.5+self.BUV.IVO/150)	

	local fB,rB = self.FrontBogey,self.RearBogey
	local validfB,validrB = IsValid(fB),IsValid(rB)
	for i=1,4 do
		self:SetPackedBool("TR"..i,self.BUV.Pant or i<=2 and validfB and fB.DisableContactsManual or i>2 and validrB and rB.DisableContactsManual)
	end
    --local passlight = power1 and (self.BUV.MainLights and 1 or (self.SF44.Value > 0.5 and (self.SF31.Value+self.SF32.Value > 0.5)) and 0.25) or 0
	
	--local passlight = power and ((self.SF44.Value*self.Battery.Value > 0 and 0.25 or 0)+(self.BUV.MainLights and self.SF43.Value*self.Battery.Value > 0 and 0.75 or 0)) or 0
	local passlight = Panel.SalonLighting1*0.25+Panel.SalonLighting2*0.75
	local passl = passlight > 0
    self:SetLightPower(11,passl, passlight)
    self:SetLightPower(12,passl, passlight)
    self:SetLightPower(13,passl, passlight)
	self:SetPackedBool("SalonLighting1",Panel.SalonLighting1 > 0)
	self:SetPackedBool("SalonLighting2",Panel.SalonLighting2 > 0)		
	--self:SetPackedBool("SalonLighting1",power and self.SF44.Value*self.Battery.Value > 0)
	--self:SetPackedBool("SalonLighting2",power and self.BUV.MainLights and self.SF43.Value*self.Battery.Value > 0)
    --self:SetPackedRatio("SalonLighting",passlight)
	
    self:SetPackedBool("AnnPlay",power)--self:GetNW2Bool("AnnouncerPlaying",false))	
	
	self:SetNW2Bool("DoorAlarm",self.CIS.DoorAlarm)
	
    self:SetPackedRatio("BL", self.Pneumatic.BrakeLinePressure/16.0)
    self:SetPackedRatio("TL", self.Pneumatic.TLPressure/16.0)
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
	
	if self.FrontTrain ~= self.PrevFrontTrain then
		self:SetNW2Entity("FrontTrain",self.FrontTrain)
		self.PrevFrontTrain = self.FrontTrain
	end
	if self.RearTrain ~= self.PrevRearTrain then
		self:SetNW2Entity("RearTrain",self.RearTrain)
		self.PrevRearTrain = self.RearTrain	
	end
	
	--local mul = self.SF45.Value > 0.5 and self.BUV.MainLights and 1 or self.SF46.Value > 0.5 and 0.5 or 0
	--self:SetLightPower(11,self.BUV.Power and mul > 0, mul)
	--self:SetLightPower(12,self.BUV.Power and mul > 0, mul)
    self:SetPackedRatio("Speed", self.Speed)
    self.AsyncInverter:TriggerInput("Speed",self.Speed)
    --self.AsyncInverter:TriggerInput("Speed1",self.Speed)
	if validfB and validrB and not self.IgnoreEngine then
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
        rB.PneumaticBrakeForce = 50000.0--3000 --40000
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
	if self.CouchCapR then
		if string.find(button,"PneumaticBrakeSet") then
			self.Pneumatic:TriggerInput("BrakeSet",tonumber(button:sub(-1,-1)))
			return
		end
	end
    if button == "CouchCapL" then
        self.CouchCapL = not self.CouchCapL
    end	
    if button == "CouchCapR" and (not self.CouchCapR or self.Pneumatic.DriverValvePosition <= 2)  then
        self.CouchCapR = not self.CouchCapR
    end	
	if button == "DriverValveTLDisconnectToggle" then
		self:PlayOnce("pneumo_TL_"..(self.DriverValveTLDisconnect.Value == 0 and "open" or "disconnect"),"")
	end
	if button == "DriverValveBLDisconnectToggle" then
		self:PlayOnce("pneumo_BL_"..(self.DriverValveBLDisconnect.Value == 0 and "open" or "disconnect"),"")	
	end
	if button == "EmergencyBrakeValveToggle" then
		self:PlayOnce("pneumo_brake_"..(self.EmergencyBrakeValve.Value == 0 and "open" or "disconnect"),"")
	end
	if button == "K31Cap" then self.door_k31 = not self.door_k31 end
	if button == "stopkranToggle" then self:PlayOnce("stopkran_"..(self.stopkran.Value == 0 and "open" or "disconnect"),"") end
	if button == "StopcraneCap" then if self.stopkran.Value == 0 or not self.stopcrane_cap then self.stopcrane_cap = not self.stopcrane_cap end end--self.stopkran:TriggerInput("Block",self.stopcrane_cap and 0 or 1)
	if button == "FrontDoor" and (self.FrontDoor or not self.BUV.BlockTorec) then self.FrontDoor = not self.FrontDoor --[[self:PlayOnce("door_cab_f_"..(self.FrontDoor and "open" or "close"),"")]] end
	if button == "RearDoor" and (self.RearDoor or not self.BUV.BlockTorec) then self.RearDoor = not self.RearDoor --[[self:PlayOnce("door_cab_b_"..(self.RearDoor and "open" or "close"),"")]] end
end
