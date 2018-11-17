local function Radar()
	local function set(self,player)
		local Selection = GAMESTATE:GetCurrentSteps(player) or GAMESTATE:GetCurrentTrail(player)
		local Song = GAMESTATE:GetCurrentSong();
		if not Selection or not Song then
			self:SetEmpty( player );
			return
		end
		self:SetFromRadarValues( player, Selection:GetRadarValues(player) );
	end

	local t = Def.GrooveRadar {
		OnCommand=cmd();
		OffCommand=cmd();
		CurrentStepsP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentStepsP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
		CurrentTrailP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentTrailP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
	};

	return t;
end

return Def.ActorFrame{
	LoadActor(THEME:GetPathG("Music","header"))..{
		OnCommand=cmd(y,25);
	};
	LoadActor(THEME:GetPathG("ScreenSelectMusic","banner frame"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X-172;y,SCREEN_CENTER_Y-45);
		OffCommand=cmd(linear,0.5;addx,-SCREEN_WIDTH);
	};
	Def.BPMDisplay {
		File=THEME:GetPathF("BPMDisplay", "bpm");
		Name="BPMDisplay";
		InitCommand=cmd(x,SCREEN_CENTER_X-215;y,SCREEN_CENTER_Y+32;horizalign,right);
		OffCommand=cmd(linear,.5;addx,-SCREEN_WIDTH);
		SetCommand=function(self) self:SetFromGameState() end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};
	LoadActor(THEME:GetPathG("BPMDisplay","label"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X-234;y,SCREEN_CENTER_Y+50;diffuse,color("#FFFF00"));
		OffCommand=cmd(linear,.5;addx,-SCREEN_WIDTH);
	};
	LoadActor("SortDisplay")..{
		OnCommand=cmd(x,SCREEN_LEFT+10;y,SCREEN_TOP+9);
	};
	Radar() .. {
		BeginCommand=cmd(x,SCREEN_CENTER_X-110;y,SCREEN_CENTER_Y+22);
		OffCommand=cmd(linear,.5;addx,-SCREEN_WIDTH);
		Condition=not GAMESTATE:IsCourseMode();
	};
	LoadActor("../norm_stage")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-132;y,SCREEN_CENTER_Y-71);
		OffCommand=cmd(linear,.5;addx,-SCREEN_WIDTH);
		Condition=not GAMESTATE:IsCourseMode();
	};
	LoadActor("../_playmode")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-280;y,SCREEN_CENTER_Y-79);
		OffCommand=cmd(linear,.5;addx,-SCREEN_WIDTH);
		Condition=not GAMESTATE:IsCourseMode();
	};
	LoadActor("difflist")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y+98);
		OffCommand=cmd(linear,.5;addx,-SCREEN_WIDTH);
		Condition=not GAMESTATE:IsCourseMode();
	};
	LoadActor(THEME:GetPathG("anim","highlight"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+56;y,SCREEN_CENTER_Y);
		OffCommand=cmd(linear,.5;diffusealpha,0);
	};
}