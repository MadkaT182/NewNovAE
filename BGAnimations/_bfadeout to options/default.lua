return Def.ActorFrame{
	Def.Quad{
		OnCommand=function(self)
			self:zoom(0);
			self:sleep(1.8);
		end;
	};
	LoadActor("../_bgmain")..{
		OnCommand=cmd(FullScreen;diffusealpha,0;sleep,1.5;linear,0.3;diffusealpha,1);
	};
	LoadActor(THEME:GetPathG("_shared","footer"))..{
		OnCommand=cmd(y,SCREEN_BOTTOM-20);
	};
}