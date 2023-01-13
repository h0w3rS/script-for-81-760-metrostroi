--------------------------------------------------------------------------------
-- Блок наддверного табло (БНТ-07)
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("81_760_BNT")
TRAIN_SYSTEM.DontAccelerateSimulation = true

function TRAIN_SYSTEM:Initialize()
	self.State = -1
	self.RestartTimer = CurTime()
end

function TRAIN_SYSTEM:Outputs()
	return {"State","ControllerState"}
end

function TRAIN_SYSTEM:Inputs()
	return {}
end
if TURBOSTROI then return end

function TRAIN_SYSTEM:TriggerInput(name,value)
end

if SERVER then
	function TRAIN_SYSTEM:Think(dT)
	
		local Train = self.Train
		local CIS = Train.CIS
		self.Power = Train.Electric.Battery80V > 62
		if not self.Power and self.State ~= -1 then self.State = -1 end
		if not self.Power then self.RestartTimer = CurTime()+math.Rand(0.8,2) end
		if self.Power and CurTime()-self.RestartTimer > 0 and self.State == -1 then self.State = 0 end
		if not CIS.BMCISInit and self.State ~= 0 then self.State = 0 end
		if (self.TickerCurr ~= CIS.TickerCurr or self.TickerNext ~= CIS.TickerNext) and CIS.BMCISInit then
		
			if self.State == 0 then self.State = 1 end
			
			self.TickerCurr = CIS.TickerCurr
			self.TickerNext = CIS.TickerNext
			
			self.Line = 1
			local getInfo = Metrostroi.CISConfig[Train.CISConfig][self.Line]
			
			--tbl[self.Station][3] or tbl[self.Station][2]
			
			Train:SetNW2String("BNTTicker", self.TickerNext and "Следующая / Next" or "Станция / Station")
			Train:SetNW2String("BNTTickerCurr", self.TickerCurr)
			Train:SetNW2String("BNTTickerEn", CIS.TickerEnglish and CIS.TickerEn or "")
			Train:SetNW2String("BNTTickerLine", getInfo.Line)	
			
			local line = CIS.TickerLineColor
			Train:SetNW2Angle("BNTTickerLineColor", line and Angle(line.r, line.g, line.b) or Angle(255, 255, 255))
			Train:SetNW2Bool("BNTTickerNext", self.TickerNext)
			Train:SetNW2String("BNTTickerIn", CIS.TickerIn)
			Train:SetNW2String("BNTTickerInToLine", CIS.TickerInToLine)
			
			local line1 = CIS.TickerInToLineColor
			Train:SetNW2Angle("BNTTickerInToLineColor", line1 and Angle(line1.r, line1.g, line1.b) or Angle(255, 255, 255))
			Train:SetNW2String("BNTTickerInEn", CIS.TickerEnglish and CIS.TickerInEn or "")
			
			Train:SetNW2String("BNTTickerIn1", CIS.TickerIn1)
			Train:SetNW2String("BNTTickerInToLine1", CIS.TickerInToLine1)
			local line2 = CIS.TickerInToLineColor1
			Train:SetNW2Angle("BNTTickerInToLineColor1", line2 and Angle(line2.r, line2.g, line2.b) or Color(255, 255, 255))
			Train:SetNW2String("BNTTickerInEn1", CIS.TickerEnglish and CIS.TickerInEn1 or "")		
			
			--if self.TickerCurr and self.State ~= 1 then self.State = 1 end
			if CIS.LastSt and Train.STL and self.State ~= 3 then self.State = 3 end
		end
		
		if CIS.LastSt and Train.STL and self.State ~= 3 then self.State = 3 end
		if self.State == 3 and not CIS.LastSt then self.State = 1 end
		if self.State == 4 and not Train:GetPackedBool("BMCISExtra",false) then self.State = 1 end	
		if CIS.DoorAlarm and self.State ~= 2 then self.State = 2 end
		if not CIS.DoorAlarm and self.State == 2 then self.State = 1 end
		if Train:GetPackedBool("BMCISExtra",false) and self.State > 0 and self.State ~= 4 then self.State = 4 end
		Train:SetNW2Int("BNTState",self.State)
		
	end
