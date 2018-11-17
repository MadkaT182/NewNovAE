return Def.ActorFrame{
	Def.Quad{
		OnCommand=function(self)
			self:zoom(0);
			self:sleep(1.25);
		end;
	};
	LoadActor("go")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+10;zoomy,0;zoomx,1.7;linear,0.15;zoomx,1;zoomy,1;sleep,0.85;linear,0.15;zoomx,1.7;zoomy,0);
	};
}