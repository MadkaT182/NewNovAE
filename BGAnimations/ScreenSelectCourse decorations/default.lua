return Def.ActorFrame{
	LoadActor(THEME:GetPathG("Music","header"))..{
		OnCommand=cmd(y,25);
	};
	LoadActor(THEME:GetPathG("ScreenSelectMusic","banner frame"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X-172;y,SCREEN_CENTER_Y-45;cropbottom,.5);
		OffCommand=cmd(linear,0.5;addx,-SCREEN_WIDTH);
	};
	LoadActor("SortDisplay")..{
		OnCommand=cmd(x,SCREEN_LEFT+10;y,SCREEN_TOP+9);
	};
	LoadActor("../_playmode")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-280;y,SCREEN_CENTER_Y-79);
		OffCommand=cmd(linear,.5;addx,-SCREEN_WIDTH);
	};
	LoadActor(THEME:GetPathG("anim","highlight"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X+56;y,SCREEN_CENTER_Y);
		OffCommand=cmd(linear,.5;diffusealpha,0);
	};
	LoadActor("courselist")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-170;y,SCREEN_CENTER_Y+70);
	};
}