else
	local function createFont(name,font,size,weight,blur,scanlines,underline)
		surface.CreateFont("Metrostroi_760_"..name, {
			font = font,
			size = size,
			weight = weight or 400,
			blursize = blur or false,
			antialias = true,
			underline = underline,
			italic = false,
			strikeout = false,
			symbol = false,
			rotary = false,
			shadow = false,
			additive = false,
			outline = false,
			extended = true,
			scanlines = scanlines or false,
		})
	end
	
	createFont("BNT","Moscow Sans Regular",39,1000,0,0,false)
	createFont("BNT3","Moscow Sans Regular",30,1000,0,0,false)
	createFont("BNT4","Moscow Sans Regular",37,1000,0,0,false)
	createFont("BNT1","Moscow Sans Regular",55,1000,0,0,false)
	createFont("BNT2","Moscow Sans Regular",70,1000,0,0,false)--size=75
	
	function TRAIN_SYSTEM:ClientThink()
	
		if not self.Train:ShouldDrawPanel("BNT1") and not self.Train:ShouldDrawPanel("BNT2") and not self.Train:ShouldDrawPanel("BNT3") and not self.Train:ShouldDrawPanel("BNT4") and not self.Train:ShouldDrawPanel("BNT5") and not self.Train:ShouldDrawPanel("BNT6") and not self.Train:ShouldDrawPanel("BNT7") and not self.Train:ShouldDrawPanel("BNT8") then return end
	
		local state = self.Train:GetNW2Int("BNTState",-1)
		if state ~= self.State then
		
			if state == 4 then
			
				render.PushRenderTarget(self.Train.BNTScreen,0,0,1024,1024)
				render.Clear(0, 0, 0, 0)
				cam.Start2D()
					self:BNT(self.Train)
				cam.End2D()
				render.PopRenderTarget()	
				
			end
			
			self.State = state
		end		
		
		if self.State == 4 then return end
		render.PushRenderTarget(self.Train.BNTScreen,0,0,1024,1024)
		render.Clear(0, 0, 0, 0)
		cam.Start2D()
			self:BNT(self.Train)
		cam.End2D()
		render.PopRenderTarget()
		
	end
	local bnt_logo_default = surface.GetTextureID("bnt/bnt_logo_default")
	local odz = surface.GetTextureID("bnt/odz")
	local last = surface.GetTextureID("bnt/last")
	local temp = surface.GetTextureID("bnt/temp")
	local circle = surface.GetTextureID("bnt/circle")
	local extra_st = surface.GetTextureID("bnt/extra_st")
	local extra_dir = surface.GetTextureID("bnt/extra_dir")
	local extra_dir1 = surface.GetTextureID("bnt/extra_dir1")
	
	local black = Color(2,2,2)
	local colfix = Color(255,255,255)
	local grey = Color(100,100,100)
	local font = "Metrostroi_760_BNT"
	
	function TRAIN_SYSTEM:BNT(Train)
		local state = Train:GetNW2Int("BNTState",-1)
		surface.SetDrawColor(colfix)
		
		-- показ логотип метрополитена
		if state == 0 then
		
			surface.SetTexture(bnt_logo_default)
			surface.DrawTexturedRectRotated(514,514,1024,1024,0)			
			
		elseif state == 1 then
			surface.SetDrawColor(250,250,250)
			surface.DrawRect(2,2,640,490)

			local Ticker = Train:GetNW2String("BNTTicker", "")
			local TickerEn = Train:GetNW2String("BNTTickerEn", "")
			local TickerCurr = Train:GetNW2String("BNTTickerCurr", "")
			local TickerNext = Train:GetNW2Bool("BNTTickerNext", false)
			local TickerLine = Train:GetNW2String("BNTTickerLine", "")
			local col1 = Train:GetNW2Angle("BNTTickerLineColor")
			local TickerLineColor = Color(col1.x, col1.y, col1.z)
			local TickerIn = Train:GetNW2String("BNTTickerIn", "")
			local TickerInEn = Train:GetNW2String("BNTTickerInEn", "")
			local TickerInToLine = Train:GetNW2String("BNTTickerInToLine", "")
			local col = Train:GetNW2Angle("BNTTickerInToLineColor")
			local TickerInToLineColor = Color(col.x,col.y,col.z)

			local TickerIn1 = Train:GetNW2String("BNTTickerIn1", "")			
			local TickerInEn1 = Train:GetNW2String("BNTTickerInEn1", "")
			local TickerInToLine1 = Train:GetNW2String("BNTTickerInToLine1", "")
			local col2 = Train:GetNW2Angle("BNTTickerInToLineColor1")
			local TickerInToLineColor1 = Color(col2.x, col2.y, col2.z)
			
			-- Деление текста назв. станции на 2 части
			local part1 = string.match(TickerCurr,"^.* ")
			local part2
			if part1 then
				part2 = string.match(TickerCurr,"^.*",#part1+1)
			end
			
			-- если включено
			if TickerIn ~= "" then

				surface.SetDrawColor(TickerLineColor)
				
				-- основной круг с номером линии
				surface.SetTexture(circle)
				surface.DrawTexturedRectRotated(84,141,128,128,0)				
				surface.SetDrawColor(TickerInToLineColor)
				
				-- Если две пересадки одноименные
				if TickerIn == TickerIn1 then
				
					surface.SetTexture(circle)
					surface.DrawTexturedRectRotated(80, 235, 90, 90, 0)	
					
					surface.SetDrawColor(TickerInToLineColor1)
					surface.SetTexture(circle)
					surface.DrawTexturedRectUV(95, 190, 90, 90, 0, 0, -1, 1)		
					
				else 
					-- пересадка на 1 станцию
					surface.SetTexture(circle)
					surface.DrawTexturedRectRotated(90,235,90,90,0)					
					
					-- пересадка на 2 станции
					if TickerIn1 ~= "" then
					
						surface.SetTexture(circle)
						surface.DrawTexturedRectRotated(90, 300, 90, 90, 180)			
				
						surface.SetDrawColor(TickerInToLineColor1)
						surface.SetTexture(circle)
						surface.DrawTexturedRectUV(44, 270, 90, 90, 0, 0, -1, 1)						
					end
				
				end

				
			else
			
				surface.SetDrawColor(TickerLineColor)
				surface.SetTexture(circle)
				surface.DrawTexturedRectRotated(84,141,128,128,0)
				
			end
			
			-- Отрисовка статуса "След. / Текущая" станция
			if Ticker ~= "" then
				draw.SimpleText(Ticker,font,139,50,black,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
			end
			
			-- наименование текущей станции
			if TickerCurr ~= "" then
			
				draw.SimpleText(part1 or TickerCurr,font.."1",140,100,black,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
				if part2 then
					draw.SimpleText(part2,font.."1",140,135,black,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
				end
				
			end
			
			-- англ. наименования
			if TickerEn ~= "" then
				draw.SimpleText(TickerEn, font, 140, 140 + (part2 and 40 or 0), grey, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			end
			
			-- номер линии
			if TickerLine ~= "" then
				
				draw.SimpleText(TickerLine, font.."2", 84, 128, colfix, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				
			end
			
			
			if TickerIn == TickerIn1 then
			
				-- имя станции пересадки
				if TickerIn ~= "" then
					draw.SimpleText(TickerIn, font, 180, 210, black,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
				end
			
				-- назв пересадочной станции на англ. языке
				if TickerInEn ~= "" then
					draw.SimpleText(TickerInEn, font.."3", 180, 240, grey,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)										
				end
				
				-- номер пересадочной линии
				if TickerInToLine ~= "" then
					draw.SimpleText(TickerInToLine, font.."1", 80, 227, colfix, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)			
				end
				
				-- номер пересадочной линии 2
				if TickerInToLine1 ~= "" then
					draw.SimpleText(TickerInToLine1,font.."1", 141, 227, colfix, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)			
				end	
				
			else 
			
				-- имя станции пересадки
				if TickerIn ~= "" then
					draw.SimpleText(TickerIn,font,140, 210, black,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
				end
				
				-- номер пересадочной линии
				if TickerInToLine ~= "" then
					draw.SimpleText(TickerInToLine, font.."1", 91, 227, colfix, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)			
				end
				
				-- назв пересадочной станции на англ. языке
				if TickerInEn ~= "" then
					draw.SimpleText(TickerInEn,font.."3", 140, 240, grey,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)										
				end
				
				-- имя станции пересадки 2
				if TickerIn1 ~= "" then
					draw.SimpleText(TickerIn1,font,140, 290,black,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)			
				end
				
				-- номер пересадочной линии 2
				if TickerInToLine1 ~= "" then
					draw.SimpleText(TickerInToLine1,font.."1", 90, 305, colfix, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)			
				end		
				
				-- назв пересадочной станции на англ. языке 2
				if TickerInEn1 ~= "" then
					draw.SimpleText(TickerInEn1,font.."3", 140, 316, grey, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)										
				end	
				
			end
			
		elseif state == 2 then
		
			surface.SetTexture(odz)
			surface.DrawTexturedRectRotated(514,514,1024,1024,0)
			
		elseif state == 3 then
		
			surface.SetTexture(last)
			surface.DrawTexturedRectRotated(514,514,1024,1024,0)
			
		elseif state == 4 then
			--local station = Train:GetNW2String("BMCISExtraSt","")
			---local dir = Train:GetNW2Bool("BMCISExtraDir",false)
			--surface.SetTexture(extra_st)
			--surface.DrawTexturedRectRotated(512,512,1024,1024,0)	
			--[[if station ~= "" then
				draw.SimpleText(station..".",font.."4",102,405,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
			end]]
			--[[
			if dir then
				surface.SetTexture(extra_dir)
			else
				surface.SetTexture(extra_dir1)
			end
			surface.DrawTexturedRectRotated(514,514,1024,1024,0)]]			
		end
	end
end
