return Def.ActorFrame{
	Def.Quad{
		OnCommand=function(self)
			self:zoom(0);
			self:sleep(0.3);
		end;
	};
	LoadActor("../_black")..{
		OnCommand=cmd(FullScreen;diffusealpha,1;linear,0.3;diffusealpha,0)
	};
}