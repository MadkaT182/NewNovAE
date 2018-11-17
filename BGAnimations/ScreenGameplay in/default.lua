return Def.ActorFrame{
	LoadActor("../_doorright")..{
		OnCommand=cmd(horizalign,left;y,SCREEN_CENTER_Y;x,SCREEN_CENTER_X-45;linear,0.2;x,SCREEN_RIGHT+362);
		Condition=not IsUsingWideScreen()
	};
	LoadActor("../_doorleft")..{
		OnCommand=cmd(horizalign,right;y,SCREEN_CENTER_Y;x,SCREEN_CENTER_X+20;linear,0.2;x,SCREEN_LEFT-362);
		Condition=not IsUsingWideScreen()
	};
	LoadActor("../_doorright")..{
		OnCommand=cmd(zoomx,1.4;horizalign,left;y,SCREEN_CENTER_Y;x,SCREEN_CENTER_X-45;linear,0.2;x,SCREEN_RIGHT+362);
		Condition=IsUsingWideScreen()
	};
	LoadActor("../_doorleft")..{
		OnCommand=cmd(zoomx,1.4;horizalign,right;y,SCREEN_CENTER_Y;x,SCREEN_CENTER_X+45;linear,0.2;x,SCREEN_LEFT-362);
		Condition=IsUsingWideScreen()
	};
	LoadActor("../_yourchoice")..{
		OnCommand=cmd(y,SCREEN_CENTER_Y-285;addy,90;linear,0.15;addy,-90);
	};
	LoadActor("../_bannerframe")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-110;linear,0.15;zoomy,0);
	};
	LoadActor("songbanner")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-113;linear,0.15;zoomy,0);
	};
	LoadActor("StageDisplay")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+10;linear,0.15;bounceend,0.2;zoom,0);
	};
}