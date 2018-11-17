return Def.ActorFrame{
	Def.Quad{
		OnCommand=function(self)
			self:zoom(0);
			self:sleep(0.3);
		end;
	};
	LoadActor("../_bgmain")..{
		OnCommand=cmd(zoomto,SCREEN_WIDTH+5,SCREEN_HEIGHT;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1;linear,0.3;diffusealpha,0);
	};
	LoadActor("../../Graphics/_FooterShared")..{
		OnCommand=cmd(y,SCREEN_CENTER_Y+(460-240));
	};
}