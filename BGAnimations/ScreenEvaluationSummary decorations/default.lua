return Def.ActorFrame{
	LoadActor(THEME:GetPathG("ScreenEvaluation","judge labels"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+31);
	};
	LoadActor("stats");
	LoadActor("grade");
	LoadActor(THEME:GetPathG("Evaluation","header"))..{
		OnCommand=cmd(y,45);
	};
	LoadActor("BannerList")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-(22*STATSMAN:GetStagesPlayed()/2);y,SCREEN_TOP+116-(10*STATSMAN:GetStagesPlayed()/2));
	};
	LoadActor("../../Graphics/_FooterShared")..{
		OnCommand=cmd(y,SCREEN_CENTER_Y+(460-240));
	};
}