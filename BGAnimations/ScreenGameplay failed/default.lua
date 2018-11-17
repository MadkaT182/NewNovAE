return Def.ActorFrame{
	Def.Quad{
		OnCommand=function(self)
			self:zoom(0);
			self:sleep(1);
			SOUND:PlayOnce('bgm');
			self:sleep(2);
		end;
	};
	Def.Quad{
		OnCommand=function(self)
			self:zoomto(SCREEN_WIDTH*2,SCREEN_HEIGHT*2);
			self:diffuse(0,0,0,0);
			self:linear(1);
			self:diffusealpha(1);
		end;
	};
	LoadActor("../_doorright")..{
		OnCommand=cmd(x,SCREEN_RIGHT+362;horizalign,left;y,SCREEN_CENTER_Y;linear,0.2;x,SCREEN_CENTER_X-45);
		Condition=not IsUsingWideScreen()
	};
	LoadActor("../_doorleft")..{
		OnCommand=cmd(x,SCREEN_LEFT-362;horizalign,right;y,SCREEN_CENTER_Y;linear,0.2;x,SCREEN_CENTER_X+20);
		Condition=not IsUsingWideScreen()
	};
	LoadActor("../_doorright")..{
		OnCommand=cmd(zoomx,1.4;x,SCREEN_RIGHT+362;horizalign,left;y,SCREEN_CENTER_Y;linear,0.2;x,SCREEN_CENTER_X-45);
		Condition=IsUsingWideScreen()
	};
	LoadActor("../_doorleft")..{
		OnCommand=cmd(zoomx,1.4;x,SCREEN_LEFT-362;horizalign,right;y,SCREEN_CENTER_Y;linear,0.2;x,SCREEN_CENTER_X+45);
		Condition=IsUsingWideScreen()
	};
	LoadActor("failed")..{
		OnCommand=cmd(Center;zoomy,0;zoomx,2;linear,0.15;zoomx,1;zoomy,1);
	};
}