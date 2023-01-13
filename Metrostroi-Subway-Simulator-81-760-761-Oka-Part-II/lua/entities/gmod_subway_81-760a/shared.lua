ENT.Type            = "anim"
ENT.Base            = "gmod_subway_base"

ENT.PrintName		= "81-760A MVM"
ENT.Author          = ""
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category		= "Metrostroi (trains)"
--ENT.SkinsType = "81-760A"
ENT.Model = "models/metrostroi_train/81-760/81_760a_body.mdl"

ENT.Spawnable       = true
ENT.AdminSpawnable  = false
ENT.DontAccelerateSimulation = false

function ENT:PassengerCapacity()
	return 300
end

function ENT:GetStandingArea()
	return Vector(-450,-30,-53),Vector(360,30,-53)
end
local function GetDoorPosition(i,k)
	return Vector(377.0 - 36.0 + 1*(k) - 230*i,-64*(1-2*k),-10)
end
local yventpos = {
	-414.5+0*117,
	-414.5+1*117+6.2,
	-414.5+2*117+5,
	-414.5+3*117+2,
	-414.5+4*117+0.5,
	-414.5+5*117-2.3,
	-414.5+6*117,
}
function ENT:InitializeSounds()
	self.BaseClass.InitializeSounds(self)
	--[[
	self.SoundNames["tisu"]   = {"subway_trains/720/tisu.wav",loop = true}
	self.SoundPositions["tisu"] = {800,1e9,Vector(0,0,-40),0.3} --FIXME: Pos
	self.SoundNames["tisu2"]   = {"subway_trains/720/tisu4.wav",loop = true}
	self.SoundPositions["tisu2"] = {50,1e9,Vector(430,0,0),0.5} --FIXME: Pos
	self.SoundNames["tisu3"]   = {"subway_trains/720/tisu3.wav",loop = true}
	self.SoundPositions["tisu3"] = {800,1e9,Vector(0,0,-40),0.5} --FIXME: Pos
	]]
	--[[
	for i=1,2 do
		self.SoundNames["test_async1"..i]   = {"subway_trains/722/engines/inverter_start2.wav",loop = true}
		self.SoundPositions["test_async1"..i] = {600,1e9,Vector(0,-40+i*80,-40),0.2} --FIXME: Pos
		self.SoundNames["test_asyncp1"..i]   = {"subway_trains/722/engines/inverter_start2.wav",loop = true}
		self.SoundPositions["test_asyncp1"..i] = {600,1e9,Vector(0,-40+i*80,-40),0.2} --FIXME: Pos
		self.SoundNames["test_asyncp2"..i]   = {"subway_trains/722/engines/inverter_start2.wav",loop = true}
		self.SoundPositions["test_asyncp2"..i] = {600,1e9,Vector(0,-40+i*80,-40),0.2} --FIXME: Pos
	end	]]
	self.SoundNames["async1"]   = {"subway_trains/760/engines/inverter.wav", loop = true}
    self.SoundPositions["async1"] = {400,1e9,Vector(0,0,0),0.5}
  
	for i=1,7 do
		self.SoundNames["vent"..i] = {loop=true,"subway_trains/720/vent_mix.wav"}
		self.SoundPositions["vent"..i] = {100,1e9,Vector(yventpos[i],0,30),0.5}
	end

	self.SoundNames["ring"] = {loop=true,"subway_trains/760/new/ring_ars.wav"}--{"subway_trains/760/ring/ring760_start.mp3","subway_trains/760/new/ring760_loop.mp3","subway_trains/760/ring/ring760_end.mp3"}
	self.SoundPositions["ring"] = {100,1e9,Vector(409,25.6,-26.3)}

	self.SoundNames["compressor"] = {loop=true,"subway_trains/760/new/compressor_loop.wav"}--{loop=true,"subway_trains/722/compressol_loop.wav"}
	self.SoundPositions["compressor"] = {800,1e9,Vector(-118,-40,-66)} --FIXME: Pos
	self.SoundNames["compressor_pn1"] = "subway_trains/760/new/compressor_dhm.wav"
	self.SoundPositions["compressor_pn1"] = {800,1e9,Vector(-118,-40,-66)} --FIXME: Pos
	self.SoundNames["compressor_pn2"] = "subway_trains/760/new/compressor_dhm_2.wav"
	self.SoundPositions["compressor_pn2"] = {800,1e9,Vector(-118,-40,-66)} --FIXME: Pos	

    self.SoundNames["release"] = {loop=true,"subway_trains/760/new/pneumo_release2.wav"}
    self.SoundPositions["release"] = {320,1e9,Vector(-183,0,-70),0.1} --FIXME: Pos
    self.SoundNames["parking_brake"] = {loop=true,"subway_trains/common/pneumatic/autostop_loop.wav"}
    self.SoundPositions["parking_brake"] = {400,1e9,Vector(-183,0,-70),0.95}
    self.SoundNames["crane013_brake"] = {loop=true,"subway_trains/common/pneumatic/release_2.wav"}
    self.SoundPositions["crane013_brake"] = {80,1e9,Vector(475,-10,-47.9),0.86}
    self.SoundNames["crane013_brake2"] = {loop=true,"subway_trains/common/pneumatic/013_brake2.wav"}
    self.SoundPositions["crane013_brake2"] = {80,1e9,Vector(475,-10,-47.9),0.86}
    self.SoundNames["crane013_release"] = {loop=true,"subway_trains/common/pneumatic/013_release.wav"}
    self.SoundPositions["crane013_release"] = {80,1e9,Vector(475,-10,-47.9),0.4}

    self.SoundNames["pneumo_disconnect_close"] = {"subway_trains/760/013_close1.wav"}
    self.SoundNames["pneumo_disconnect_open"] = {
        "subway_trains/760/013_open1.wav",
    }
    self.SoundPositions["pneumo_disconnect_close"] = {100,1e9,Vector(478,45,-61),0.5}
    self.SoundPositions["pneumo_disconnect_open"] = {100,1e9,Vector(478,45,-61),0.5}
    self.SoundPositions["pneumo_disconnect_close"] = {100,1e9,Vector(478,45,-61),0.5}
    self.SoundPositions["pneumo_disconnect_open"] = {100,1e9,Vector(478,45,-61),0.5}

    self.SoundNames["front_isolation"] = {loop=true,"subway_trains/common/pneumatic/isolation_leak.wav"}
    self.SoundPositions["front_isolation"] = {300,1e9,Vector(500, 0,-63),1}
    self.SoundNames["rear_isolation"] = {loop=true,"subway_trains/common/pneumatic/isolation_leak.wav"}
    self.SoundPositions["rear_isolation"] = {300,1e9,Vector(-469, 0,-63),1}

    self.SoundNames["horn"] = {loop=0.6,"subway_trains/common/pneumatic/horn/horn3_start.wav","subway_trains/common/pneumatic/horn/horn3_loop.wav", "subway_trains/common/pneumatic/horn/horn3_end.wav"}
    self.SoundPositions["horn"] = {1100,1e9,Vector(500,0,-30)}

	self.SoundNames["KV_-3_-2"] = "subway_trains/760/controller/t3_t2.mp3"
	self.SoundNames["KV_-2_-1"] = "subway_trains/760/controller/t2_t1.mp3"
	self.SoundNames["KV_-1_0"] = "subway_trains/760/controller/t1_0.mp3"
	self.SoundNames["KV_0_1"] = "subway_trains/760/controller/0_x1.mp3"
	self.SoundNames["KV_1_2"] = "subway_trains/760/controller/x1_x2.mp3"
	self.SoundNames["KV_2_3"] = "subway_trains/760/controller/x2_x3.mp3"
	self.SoundNames["KV_3_4"] = "subway_trains/760/controller/x3_x4.mp3"
	self.SoundNames["KV_4_3"] = "subway_trains/760/controller/x4_x3.mp3"
	self.SoundNames["KV_3_2"] = "subway_trains/760/controller/x3_x2.mp3"
	self.SoundNames["KV_2_1"] = "subway_trains/760/controller/x2_x1.mp3"
	self.SoundNames["KV_1_0"] = "subway_trains/760/controller/x1_0.mp3"
	self.SoundNames["KV_0_-1"] = "subway_trains/760/controller/0_t1.mp3"
	self.SoundNames["KV_-1_-2"] = "subway_trains/760/controller/t1_t2.mp3"
	self.SoundNames["KV_-2_-3"] = "subway_trains/760/controller/t2_t3.mp3"
	self.SoundPositions["KV_-3_-2"] = {80,1e9,Vector(461.8,25.3,-27.7)}
	self.SoundPositions["KV_-2_-1"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_-1_0"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_0_1"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_1_2"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_2_3"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_3_4"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_4_3"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_3_2"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_2_1"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_1_0"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_0_-1"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_-1_-2"] = self.SoundPositions["KV_-3_-2"]
	self.SoundPositions["KV_-2_-3"] = self.SoundPositions["KV_-3_-2"]

	self.SoundNames["kro_in"] = {
		"subway_trains/717/kru/kru_insert1.mp3",
		"subway_trains/717/kru/kru_insert2.mp3"
	}
	self.SoundNames["kro_out"] = {
		"subway_trains/717/kru/kru_eject1.mp3",
		"subway_trains/717/kru/kru_eject2.mp3",
		"subway_trains/717/kru/kru_eject3.mp3",
	}
	self.SoundNames["kro_-1_0"] = {
		"subway_trains/717/kru/kru0-1_1.mp3",
		"subway_trains/717/kru/kru0-1_2.mp3",
		"subway_trains/717/kru/kru0-1_3.mp3",
		"subway_trains/717/kru/kru0-1_4.mp3",
	}
	self.SoundNames["kro_0_1"] = {
		"subway_trains/717/kru/kru1-2_1.mp3",
		"subway_trains/717/kru/kru1-2_2.mp3",
		"subway_trains/717/kru/kru1-2_3.mp3",
		"subway_trains/717/kru/kru1-2_4.mp3",
	}
	self.SoundNames["kro_1_0"] = {
		"subway_trains/717/kru/kru2-1_1.mp3",
		"subway_trains/717/kru/kru2-1_2.mp3",
		"subway_trains/717/kru/kru2-1_3.mp3",
		"subway_trains/717/kru/kru2-1_4.mp3",
	}
	self.SoundNames["kro_0_-1"] = {
		"subway_trains/717/kru/kru1-0_1.mp3",
		"subway_trains/717/kru/kru1-0_2.mp3",
		"subway_trains/717/kru/kru1-0_3.mp3",
		"subway_trains/717/kru/kru1-0_4.mp3",
	}
	self.SoundPositions["kro_in"] = {80,1e9,Vector(463.4,53.3,-21.1)}
	self.SoundPositions["kro_out"] = self.SoundPositions["kro_in"]
	self.SoundPositions["kro_-1_0"] = self.SoundPositions["kro_in"]
	self.SoundPositions["kro_0_1"] = self.SoundPositions["kro_in"]
	self.SoundPositions["kro_1_0"] = self.SoundPositions["kro_in"]
	self.SoundPositions["kro_0_-1"] = self.SoundPositions["kro_in"]

	self.SoundNames["krr_in"] = self.SoundNames["kro_in"]
	self.SoundNames["krr_out"] = self.SoundNames["kro_out"]
	self.SoundNames["krr_-1_0"] = self.SoundNames["kro_-1_0"]
	self.SoundNames["krr_0_1"] = self.SoundNames["kro_0_1"]
	self.SoundNames["krr_1_0"] = self.SoundNames["kro_1_0"]
	self.SoundNames["krr_0_-1"] = self.SoundNames["kro_0_-1"]
	self.SoundPositions["krr_in"] = {80,1e9,Vector(470.4,53.9,-17.3)}
	self.SoundPositions["krr_out"] = self.SoundPositions["krr_in"]
	self.SoundPositions["krr_-1_0"] = self.SoundPositions["krr_in"]
	self.SoundPositions["krr_0_1"] = self.SoundPositions["krr_in"]
	self.SoundPositions["krr_1_0"] = self.SoundPositions["krr_in"]
	self.SoundPositions["krr_0_-1"] = self.SoundPositions["krr_in"]

	self.SoundNames["switch_batt_on"] = {"subway_trains/760/vb_on.wav"}
	self.SoundNames["switch_batt_off"] = {"subway_trains/720/switches/batt_off.mp3","subway_trains/720/switches/batt_off2.mp3"}

	self.SoundNames["switch_batt"] = {"subway_trains/720/switches/batt_on.mp3","subway_trains/720/switches/batt_on2.mp3","subway_trains/720/switches/batt_off.mp3","subway_trains/720/switches/batt_off2.mp3"}

	self.SoundNames["switch_pvz_on"] = {"subway_trains/720/switches/switchb_on.mp3","subway_trains/720/switches/switchp_on.mp3"}
	self.SoundNames["switch_pvz_off"] = {"subway_trains/720/switches/switchb_off.mp3","subway_trains/720/switches/switchp_off.mp3"}

	self.SoundNames["switch_on"] = {"subway_trains/720/switches/switchp_on.mp3","subway_trains/720/switches/switchp_on2.mp3","subway_trains/720/switches/switchp_on3.mp3"}
	self.SoundNames["switch_off"] = {"subway_trains/720/switches/switchp_off.mp3","subway_trains/720/switches/switchp_off2.mp3","subway_trains/720/switches/switchp_off3.mp3"}

	self.SoundNames["button_press"] = {"subway_trains/720/switches/butt_press.mp3","subway_trains/720/switches/butt_press2.mp3","subway_trains/720/switches/butt_press3.mp3"}
	self.SoundNames["button_release"] = {"subway_trains/720/switches/butt_release.mp3","subway_trains/720/switches/butt_release2.mp3","subway_trains/720/switches/butt_release3.mp3"}

	self.SoundNames["button_square_press"] = "subway_trains/720/switches/butts_press.mp3"
	self.SoundNames["button_square_release"] = "subway_trains/720/switches/butts_release.mp3"

	self.SoundNames["button_square_on"] = {"subway_trains/720/switches/butts_on.mp3","subway_trains/720/switches/butts_on2.mp3"}
	self.SoundNames["button_square_off"] = {"subway_trains/720/switches/butts_off.mp3","subway_trains/720/switches/butts_off2.mp3"}

	self.SoundNames["door_cab_open"] = {"subway_trains/720/door/door_torec_open.mp3","subway_trains/720/door/door_torec_open2.mp3"}
	self.SoundNames["door_cab_close"] = {"subway_trains/720/door/door_torec_close.mp3","subway_trains/720/door/door_torec_close2.mp3"}
	self.SoundNames["door_cab_roll"] = {"subway_trains/720/door/cabdoor_roll1.mp3","subway_trains/720/door/cabdoor_roll2.mp3","subway_trains/720/door/cabdoor_roll3.mp3","subway_trains/720/door/cabdoor_roll4.mp3"}

    self.SoundNames["rolling_10"] = {loop=true,"subway_trains/722/rolling_10.wav"}
    self.SoundNames["rolling_45"] = {loop=true,"subway_trains/722/rolling_45.wav"}
    self.SoundNames["rolling_60"] = {loop=true,"subway_trains/722/rolling_60.wav"}
    self.SoundNames["rolling_70"] = {loop=true,"subway_trains/722/rolling_70.wav"}
    self.SoundPositions["rolling_10"] = {485,1e9,Vector(0,0,0),0.20}
    self.SoundPositions["rolling_45"] = {485,1e9,Vector(0,0,0),0.50}
    self.SoundPositions["rolling_60"] = {485,1e9,Vector(0,0,0),0.55}
    self.SoundPositions["rolling_70"] = {485,1e9,Vector(0,0,0),0.60}
    self.SoundNames["rolling_low"] = {loop=true,"subway_trains/717/rolling/rolling_outside_low.wav"}
    self.SoundNames["rolling_medium1"] = {loop=true,"subway_trains/717/rolling/rolling_outside_medium1.wav"}
    self.SoundNames["rolling_medium2"] = {loop=true,"subway_trains/717/rolling/rolling_outside_medium2.wav"}
    self.SoundNames["rolling_high2"] = {loop=true,"subway_trains/717/rolling/rolling_outside_high2.wav"}
    self.SoundPositions["rolling_low"] = {480,1e12,Vector(0,0,0),0.6*0.4}
    self.SoundPositions["rolling_medium1"] = {480,1e12,Vector(0,0,0),0.90*0.4}
    self.SoundPositions["rolling_medium2"] = {480,1e12,Vector(0,0,0),0.90*0.4}
    self.SoundPositions["rolling_high2"] = {480,1e12,Vector(0,0,0),1.00*0.4}

	self.SoundNames["gv_f"] = {"subway_trains/717/kv70/reverser_0-b_1.mp3","subway_trains/717/kv70/reverser_0-b_2.mp3"}
	self.SoundNames["gv_b"] = {"subway_trains/717/kv70/reverser_b-0_1.mp3","subway_trains/717/kv70/reverser_b-0_2.mp3"}
	self.SoundPositions["gv_f"] = {80,1e9,Vector(126.4,50,-60-23.5),0.8}
	self.SoundPositions["gv_b"] = {80,1e9,Vector(126.4,50,-60-23.5),0.8}

    self.SoundNames["disconnectvalve"] = "subway_trains/common/switches/pneumo_disconnect_switch.mp3"
	--self.SoundNames["doors"] = "subway_trains/720/door/door_roll.mp3"
	--self.SoundNames["doorl"] = {loop=true,"subway_trains/722/door_loop.wav"}
	--self.SoundPositions["doors"] = {300,1e9,Vector(0,0,0),0.5}
	--self.SoundPositions["doorl"] = {300,1e9,Vector(0,0,0),0.5}

	--self.SoundNames["work_beep"] = {loop=true,"subway_trains/720/work_beep_loop.wav"}
	--self.SoundPositions["work_beep"] = {100,1e9,Vector(407.5,23,10),0.05}
	self.SoundNames["batt_on"] = "subway_trains/720/batt_on.mp3"
	self.SoundPositions["batt_on"] = {400,1e9,Vector(126.4,50,-60-23.5),0.3}

	self.SoundNames["igla_on"]	= "subway_trains/common/other/igla/igla_on1.mp3"
	self.SoundNames["igla_off"]	= "subway_trains/common/other/igla/igla_off2.mp3"
	self.SoundNames["igla_start1"]	= "subway_trains/common/other/igla/igla_start.mp3"
	self.SoundNames["igla_start2"]	= "subway_trains/common/other/igla/igla_start2.mp3"
	self.SoundNames["igla_alarm1"]	= "subway_trains/common/other/igla/igla_alarm1.mp3"
	self.SoundNames["igla_alarm2"]	= "subway_trains/common/other/igla/igla_alarm2.mp3"
	self.SoundNames["igla_alarm3"]	= "subway_trains/common/other/igla/igla_alarm3.mp3"
	self.SoundPositions["igla_on"] = {50,1e9,Vector(452.56,62,3.81),0.3}
	self.SoundPositions["igla_off"] = {50,1e9,Vector(452.56,62,3.81),0.3}
	self.SoundPositions["igla_start1"] = {50,1e9,Vector(452.56,62,3.81),0.5}
	self.SoundPositions["igla_start2"] = {50,1e9,Vector(452.56,62,3.81),0.3}
	self.SoundPositions["igla_alarm1"] = {50,1e9,Vector(452.56,62,3.81),0.5}
	self.SoundPositions["igla_alarm2"] = {50,1e9,Vector(452.56,62,3.81),0.5}
	self.SoundPositions["igla_alarm3"] = {50,1e9,Vector(452.56,62,3.81),0.5}

    self.SoundNames["epk_brake"] = {loop=true,"subway_trains/760/new/rvtb_loop.wav"}
    self.SoundPositions["epk_brake"] = {80,1e9,Vector(458,56.5,-61),0.65}
    self.SoundNames["epk_brake_close"] = {"subway_trains/760/new/rvtb_end.wav"}
    self.SoundPositions["epk_brake_close"] = {80,1e9,Vector(458,56.5,-61),0.65}	
    self.SoundNames["epk_brake_open"] = {"subway_trains/760/new/rvtb_start.wav"}
    self.SoundPositions["epk_brake_open"] = {80,1e9,Vector(458,56.5,-61),0.65}

    self.SoundNames["valve_brake"] = {loop=true,"subway_trains/760/new/stopcrane_loop.wav"}
    self.SoundPositions["valve_brake"] = {400,1e9,Vector(418.25,-49.2,1.3),1}
    self.SoundNames["valve_brake_close"] = {"subway_trains/760/stopkran_close.wav"}
    self.SoundPositions["valve_brake_close"] = {400,1e9,Vector(418.25,-49.2,1.3),1}
	self.SoundNames["valve_brake_open"] = {"subway_trains/760/stopkran_open.wav"}
    self.SoundPositions["valve_brake_open"] = {400,1e9,Vector(418.25,-49.2,1.3),1}
	
    self.SoundNames["emer_brake"] = {loop=true,"subway_trains/common/pneumatic/autostop_loop.wav"}
    self.SoundPositions["emer_brake"] = {600,1e9,Vector(380,-45,-75),0.95}
	
	self.SoundNames["vent_loop"] = {loop=true,"subway_trains/760/new/vent_cockpit_default_2.wav"}
    self.SoundPositions["vent_loop"] = {400,1e9,Vector(422,55,40),1}	
	self.SoundNames["vent_loop_max"] = {loop=true,"subway_trains/760/new/vent_cockpit_high.wav"}
    self.SoundPositions["vent_loop_max"] = {400,1e9,Vector(422,55,40),1}	

	local function GetDoorPosition(i,k,j)
		if j == 0
		then return Vector(381 - 36.0 + 1*(k) -0.85*(k == 1 and 1 or 0) - 230*i,-66*(1-2*k),-1)
		else return Vector(381 - 36.0 + 1*(k) -0.85*(k == 1 and 1 or 0) - 230*i,-66*(1-2*k),-1)
		end
	end

    for i=0,3 do
        for k=0,1 do
            self.SoundNames["door"..i.."x"..k.."r0"] = {loop=true,"subway_trains/760/doors/door_loop4.mp3"}
            self.SoundPositions["door"..i.."x"..k.."r0"] = {100,1e9,GetDoorPosition(i,k),1}
            self.SoundNames["door"..i.."x"..k.."r1"] = {loop=true,"subway_trains/760/doors/door_loop3.wav"}
            self.SoundPositions["door"..i.."x"..k.."r1"] = {100,1e9,GetDoorPosition(i,k),1}			
            self.SoundNames["door"..i.."x"..k.."o"] = {"subway_trains/760/doors/door_open_end4.mp3","subway_trains/760/doors/door_open_end3.mp3","subway_trains/760/doors/door_open_end2.wav"}
            self.SoundPositions["door"..i.."x"..k.."o"] = {150,1e9,GetDoorPosition(i,k),0.55}
            self.SoundNames["door"..i.."x"..k.."op0"] = {"subway_trains/760/doors/door_open_start2.mp3"}
            self.SoundPositions["door"..i.."x"..k.."op0"] = {150,1e9,GetDoorPosition(i,k),0.3}
            self.SoundNames["door"..i.."x"..k.."op1"] = {"subway_trains/760/doors/door_open_start1.wav"}
            self.SoundPositions["door"..i.."x"..k.."op1"] = {150,1e9,GetDoorPosition(i,k),0.3}			
            self.SoundNames["door"..i.."x"..k.."c"] = {"subway_trains/760/doors/door_close1.mp3","subway_trains/760/doors/door_close2.mp3"}--,"subway_trains/760/door/door_close2.mp3"}
            self.SoundPositions["door"..i.."x"..k.."c"] = {250,1e9,GetDoorPosition(i,k),0.55}
        end
    end
	self.SoundNames["door_alarm"] = {"subway_trains/722/door_alarm.mp3"}
    self.SoundPositions["door_alarm"] = {485,1e9,Vector(0,0,0),0.25}

	self.SoundNames["sf_on"] = "subway_trains/722/switches/sf_on.mp3"
	self.SoundNames["sf_off"] = "subway_trains/722/switches/sf_off.mp3"

	self.SoundNames["door_cab_l_open"] = self.SoundNames["door_cab_open"]
	self.SoundPositions["door_cab_l_open"] = {800,1e9,Vector(412.8,63.2,34.5),0.5}
	self.SoundNames["door_cab_l_close"] = self.SoundNames["door_cab_close"]
	self.SoundPositions["door_cab_l_close"] = {800,1e9,Vector(412.8,63.2,34.5),0.5}
	self.SoundNames["door_cab_r_open"] = self.SoundNames["door_cab_open"]
	self.SoundPositions["door_cab_r_open"] = {800,1e9,Vector(412.8,-63.2,34.5),0.5}
	self.SoundNames["door_cab_r_close"] = self.SoundNames["door_cab_close"]
	self.SoundPositions["door_cab_r_close"] = {800,1e9,Vector(412.8,-63.2,34.5),0.5}
	self.SoundNames["door_cab_m_open"] = self.SoundNames["door_cab_open"]
	self.SoundPositions["door_cab_m_open"] = {800,1e9,Vector(380,5,-12.3),0.5}
	self.SoundNames["door_cab_m_close"] = self.SoundNames["door_cab_close"]
	self.SoundPositions["door_cab_m_close"] = {800,1e9,Vector(380,5,-12.3),0.5}
	self.SoundNames["door_add_1_open"] = self.SoundNames["door_cab_open"]
	self.SoundPositions["door_add_1_open"] = {800,1e9,Vector(411.2,-57.5,45),0.5}
	self.SoundNames["door_add_1_close"] = self.SoundNames["door_cab_close"]
	self.SoundPositions["door_add_1_close"] = {800,1e9,Vector(411.2,-57.5,45),0.5}	
	self.SoundNames["door_add_2_open"] = self.SoundNames["door_cab_open"]
	self.SoundPositions["door_add_2_open"] = {800,1e9,Vector(406.5,-30.2,45.5),0.5}
	self.SoundNames["door_add_2_close"] = self.SoundNames["door_cab_close"]
	self.SoundPositions["door_add_2_close"] = {800,1e9,Vector(406.5,-30.2,45.5),0.5}	
	self.SoundNames["door_pvz_open"] = self.SoundNames["door_cab_open"]
	self.SoundPositions["door_pvz_open"] = {800,1e9,Vector(411.6,21,42),0.5}
	self.SoundNames["door_pvz_close"] = self.SoundNames["door_cab_close"]
	self.SoundPositions["door_pvz_close"] = {800,1e9,Vector(411.6,21,42),0.5}

	self.SoundNames["bkpu"] = {"subway_trains/760/vb_on.wav"}
	self.SoundPositions["bkpu"] = {800,1e9,Vector(410.2,59,1),0.5}	
	self.SoundNames["ring_ppz"] = {loop = true,"subway_trains/760/new/ring_vityaz.wav"}
	self.SoundPositions["ring_ppz"] = {800,1e9,Vector(410.2,57,1),0.5}	
	self.SoundNames["powerreserve"] = {"subway_trains/760/vb_on.wav"}
	self.SoundPositions["powerreserve"] = {800,1e9,Vector(410.2,55,1),0.5}
    self.SoundNames["bv_off"] = {"subway_trains/760/new/bv_off.wav"}
    self.SoundPositions["bv_off"] = {800,1e9,Vector(0,0,-45),0.5}		

	self.SoundNames["rvs1"] = {"subway_trains/722/door_alarm.mp3"}
	self.SoundPositions["rvs1"] = {800,1e9,Vector(454.817,60.54,-10.64),0.5}
	
    for i = 1,10 do
        local id1 = Format("b1tunnel_%d",i)
        local id2 = Format("b2tunnel_%d",i)
        self.SoundPositions[id1.."a"] = {700*0.75,1e9,Vector( 317-5,0,-84),1*0.5}
        self.SoundPositions[id1.."b"] = self.SoundPositions[id1.."a"]
        self.SoundPositions[id2.."a"] = {700*0.75,1e9,Vector(-317+0,0,-84),1*0.5}
        self.SoundPositions[id2.."b"] = self.SoundPositions[id2.."a"]
    end
    for i = 1,14 do
        local id1 = Format("b1street_%d",i)
        local id2 = Format("b2street_%d",i)
        self.SoundPositions[id1.."a"] = {700,1e9,Vector( 317-5,0,-84),1.5*0.5}
        self.SoundPositions[id1.."b"] = self.SoundPositions[id1.."a"]
        self.SoundPositions[id2.."a"] = {700,1e9,Vector(-317+0,0,-84),1.5*0.5}
        self.SoundPositions[id2.."b"] = self.SoundPositions[id2.."a"]
    end
    for k,v in ipairs(self.AnnouncerPositions) do
        self.SoundNames["announcer_noise1_"..k] = {loop=true,"subway_announcers/upo/noiseS1.wav"}
        self.SoundPositions["announcer_noise1_"..k] = {v[2] or 300,1e9,v[1],v[3]*0.2}
        self.SoundNames["announcer_noise2_"..k] = {loop=true,"subway_announcers/upo/noiseS2.wav"}
        self.SoundPositions["announcer_noise2_"..k] = {v[2] or 300,1e9,v[1],v[3]*0.2}
        self.SoundNames["announcer_noise3_"..k] = {loop=true,"subway_announcers/upo/noiseS3.wav"}
        self.SoundPositions["announcer_noise3_"..k] = {v[2] or 300,1e9,v[1],v[3]*0.2}
        self.SoundNames["announcer_noiseW"..k] = {loop=true,"subway_announcers/upo/noiseW.wav"}
        self.SoundPositions["announcer_noiseW"..k] = {v[2] or 300,1e9,v[1],v[3]*0.2}
    end
