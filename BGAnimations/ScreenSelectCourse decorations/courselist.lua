local CustomDifficultyToColor = {
	Difficulty_Beginner	= "#66E6FF",
	Difficulty_Easy		= "#E6E619",
	Difficulty_Medium		= "#FF8080",
	Difficulty_Hard		= "#66FF66",
	Difficulty_Challenge	= "#B399FF",
	Difficulty_Edit		= "#AAAAAA",
};

local t = Def.ActorFrame {
	Def.Quad{
		Name="TopMask";
		InitCommand=cmd(y,-214;zoomto,328,46*4.5;MaskSource);
	};

	Def.Quad{
		Name="BottomMask";
		InitCommand=cmd(y,170;zoomto,328,46*4.5;MaskSource);
	};
	Def.CourseContentsList{
		MaxSongs=20;
		NumItemsToDraw=5;

		SetCommand=function(self)
			self:SetFromGameState();
			self:SetCurrentAndDestinationItem(0);
			self:ScrollWithPadding(-2,10);
			self:SetPauseCountdownSeconds(1);
			self:SetSecondsPauseBetweenItems(0);
			self:SetLoop(true);
			self:SetMask(280,0);
		end;
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");

		Display=Def.ActorFrame{
			InitCommand=cmd(x,0;setsize,270,44);
			Def.Sprite{
				SetSongCommand=function(self, params)
					self:Load(THEME:GetPathG("","Course_item"));
					(cmd(finishtweening;sleep,0.125*params.Number))(self);
				end;
			};
			LoadFont("_shared2")..{
				Text="";
				InitCommand=cmd(horizalign,left;maxwidth,223);
				SetSongCommand=function(self,params)
					if not params.Song or params.Secret then
						self:settext("?");
					else
						self:settext(params.Song:GetDisplayFullTitle());
					end;
					self:x(-87);
					self:y(-6);
					(cmd(finishtweening;sleep,0.125*params.Number;))(self);
				end;
			};
			--Dummy indicators
			LoadFont("course_meter")..{
				Text="0000000000";
				InitCommand=cmd(horizalign,left;x,-83;y,10;diffusealpha,.5);
			};
			--Real Indicators
			--Normal Base
			LoadFont("course_meter")..{
				Text="";
				InitCommand=cmd(horizalign,left;x,-83;y,10);
				SetSongCommand=function(self,params)
					local diff = params.Difficulty;
					if math.floor(params.Meter) < 11 then
						self:settext(string.rep("0",params.Meter));
					else
						self:settext(string.rep("0",10));
					end
					self:diffuse(color(CustomDifficultyToColor[diff]));
				end
			};
			--Normal Over
			LoadFont("course_meter")..{
				Text="";
				InitCommand=cmd(horizalign,left;x,-83;y,10);
				SetSongCommand=function(self,params)
					local diff = params.Difficulty;
					if math.floor(params.Meter) < 21 then
						self:settext(string.rep("0",math.floor(params.Meter)-10));
					else
						self:settext(string.rep("0",10));
					end
					self:diffuse(color("#FF0000"));
				end
			};
			--Normal Meter
			LoadFont("course_diff")..{
				Text="";
				InitCommand=cmd(horizalign,right;diffusealpha,.5);
				SetSongCommand=function(self,params)
					if params.Song then
						local diff = params.Difficulty;
						if math.floor(params.Meter) < 10 then
							self:settext("0 ");
						else
							self:settext("");
						end;
					end;
					self:x(138);
					self:y(11);
					(cmd(finishtweening;sleep,0.125*params.Number;))(self);
				end;
			};
			--Normal Meter over
			LoadFont("course_diff")..{
				Text="";
				InitCommand=cmd(horizalign,right);
				SetSongCommand=function(self,params)
					if params.Song then
						local diff = params.Difficulty;
						self:settext(params.Meter);
					end;
					self:x(138);
					self:y(11);
					(cmd(finishtweening;sleep,0.125*params.Number;))(self);
				end;
			};
			LoadFont("course_index")..{
				InitCommand=cmd(maxwidth,34);
				SetSongCommand=function(self,params)
					if params.Song then
						self:settext(params.Number);
					end
					self:x(-131);
				end
			};
		};
	};
};

return t;