return Def.ActorFrame{
	LoadActor(THEME:GetPathG("ScreenSS","icon1"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X+40;y,SCREEN_CENTER_Y;diffuse,color(".2,.2,.2,1"));
	};
	LoadActor(THEME:GetPathG("ScreenSS","icon2"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X+110;y,SCREEN_CENTER_Y;diffuse,color(".2,.2,.2,1"));
	};
	LoadActor(THEME:GetPathG("ScreenSS","icon3"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X+180;y,SCREEN_CENTER_Y;diffuse,color(".2,.2,.2,1"));
	};
	LoadActor(THEME:GetPathG("ScreenSS","icon4"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X+250;y,SCREEN_CENTER_Y;diffuse,color(".2,.2,.2,1"));
	};
}