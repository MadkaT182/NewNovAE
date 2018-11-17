return Def.ActorFrame{
	LoadActor("../Diff Header/body")..{
		OnCommand=cmd(zoomtowidth,SCREEN_WIDTH+5;x,SCREEN_CENTER_X;y,-25);
	};
	LoadActor("left")..{
		OnCommand=cmd(horizalign,left;x,SCREEN_LEFT);
	};
	LoadActor("center")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,-20);
	};
	LoadActor("left")..{
		OnCommand=function(self)
			self:horizalign('right');
			self:x(SCREEN_RIGHT-54);
			self:zoomx(-1)
			self:visible(not PREFSMAN:GetPreference('MenuTimer'));
		end;
	};
	LoadActor("timer")..{
		OnCommand=function(self)
			self:horizalign('right');
			self:x(SCREEN_RIGHT);
			self:visible(PREFSMAN:GetPreference('MenuTimer'));
		end;
	};
}