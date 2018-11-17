return Def.ActorFrame{
	LoadActor("../Diff Header/body")..{
		OnCommand=cmd(zoomtowidth,SCREEN_WIDTH+5;x,SCREEN_CENTER_X;y,-5);
	};
	LoadActor("left")..{
		OnCommand=cmd(horizalign,left;x,SCREEN_LEFT;y,5);
	};
	LoadActor("../Diff Header/Timer")..{
		OnCommand=function(self)
			self:horizalign('right');
			self:x(SCREEN_RIGHT);
			self:y(5);
			self:visible(PREFSMAN:GetPreference('MenuTimer'));
		end;
	};
}