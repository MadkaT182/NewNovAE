return Def.ActorFrame{
	LoadActor(THEME:GetPathG("Style","Header"))..{
		OnCommand=cmd(y,25);
	};
	LoadActor("../../Graphics/_FooterShared")..{
		OnCommand=cmd(y,SCREEN_CENTER_Y+(460-240));
	};
	LoadActor("warning")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+166;y,SCREEN_CENTER_Y+72);
	};
	LoadActor("explanation")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-250;y,SCREEN_CENTER_Y+170);
	};
}