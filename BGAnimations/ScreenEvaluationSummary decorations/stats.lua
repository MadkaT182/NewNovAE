local t = Def.ActorFrame {};
local players = GAMESTATE:GetNumSidesJoined();

for player in ivalues(GAMESTATE:GetHumanPlayers()) do
	--Vars
	local Score = string.format("% 7d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetScore());
	local Combo = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):MaxCombo();
	local Marvelous = string.format("% 5d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W1"));
	local Perfect = string.format("% 5d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W2"));
	local Great = string.format("% 5d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W3"));
	local Good = string.format("% 5d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W4"));
	local Ok = string.format("% 5d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetHoldNoteScores("HoldNoteScore_Held"));
	local Miss = string.format("% 5d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_Miss"));
	local Almost = string.format("% 5d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W5"));
	local NG = string.format("% 5d",STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetHoldNoteScores("HoldNoteScore_LetGo"));

	local NewRec = false;

	--New record definition
	if (STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetPersonalHighScoreIndex() == 0) or (STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetMachineHighScoreIndex() == 0) then
		NewRec = true;
	end
--self:x(player == PLAYER_1 and SCREEN_CENTER_X-180 or SCREEN_CENTER_X+180);
	t[#t+1] = Def.ActorFrame{
		--Stats BG
		InitCommand=function(self)
			self:y(SCREEN_CENTER_Y-60);
			self:x(SCREEN_CENTER_X);
		end;
		LoadActor(THEME:GetPathG("ScreenEvaluation","MachineRecord"))..{
			InitCommand=function(self)
				self:x(player == PLAYER_1 and -249 or 249);
				self:y(226);
				self:diffusealpha(.5);
				self:spin();
				Condition=NewRec;
			end
		};
		LoadActor(THEME:GetPathG("ScreenEvaluation", "frame"..player))..{
			InitCommand=function(self)
				self:x(player == PLAYER_1 and -215 or 215);
				self:y(200);
			end;
		};
		--Stats
		--Score
		LoadFont("_numbers2")..{
			InitCommand=function(self)
				self:x(player == PLAYER_1 and -116 or 314);
				self:y(220);
				self:horizalign(right);
				self:diffuse(color("#FFFF00"));
				self:settext(Score);
			end;
		};
		LoadFont("Common normal")..{
			InitCommand=function(self)
				self:x(player == PLAYER_1 and -97 or 141);
				self:y(168);
				self:horizalign(right);
				self:shadowlength(2);
				self:settext(Combo);
			end;
		};
		LoadFont("Common normal")..{
			InitCommand=function(self)
				self:x(player == PLAYER_1 and -97 or 141);
				self:y(14);
				self:horizalign(right);
				self:shadowlength(2);
				self:settext(Marvelous);
			end;
		};
		LoadFont("Common normal")..{
			InitCommand=function(self)
				self:x(player == PLAYER_1 and -97 or 141);
				self:y(36);
				self:horizalign(right);
				self:shadowlength(2);
				self:settext(Perfect);
			end;
		};
		LoadFont("Common normal")..{
			InitCommand=function(self)
				self:x(player == PLAYER_1 and -97 or 141);
				self:y(58);
				self:horizalign(right);
				self:shadowlength(2);
				self:settext(Great);
			end;
		};
		LoadFont("Common normal")..{
			InitCommand=function(self)
				self:x(player == PLAYER_1 and -97 or 141);
				self:y(80);
				self:horizalign(right);
				self:shadowlength(2);
				self:settext(Good);
			end;
		};
		LoadFont("Common normal")..{
			InitCommand=function(self)
				self:x(player == PLAYER_1 and -97 or 141);
				self:y(102);
				self:horizalign(right);
				self:shadowlength(2);
				self:settext(Almost);
			end;
		};
		LoadFont("Common normal")..{
			InitCommand=function(self)
				self:x(player == PLAYER_1 and -97 or 141);
				self:y(124);
				self:horizalign(right);
				self:shadowlength(2);
				self:settext(Miss+NG);
			end;
		};
		LoadFont("Common normal")..{
			InitCommand=function(self)
				self:x(player == PLAYER_1 and -97 or 141);
				self:y(146);
				self:horizalign(right);
				self:shadowlength(2);
				self:settext(Ok);
			end;
		};
	};

end

return t;