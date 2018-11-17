return Def.ActorFrame{
	LoadActor(THEME:GetPathG("Diff","Header"))..{
		OnCommand=cmd(y,25);
	};
	LoadActor("../../Graphics/_FooterShared")..{
		OnCommand=cmd(y,SCREEN_CENTER_Y+(460-240));
	};
}