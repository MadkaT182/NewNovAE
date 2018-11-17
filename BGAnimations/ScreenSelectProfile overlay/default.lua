function GetLocalProfiles()
	local ret = {};
		for p = 0,PROFILEMAN:GetNumLocalProfiles()-1 do
			local profile=PROFILEMAN:GetLocalProfileFromIndex(p);
			local item = Def.ActorFrame{

			};
			table.insert( ret, item );
		end
	return ret;
end;

function LoadPlayerStuff(Player)
	local ret = {};
	local pn = (Player == PLAYER_1) and 1 or 2;
	local t = Def.ActorFrame;

	t = Def.ActorFrame {
		Name = 'BigFrame';
		LoadActor("CardFrameBase");
	};
	table.insert( ret, t );

	t = Def.ActorFrame {
		Name = 'JoinFrame';
		Def.Sprite {
			InitCommand=function(self)
				if PROFILEMAN:GetNumLocalProfiles() ~= 1 then
					self:Load(THEME:GetPathB("ScreenSelectProfile","overlay/Start"));
				else
					self:Load(THEME:GetPathB("ScreenSelectProfile","overlay/Wait"));
				end;
	         	(cmd(diffusealpha,1;bob;effectmagnitude,0,5,0;effectperiod,0.5))(self)
			end;
			OffCommand=function(self)
				if PROFILEMAN:GetNumLocalProfiles() ~= 1 then
					self:linear(0.25);
				end;
			end;
		};
	};
	table.insert( ret, t );

	t = Def.ActorScroller{
		Name = 'Scroller';
		NumItemsToDraw=1;
		OnCommand=cmd(y,-7;SetFastCatchup,true;SetMask,1000,0;SetSecondsPerItem,0.15);
		TransformFunction=function(self, offset, itemIndex, numItems)
			local focus = scale(math.abs(offset),0,2,1,0);
			self:visible(false);
			self:y(math.floor( offset*63 ));
		end;
		OffCommand=cmd(linear,0.25;diffusealpha,0);
		children = GetLocalProfiles();
	};
	table.insert( ret, t );

	t = Def.ActorFrame {
		Name = 'SmallFrame';
		Def.ActorFrame {
			OffCommand=cmd(linear,0.25;diffusealpha,0);
		    LoadActor("DataCard") .. {
			InitCommand=cmd(y,13;);
			OffCommand=cmd(zoom,0);
		    };
		    LoadActor(THEME:GetPathG("GrooveRadar","base"))..{
		    	InitCommand=cmd(y,80);
		    	OnCommand=cmd();
		    	OffCommand=cmd(linear,0.5;diffusealpha,0);
		    };
		    LoadFont("Common normal")..{
				Text="AIR";
				InitCommand=cmd(diffusealpha,0;shadowlength,1;x,-50;y,133;zoom,0;diffuse,color("#FFFFFF");ztest,true);
				OnCommand=cmd(sleep,0.4;linear,0.3;rotationz,720;diffusealpha,1;zoom,.5;);
				OffCommand=cmd(linear,0.5;diffusealpha,0);
			};
			LoadFont("Common normal") .. {
				Text="VOLTAGE";
				InitCommand=cmd(diffusealpha,0;shadowlength,1;x,-73;y,69;zoom,0;diffuse,color("#FFFFFF");ztest,true);
				OnCommand=cmd(sleep,0.6;linear,0.3;rotationz,720;diffusealpha,1;zoom,.5);
				OffCommand=cmd(linear,0.5;diffusealpha,0);
			};
			LoadFont("Common normal") .. {
				Text="STREAM";
				InitCommand=cmd(diffusealpha,0;shadowlength,1;x,-2;y,30;zoom,0;diffuse,color("#FFFFFF");ztest,true);
				OnCommand=cmd(sleep,0.8;linear,0.3;rotationz,720;diffusealpha,1;zoom,.5);
				OffCommand=cmd(linear,0.5;diffusealpha,0);
			};
			LoadFont("Common normal") .. {
				Text="CHAOS";
				InitCommand=cmd(diffusealpha,0;shadowlength,1;x,70;y,71;zoom,0;diffuse,color("#FFFFFF");ztest,true);
				OnCommand=cmd(sleep,1;linear,0.3;rotationz,720;diffusealpha,1;zoom,.5);
				OffCommand=cmd(linear,0.5;diffusealpha,0);
			};
			LoadFont("Common normal") .. {
				Text="FREEZE";
				InitCommand=cmd(diffusealpha,0;shadowlength,1;x,46;y,133;zoom,0;diffuse,color("#FFFFFF");ztest,true);
				OnCommand=cmd(sleep,1.2;linear,0.3;rotationz,720;diffusealpha,1;zoom,.5);
				OffCommand=cmd(linear,0.5;diffusealpha,0);
			};
		    LoadActor("CircleLevel") .. {
				InitCommand=cmd(x,-87;y,-36;zoomy,0);
				OnCommand=cmd(sleep,0.3;linear,0.3;zoom,1;);
				OffCommand=cmd(linear,0.5;diffusealpha,0);
		    };
		    LoadActor("CircleLevel") .. {
				InitCommand=cmd(x,-87;y,-36;zoomy,0);
				OnCommand=cmd(sleep,0.3;linear,0.3;zoom,1;glowshift,1);
				OffCommand=cmd(linear,0.5;diffusealpha,0);
		    };
		    LoadActor("ContourLevel") .. {
				InitCommand=cmd(x,-87;y,-36;zoomy,0);
				OnCommand=cmd(sleep,0.3;linear,0.3;zoom,1;spin;effectmagnitude,0,0,270);
				OffCommand=cmd(linear,0.5;diffusealpha,0);
		    };
		    LoadActor("SongEnjoy") .. {
				InitCommand=cmd(x,-88;y,-19;zoomy,0);
				OnCommand=cmd(sleep,0.3;linear,0.3;zoom,.58);
				OffCommand=cmd(linear,0.5;diffusealpha,0);
		    };
			LoadFont("Common Normal") .. {
				Text="DANCER NAME";
				InitCommand=cmd(diffuse,color("#FAD204");x,-73;y,-124;zoom,.5);
			};
			LoadFont("Common Normal") .. {
				Text="LOCATION";
				InitCommand=cmd(diffuse,color("#FAD204");x,-85;y,-93;zoom,.5);
			};
			LoadFont("DifficultyList") .. {
				Text="USA";
				InitCommand=cmd(diffuse,color("#FFFFFF");x,50;y,-91;zoom,.5);
			};
			LoadFont("DifficultyList") .. {
				InitCommand=cmd(diffuse,color("#FAD204");horizalign,left;x,-116;y,-146;zoom,.75);
				OnCommand=function(self)
					if Player == PLAYER_1 then
						self:settext("PLAYER ONE");
					else
						self:settext("PLAYER TWO");
					end
				end;
			};
			LoadActor("Bar") .. {
				InitCommand=cmd(y,157);
			};
			LoadFont("Common normal")..{
				Text="Choose your profile";
				InitCommand=cmd(diffuse,color("#FAD204");x,0;y,157;zoom,.75);
			};
		};
	};
	table.insert( ret, t );
	t = LoadFont("Common normal") .. {
		Name = 'SelectedProfileText';
		InitCommand=cmd(maxwidth,126;shadowlength,2;x,51;y,-112);
			OffCommand=cmd(linear,0.25;diffusealpha,0);
	};
	table.insert( ret, t );
	t = LoadFont("Common normal") .. {
		Name = 'NumTotalSongsPlayed';
		InitCommand=cmd(shadowlength,2;x,-90;y,-40;zoom,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};
	table.insert( ret, t );
	return ret;
end

function UpdateInternal3(self,Player)
	local pn = (Player == PLAYER_1) and 1 or 2;
	local frame = self:GetChild(string.format('P%uFrame', pn));
	local scroller = frame:GetChild('Scroller');
	local seltext = frame:GetChild('SelectedProfileText');
	local NumSongtext = frame:GetChild('NumTotalSongsPlayed');
	local joinframe = frame:GetChild('JoinFrame');
	local smallframe = frame:GetChild('SmallFrame');
	local bigframe = frame:GetChild('BigFrame');
	local playertext = frame:GetChild('PlayerText');

	if GAMESTATE:IsHumanPlayer(Player) then
		frame:visible(true);
		if MEMCARDMAN:GetCardState(Player) == 'MemoryCardState_none' then
			joinframe:visible(false);
			smallframe:visible(true);
			seltext:visible(true);
			NumSongtext:visible(true);
			scroller:visible(true);
			local ind = SCREENMAN:GetTopScreen():GetProfileIndex(Player);
			if ind > 0 then
				scroller:SetDestinationItem(ind-1);
				seltext:settext(PROFILEMAN:GetLocalProfileFromIndex(ind-1):GetDisplayName());
				NumSongtext:settext(GetEnjoyLevel(PROFILEMAN:GetLocalProfileFromIndex(ind-1):GetNumTotalSongsPlayed()));
			else
				if SCREENMAN:GetTopScreen():SetProfileIndex(Player, 1) then
					scroller:SetDestinationItem(0);
					self:queuecommand('UpdateInternal2');
				else
					joinframe:visible(false);
					smallframe:visible(true);
					scroller:visible(false);
					seltext:settext('No profile');
				end;
			end;
		else
			smallframe:visible(false);
			scroller:visible(false);
			seltext:settext('CARD');
			seltext:visible(true);
			NumSongtext:visible(false);
			joinframe:visible(false);
			SCREENMAN:GetTopScreen():SetProfileIndex(Player, 0);
		end;
	else
		joinframe:visible(true);
		scroller:visible(false);
		seltext:visible(false);
		NumSongtext:visible(false);
		smallframe:visible(false);
	end;
	bigframe:visible(true);
end;

local t = Def.ActorFrame{

	StorageDevicesChangedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' or params.Name == 'Center' then
			if not GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				if PROFILEMAN:GetNumLocalProfiles() ~= 1 then
					SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -1);
					MESSAGEMAN:Broadcast("StartButton");
				end;
			else
				SCREENMAN:GetTopScreen():Finish();
				MESSAGEMAN:Broadcast("StartButton");
			end;
		end;
		if params.Name == 'Up' or params.Name == 'Up2' or params.Name == 'DownLeft' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 1 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind - 1 ) then
						setenv("SetProfileIndex"..ToEnumShortString(params.PlayerNumber),ind - 1);
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Down' or params.Name == 'Down2' or params.Name == 'DownRight' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 0 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind + 1 ) then
						setenv("SetProfileIndex"..ToEnumShortString(params.PlayerNumber),ind + 1);
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Back' then
			SCREENMAN:GetTopScreen():Cancel();
		end;
	end;

	PlayerJoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	PlayerUnjoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	OnCommand=function(self)
		self:queuecommand('UpdateInternal2');
	end;

	UpdateInternal2Command=function(self)
		UpdateInternal3(self, PLAYER_1);
		UpdateInternal3(self, PLAYER_2);
	end;

	children = {
		Def.Quad{
			OffCommand=cmd(sleep,1);
		};
		LoadActor("Fadein")..{
			InitCommand=cmd(sleep,.5;queuecommand,"Play");
			PlayCommand=cmd(play);
		};
		LoadActor("machine")..{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-95);
		};
		Def.ActorFrame{
			Name='P1Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y);
			OnCommand=cmd(zoomy,0;sleep,.25;linear,.25;zoomy,1);
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd())(self);
				end;
			end;
			OffCommand=cmd(linear,.5;zoomy,0);
			children = LoadPlayerStuff(PLAYER_1);
		};
		Def.ActorFrame{
			Name='P2Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y);
			OnCommand=cmd(zoomy,0;sleep,.25;linear,.25;zoomy,1);
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					(cmd())(self);
				end;
			end;
			OffCommand=cmd(linear,.5;zoomy,0);
			children = LoadPlayerStuff(PLAYER_2);
		};
		LoadActor( THEME:GetPathS("ScreenSelectProfile","start") )..{
			StartButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("Common","back") )..{
			BackButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("ScreenSelectProfile","change") )..{
			DirectionButtonMessageCommand=cmd(play);
		};
	}
}

return t;