local t = Def.ActorFrame{};

for player in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = Def.ActorFrame{
		LoadFont("_shared2")..{
			OnCommand=function(self)
				self:settext("FIRST PLACE:");
				self:shadowlength(2);
				self:horizalign(player==PLAYER_1 and left or right);
				self:x(player==PLAYER_1 and SCREEN_LEFT+15 or SCREEN_RIGHT-15);
				self:y(SCREEN_BOTTOM-115);
			end;
		};
		LoadFont("Group")..{
			InitCommand=function(self)
				self:settext("NEWNOVAE");
				self:diffuse(color("#D95900"));
				self:shadowlength(2);
				self:horizalign(player==PLAYER_1 and left or right);
				self:x(player==PLAYER_1 and SCREEN_LEFT+15 or SCREEN_RIGHT-15);
				self:y(SCREEN_BOTTOM-92);
				self:playcommand("Set");
			end;
			SetCommand=function(self)
	            local song = (GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse()) or GAMESTATE:GetCurrentSong()
	            local steps = (GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentTrail(player)) or GAMESTATE:GetCurrentSteps(player)
	            local profile = PROFILEMAN:GetMachineProfile()

	            if song and steps and profile then
	                local score_list = profile:GetHighScoreList(song,steps)
	                local scores = score_list:GetHighScores()
	                local top_score = scores[1]

	                if top_score then
	                	local hs = top_score:GetName();
	                	if hs ~= "" then
	                		self:settext(hs);
	                	end
	                end
	            end
			end
		};
		LoadActor(THEME:GetPathG("Score","Frame"))..{
			OnCommand=function(self)
				self:horizalign(player==PLAYER_1 and left or right);
				self:x(player==PLAYER_1 and SCREEN_LEFT or SCREEN_RIGHT-225);
				self:zoomx(player==PLAYER_1 and 1 or -1);
				self:y(SCREEN_BOTTOM-60);
			end;
		};
		LoadFont("ScoreDisplayNormal Text")..{
			InitCommand=function(self)
				self:settext("0000000");
				self:diffuse(color("#FFFF00"));
				self:horizalign(player==PLAYER_1 and left or right);
				self:x(player==PLAYER_1 and SCREEN_LEFT+15 or SCREEN_RIGHT-15);
				self:y(SCREEN_BOTTOM-60);
				self:playcommand("Set");
			end;
			SetCommand=function(self)
	            local song = (GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse()) or GAMESTATE:GetCurrentSong()
	            local steps = (GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentTrail(player)) or GAMESTATE:GetCurrentSteps(player)
	            local profile = PROFILEMAN:GetMachineProfile()

	            if song and steps and profile then
	                local score_list = profile:GetHighScoreList(song,steps)
	                local scores = score_list:GetHighScores()
	                local top_score = scores[1]

	                if top_score then
	                	local hs = top_score:GetScore();
	                	self:settext(hs);
	                end
	            end
			end
		};
	};
end

return t;