end

function ENT:InitializeSystems()
	self:LoadSystem("TR","TR_3B")--"81_760_TR_7B")
	self:LoadSystem("Electric","81_760A_Electric")
	self:LoadSystem("AsyncInverter","81_760_AsyncInverter")
	self:LoadSystem("RV","81_720_RV")

	self:LoadSystem("BUKP","81_760A_BUKP")
	self:LoadSystem("BUV","81_760_BUV")--БКВУ

	self:LoadSystem("BARS","81_760_BARS")

	self:LoadSystem("SD3","Relay","Switch")
	self:LoadSystem("Pneumatic","81_760_Pneumatic")
	self:LoadSystem("Horn","81_720_Horn")

	self:LoadSystem("Panel","81_760A_Panel")

	self:LoadSystem("Announcer","81_71_Announcer", "AnnouncementsASNP")
	self:LoadSystem("ASNP","81_760_ASNP")
	self:LoadSystem("ASNP_VV","81_760_ASNP_VV")
	self:LoadSystem("BackTicker","81_760_Ticker")

	self:LoadSystem("IGLA_CBKI","81_760_IGLA_CBKI1")
	self:LoadSystem("IGLA_PCBK","81_760_IGLA_PCBK")

	self:LoadSystem("CIS","81_760_CIS")
	self:LoadSystem("RVS","81_760A_RVS_1")
	self:LoadSystem("RPDP","81_760_RPDP")	
	self:LoadSystem("BNT","81_760_BNT")--Монитор блока наддверного табло
	self:LoadSystem("Speedometer","81_760_Speedometer")
	self:LoadSystem("BMCIS","81_760_BMCIS")

	self:LoadSystem("RouteNumber","81_760_RouteNumber")

	self:LoadSystem("CAMS","81_760_CAMS")
	self:LoadSystem("Prost_Kos","81_760_Prost_Kos")
	--self:LoadSystem("MEZHWAG")
