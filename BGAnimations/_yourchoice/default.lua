return Def.ActorFrame{
	LoadActor("bg")..{
		OnCommand=cmd(zoomtowidth,SCREEN_WIDTH;x,SCREEN_CENTER_X);
	};
	LoadActor("left")..{
		OnCommand=cmd(horizalign,left;x,SCREEN_LEFT);
	};
	LoadActor("center")..{
		OnCommand=cmd(x,SCREEN_CENTER_X);
	};
	LoadActor("left")..{
		OnCommand=function(self)
			self:horizalign('right');
			self:x(SCREEN_RIGHT-54);
			self:zoomx(-1)
		end;
	};
}