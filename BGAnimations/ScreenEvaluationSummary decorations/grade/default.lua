local t = Def.ActorFrame {};
local players = GAMESTATE:GetNumSidesJoined();

if GAMESTATE:GetPlayMode() ~= "PlayMode_Oni" then
	for player in ivalues(GAMESTATE:GetHumanPlayers()) do
		local cstats = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetGrade();
		local staw = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetStageAward();
		local fctype = "";
		local boolfc = false;

		if staw == "StageAward_SingleDigitW3" or staw =="StageAward_OneW3" or staw =="StageAward_FullComboW3" then
			boolfc = true;
		elseif staw == "StageAward_SingleDigitW2" or staw =="StageAward_OneW2" or staw =="StageAward_FullComboW2" then
			boolfc = true;
			fctype = "Perfect";
		elseif staw == "StageAward_SingleDigitW1" or staw =="StageAward_OneW1" or staw =="StageAward_FullComboW1" then
			boolfc = true;
			fctype = "Marvelous";
		end

		t[#t+1] = Def.ActorFrame {
			InitCommand=function(self)
				self:player(player);
				self:y(SCREEN_CENTER_Y-126);
			end;
			Def.Sprite{
				Texture=THEME:GetPathG("", "Grades/Dummy");
				InitCommand=function(self)
					self:x(player == PLAYER_1 and SCREEN_CENTER_X-226 or SCREEN_CENTER_X+226);
					self:y(26);
					if cstats and boolfc then
						self:Load(THEME:GetPathG("", "Grades/Fullcombo_ring"));
						self:diffusealpha(0);
						self:sleep(1);
						self:diffusealpha(0.6);
						self:rotationy(14);
						self:rotationx(60);
						self:spin();
						self:effectmagnitude(0,0,-130);
					end
				end;
				OnCommand=cmd(diffusealpha,0;zoom,0;sleep,.333;linear,.2;diffusealpha,1;zoom,1.2;linear,.1;zoom,1);
				OffCommand=cmd(linear,.2;zoom,0;diffusealpha,0);
			};
			Def.Sprite{
				Texture=THEME:GetPathG("", "Grades/Dummy");
				InitCommand=function(self)
					self:x(player == PLAYER_1 and SCREEN_CENTER_X-226 or SCREEN_CENTER_X+226);
					self:y(26);
					if cstats and boolfc then
						self:Load(THEME:GetPathG("", "Grades/Fullcombo_ring"));
						self:diffusealpha(0);
						self:sleep(1);
						self:diffusealpha(0.6);
						self:rotationy(-6);
						self:rotationx(70);
						self:spin();
						self:effectmagnitude(0,0,-130);
					end
				end;
				OnCommand=cmd(diffusealpha,0;zoom,0;sleep,.333;linear,.2;diffusealpha,1;zoom,1.2;linear,.1;zoom,1);
				OffCommand=cmd(linear,.2;zoom,0;diffusealpha,0);
			};
			Def.Sprite{
				Texture=THEME:GetPathG("", "Grades/Dummy");
				InitCommand=function(self)
					self:x(player == PLAYER_1 and SCREEN_CENTER_X-222 or SCREEN_CENTER_X+227);
					if cstats then
						self:Load(THEME:GetPathG("", "Grades/"..cstats));
					end
				end;
				OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,.04;linear,.12;zoomy,1;diffusealpha,1);
				OffCommand=cmd(linear,.2;zoomy,0;diffusealpha,0);
			};
		};
	end
end

return t;