end
ENT.AnnouncerPositions = {
}
table.insert(ENT.AnnouncerPositions,{Vector(470,0,44),100,0.1})
for i=1,4 do
    table.insert(ENT.AnnouncerPositions,{Vector(323-(i-1)*230 --[[+37.5]],47 ,44),100,0.1})
    table.insert(ENT.AnnouncerPositions,{Vector(323-(i-1)*230,-47,44),100,0.1})
end
ENT.Cameras = {
	--{Vector(407.5+17,32,22),Angle(0,180-7,0),"Train.760.CameraCond"},
	{Vector(412+17,49,1),Angle(0,180,0),"Train.760.CameraPPZ"},
	{Vector(445.5+11,52,-1),Angle(0,90,0),"Train.760.CameraASNPIGLA"},
	{Vector(416.8+60,35.4,-4),Angle(25,25,-5.3),"Train.760.CameraCams"},
	{Vector(425.8+60,14.4,-2),Angle(25,0,0),"Train.760.CameraBMCIS"},
	{Vector(416.8+60,-1.4,-4),Angle(25,-25,5.3),"Train.760.CameraVityaz"},
	{Vector(427.5+40,40	,-25),Angle(60,90,0),"Train.760.CameraKRMH"},
	{Vector(407,18,9),Angle(0,180,0),"Train.760.CameraPVZ"},
}
---------------------------------------------------
-- Defined train information
-- Types of wagon(for wagon limit system):
-- 0 = Head or intherim
-- 1 = Only head
-- 2 = Only intherim
---------------------------------------------------
ENT.SubwayTrain = {
	Type = "81-760",
	Name = "81-760A",
	WagType = 1,
	Manufacturer = "MVM",
	ALS = {
		HaveAutostop = true,
		TwoToSix = true,
		RSAs325Hz = true,
		Aproove0As325Hz = false,
		CheckLKT = false,
	},
    EKKType = 763,
    NoFrontEKK=true, 	
}  
ENT.NumberRanges = {{37095,37332}}

