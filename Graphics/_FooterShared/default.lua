return Def.ActorFrame{
	LoadActor("base")..{
		OnCommand=cmd(zoomtowidth,SCREEN_WIDTH+5;x,SCREEN_CENTER_X;y,11.5);
	};
	LoadActor("upper")..{
		OnCommand=cmd(horizalign,right;x,SCREEN_RIGHT+5);
	};
}