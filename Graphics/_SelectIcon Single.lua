local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y);
	LoadActor("ScreenSelectStyle picture1")..{
		OnCommand=cmd(x,-4;y,20);
		GainFocusCommand=cmd(stoptweening;y,-580;zoom,1;diffusealpha,0;glow,1,1,1,0;linear,0.2;y,20;glow,1,1,1,1;linear,0.0;diffusealpha,1;linear,0.2;glow,1,1,1,0);
		LoseFocusCommand=cmd(stoptweening;bouncebegin,0.5;zoomx,0;zoomy,2;y,-580);
	};
	LoadActor("ScreenSS icon1")..{
		OnCommand=cmd(x,196;glowshift);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	LoadActor("ScreenSelectStyle info1")..{
		OnCommand=cmd(x,287;y,-110);
		GainFocusCommand=cmd(stoptweening;x,287*3;linear,0.2;x,287);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;x,287*3);
	};
};

return t;