local Texture = {}
for k,v in pairs(Metrostroi.Skins["train"] or {}) do
	if v.typ == "81-760a" then Texture[k] = v.name or k end
end

local PassTexture = {}
for k,v in pairs(Metrostroi.Skins["pass"] or {}) do
	if v.typ == "81-760a" then PassTexture[k] = v.name or k end
end

local CabTexture = {}
for k,v in pairs(Metrostroi.Skins["cab"] or {}) do
	if v.typ == "81-760a" then CabTexture[k] = v.name or k end
end

local Schemes = {}
for k,v in pairs(Metrostroi.Skins["760_schemes"] or {}) do Schemes[k] = v.name or k end

local Announcer = {}
for k,v in pairs(Metrostroi.AnnouncementsASNP or {}) do Announcer[k] = v.name or k end

ENT.Spawner = {
	model = {
		"models/metrostroi_train/81-760/81_760a_body.mdl",
		"models/metrostroi_train/81-760/81_760a_int.mdl",
		"models/metrostroi_train/81-760/81_760_cockpit.mdl",
		"models/metrostroi_train/81-760/81_760_headlamps.mdl",
	},
    spawnfunc = function(i,tbls,tblt)
        local WagNum = tbls.WagNum
        if i>1 and i<WagNum  then
            if (WagNum > 6 and (i == WagNum-1 or i == 2)) or (WagNum > 3 and WagNum ~= 5 and i == WagNum-1) or (WagNum == 5 and i == 3) then
                return "gmod_subway_81-763a" 
			else
                return "gmod_subway_81-761a"
            end
        else
            return "gmod_subway_81-760a"
        end
    end,	
	--interim = "gmod_subway_81-761a",
	postfunc = function(trains,WagNum)
		local LastRot = false
		local wag1 = trains[1]:GetWagonNumber()
		for i=1,#trains do
			local ent = trains[i]
			if ent._SpawnerStarted <= 2 then
				timer.Simple(6,function()
					if not IsValid(ent) then return end
					ent.BUV.OrientateBUP = wag1
					ent.BUV.CurrentBUP = wag1
				end)
			end
			if not ent.BUKP then continue end
			ent.BUKP.State = 1
			local wagn = math.min(8,WagNum)
			ent.BUKP.WagNum = wagn
			ent.BUKP.Trains = {}
			local first,last = 1,#trains
			for i1=1,wagn do
				local tent = trains[i==1 and i1 or #trains-i1+1]
				ent.BUKP.Trains[i1] = tent:GetWagonNumber()
				ent.BUKP.Trains[tent:GetWagonNumber()] = {}
				ent:SetNW2String("BMCISWagN"..i1,tent:GetWagonNumber())
			end
			ent:SetNW2Int("CAMSWagNum",wagn)
			ent.CAMS.Inv = ent:GetWagonNumber() > trains[i==1 and wagn or 1]:GetWagonNumber()
			ent:SetNW2Bool("CAMSInv",ent:GetWagonNumber() > trains[i==1 and wagn or 1]:GetWagonNumber())
			ent:SetNW2Bool("CAMSLast",trains[wagn]:GetWagonNumber()> 37000)
			ent.ASNP.Path = (i~=1)	
		end
	end,
	
    {"Announcer","Spawner.760.Announcer","List", Announcer},
	
    {"CISConfig","Spawner.760.CISConfig","List", CISConfig},		
	
    {"Scheme","Spawner.760.Schemes","List", Schemes},	
	
    {"Version","Окрас кузова","List", Texture},
	
	
	{"SpawnMode","Spawner.Common.SpawnMode","List",{"Spawner.Common.SpawnMode.Full","Spawner.Common.SpawnMode.Deadlock","Spawner.Common.SpawnMode.NightDeadlock","Spawner.Common.SpawnMode.Depot"}, nil,function(ent,val,rot,i,wagnum,rclk)
        if rclk then return end
        if ent._SpawnerStarted~=val then
			local first = i==1 or _LastSpawner~=CurTime()
            ent.Battery:TriggerInput("Set",(not ent.SF1 or val<=2) and 1 or 0)
            if ent.SF1  then
				for i=1,29 do
					if ent["SF"..i] and i ~=22 then
						ent["SF"..i]:TriggerInput("Set",1)
					end
				end
				ent.SA15:TriggerInput("Set",1)
                --ent.Vent2:TriggerInput("Set",val==1 and 1 or 0)
                ent.SA5:TriggerInput("Set",val==1 and 1 or 0)
                ent.HeadlightsSwitch:TriggerInput("Set",val==1 and 1 or 0)
                ent.SA6:TriggerInput("Set",val==1 and 1 or 0)
                ent.SA3:TriggerInput("Set",val<=2 and 1 or 0)
                ent.SA2:TriggerInput("Set",val<=2 and 1 or 0)
				ent.SA9:TriggerInput("Set",val==1 and 1 or 0)				
				--ent.PassScheme:TriggerInput("Set",val==1 and 1 or 0)
                --ent.R_Announcer:TriggerInput("Set",val<=2 and 1 or 0)
                ent.R_ASNPOn:TriggerInput("Set",1)
				--[[
                if val==1 then
                    timer.Simple(1,function()
                        if not IsValid(ent) then return end
                        ent.BUKP.State=2
                    end)
                end]]
				ent.SA1k:TriggerInput("Set",val == 3 and 0 or 1)
				ent.SA1k.Value = (val == 3 and 0 or 1)
				ent.SA1:TriggerInput("Set",val == 3 and 1 or 0)
				
                ent.SF4:TriggerInput("Set",val<=2 and 1 or 0)
                ent.SF5:TriggerInput("Set",val<=2 and 1 or 0)
                ent.SF6:TriggerInput("Set",val<=2 and 1 or 0)
                ent.SF12:TriggerInput("Set",val<=2 and 1 or 0)
                ent.SF13:TriggerInput("Set",val<=2 and 1 or 0)
                ent.SF15:TriggerInput("Set",val<=2 and 1 or 0)

				
				for i=26,28 do
					if ent["SF"..i] then
						ent["SF"..i]:TriggerInput("Open",1)
					end
				end
				ent.SF27:TriggerInput("Set",val<=2 and 1 or 0)
				ent.SF28:TriggerInput("Set",val==3 and 1 or 0)

                _LastSpawner=CurTime()
                ent.CabinDoorLeft = val==4 and first
                ent.CabinDoorRight = val==4 and first
                ent.PassengerDoor = val==4
                ent.RearDoor = val==4
            else
                ent.FrontDoor = val==4
                ent.RearDoor = val==4
            end
            ent.Pneumatic.RightDoorState = {0,0,0,0}
            ent.Pneumatic.DoorRight = false
            ent.Pneumatic.LeftDoorState = {0,0,0,0}
            ent.Pneumatic.DoorLeft = false
            ent.GV:TriggerInput("Set",val<4 and 1 or 0)

			if val<=2 then
				if ent.SF1 then
					timer.Simple((first and 2 or 1),function()
						if not IsValid(ent) then return end
						ent:SetNW2Int("VityazWagNum",ent.BUKP.WagNum)
						for i=1,ent.BUKP.WagNum do
							ent:CANWrite("BUKP",ent:GetWagonNumber(),"BUV",ent.BUKP.Trains[i],"Orientate",i%2 > 0)
						end
						ent.BUKP.Errors = {}
						ent.BUKP.InitTimer = CurTime()+0.0
						ent.BUKP.Timer2 = CurTime()+3
						ent.BUKP.State = 5
						ent.BUKP.State2 = 11
						ent.BUKP.Prost = true
						ent.BUKP.Kos = true
						ent.BUKP.Ovr = true						

						ent.CAMS.State = -1
						ent.CAMS.StateTimer = CurTime()+6
						ent.VentTimer = -20
						ent.Speedometer.State = 1 
						ent.BMCIS.State = 1
					end)
					if first then
						timer.Simple(8,function()
							if not IsValid(ent) then return end
							ent.BUKP.InitTimer = CurTime()+0.5
							ent.BUKP.Reset = 1
						end)
					end
				else
					ent.Electric:TriggerInput("Power",true)				
				end
				timer.Simple(7,function()
					if not IsValid(ent) then return end
					ent.BUV.PassLight = (val == 1)
					if ent.AsyncInverter then ent.BUV.PSNSignal = true end
				end)
				timer.Simple(3,function()
					if not IsValid(ent) then return end
					ent.BV:TriggerInput("Set",1)
				end)
				ent.Pneumatic.BrakeLinePressure = 2.25+math.random()*0.15
			end
			ent.Pneumatic.TrainLinePressure = val==3 and 5+math.random() or val==2 and 6.6+math.random()*1.4 or 7.6+math.random()*0.5
			if not ent.SF1 then
				ent.Pneumatic.TLPressure = ent.Pneumatic.TrainLinePressure
			end
			ent.Pneumatic.ParkingBrakePressure = val == 3 and 0 or ent.Pneumatic.TrainLinePressure				
			ent.Pneumatic.ParkingBrake = (val == 3)
			
            ent._SpawnerStarted = val
        end	
    end},
    --{"PassSchemesInvert","Spawner.760.InvertSchemes","Boolean",false,function(ent,val,rot) ent:SetNW2Bool("PassSchemesInvert",rot and not val or not rot and val) end},
	
	--{"GV","Spawner.717.GV","Boolean",true,function(ent,val) ent.GV:TriggerInput("Set",val) end},
	--{"PB","Spawner.717.PB","Boolean",false,function(ent,val) ent.SA1:TriggerInput("Set",val) end},
}
