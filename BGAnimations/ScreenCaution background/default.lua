return Def.ActorFrame{
	LoadActor("caution")..{
		OnCommand=cmd(zoomtowidth,SCREEN_WIDTH+50;zoomtoheight,SCREEN_HEIGHT-5;Center;fadeleft,0.1;faderight,0.1;rotationy,30);
	};
	LoadActor("caution")..{
		OnCommand=cmd(Center;fadeleft,0.1;faderight,0.1);
	};
}