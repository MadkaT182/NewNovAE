return Def.ActorFrame{
	LoadActor(THEME:GetPathG("Gameplay","LifeBG"))..{
		OnCommand=cmd(y,SCREEN_TOP;draworder,1);
	};
	Def.Quad{
		OnCommand=cmd(zoomto,372,13;x,SCREEN_CENTER_X-236;y,35;diffuse,color("#00000088"));
		Condition=GAMESTATE:IsSideJoined(PLAYER_1);
	};
	Def.Quad{
		OnCommand=cmd(zoomto,372,13;x,SCREEN_CENTER_X+236;y,35;diffuse,color("#00000088"));
		Condition=GAMESTATE:IsSideJoined(PLAYER_2);
	};
	Def.Quad{
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(zoomto,372,13;x,SCREEN_CENTER_X-236;y,35;diffuseshift;effectcolor1,color("#00000000");effectcolor2,color("#FF0000CC");draworder,1);
		ShowCommand=cmd(stoptweening;linear,.5;diffusealpha,1);
		HideCommand=cmd(stoptweening;linear,.5;diffusealpha,0);
		Condition=GAMESTATE:IsSideJoined(PLAYER_1);
		HealthStateChangedMessageCommand=function(self, param)
			if param.PlayerNumber == PLAYER_1 then
				if param.HealthState == "HealthState_Danger" then
					self:playcommand("Show");
				else
					self:playcommand("Hide");
				end
			end
		end;
	};
	Def.Quad{
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(zoomto,372,13;x,SCREEN_CENTER_X+236;y,35;diffuseshift;effectcolor1,color("#00000000");effectcolor2,color("#FF0000CC");draworder,1);
		ShowCommand=cmd(stoptweening;linear,.5;diffusealpha,1);
		HideCommand=cmd(stoptweening;linear,.5;diffusealpha,0);
		Condition=GAMESTATE:IsSideJoined(PLAYER_2);
		HealthStateChangedMessageCommand=function(self, param)
			if param.PlayerNumber == PLAYER_2 then
				if param.HealthState == "HealthState_Danger" then
					self:playcommand("Show");
				else
					self:playcommand("Hide");
				end
			end
		end;
	};
	LoadActor(THEME:GetPathG("Gameplay","LifeFrame"))..{
		OnCommand=cmd(y,SCREEN_TOP;draworder,2);
	};
	LoadActor(THEME:GetPathG("Gameplay","Danger"))..{
		OnCommand=cmd(horizalign,right;x,SCREEN_CENTER_X-100;y,SCREEN_TOP+35;draworder,2;diffusealpha,0);
		ShowCommand=cmd(stoptweening;linear,.5;diffusealpha,1);
		HideCommand=cmd(stoptweening;linear,.5;diffusealpha,0);
		Condition=GAMESTATE:IsSideJoined(PLAYER_1);
		HealthStateChangedMessageCommand=function(self, param)
			if param.PlayerNumber == PLAYER_1 then
				if param.HealthState == "HealthState_Danger" then
					self:playcommand("Show");
				else
					self:playcommand("Hide");
				end
			end
		end;
	};
	LoadActor(THEME:GetPathG("Gameplay","Danger"))..{
		OnCommand=cmd(horizalign,left;x,SCREEN_CENTER_X+100;y,SCREEN_TOP+35;draworder,2;diffusealpha,0);
		ShowCommand=cmd(stoptweening;linear,.5;diffusealpha,1);
		HideCommand=cmd(stoptweening;linear,.5;diffusealpha,0);
		Condition=GAMESTATE:IsSideJoined(PLAYER_2);
		HealthStateChangedMessageCommand=function(self, param)
			if param.PlayerNumber == PLAYER_2 then
				if param.HealthState == "HealthState_Danger" then
					self:playcommand("Show");
				else
					self:playcommand("Hide");
				end
			end
		end;
	};
	LoadActor(THEME:GetPathG("Gameplay","ScoreFrame"))..{
		OnCommand=cmd(y,SCREEN_BOTTOM-38;draworder,1);
	};
	LoadActor("../frame_stage")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+45;draworder,1);
	};
	LoadActor("../_songinfo")..{
		InitCommand=function(self)
			if IsUsingWideScreen() then
				self:zoom(1);
			else
				self:zoom(.8);
			end
		end;
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-38;draworder,1);
		Condition=ThemePrefs.Get("BSongInfo")
	};
	Def.Actor{
	    Name="ScoringController",
	    JudgmentMessageCommand = function(_,params)
	        if not (( ScoringInfo[params.Player]) and
	            (ScoringInfo.seed == GAMESTATE:GetStageSeed())) then
	            SN2Scoring.PrepareScoringInfo()
	            ScoringInfo.seed = GAMESTATE:GetStageSeed()
	        end
	        local stage = GAMESTATE:IsCourseMode() and GAMESTATE:GetCourseSongIndex() + 1 or nil
	        local info = ScoringInfo[params.Player]
	        if params.HoldNoteScore then
	            info.AddHoldScore(params.HoldNoteScore, stage)
	        else
	            info.AddTapScore(params.TapNoteScore, stage)
	        end
	        local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player)
	        pss:SetScore(info.GetCurrentScore())
	        pss:SetCurMaxScore(info.GetCurrentMaxScore())
	        local es = (GAMESTATE:Env()).EndlessState
	        if es then
	            es.scoring.handleNoteScore(params.HoldNoteScore or params.TapNoteScore,
	                GAMESTATE:GetCurrentStageIndex()+1,
	                pss:GetCurrentCombo())
	        end
	    end,
	};
	LoadActor("CutIns")..{
		Condition=ThemePrefs.Get("BCutins")
	};
}