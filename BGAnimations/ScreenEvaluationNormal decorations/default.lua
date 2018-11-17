local ScoreP1 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore();
local ScoreP2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetScore();
return Def.ActorFrame{
	LoadActor(THEME:GetPathG("ScreenEvaluation","judge labels"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+31);
	};
	LoadActor("stats");
	LoadActor("grade");
	LoadActor(THEME:GetPathG("Evaluation","header"))..{
		OnCommand=cmd(y,45);
	};
	LoadActor(THEME:GetPathG("ScreenEvaluation","banner frame"))..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+116);
	};
	Def.Sprite {
		BeginCommand=cmd(LoadFromCurrentSongBanner);
		OnCommand=cmd(scaletoclipped,256,80;x,SCREEN_CENTER_X;y,SCREEN_TOP+113);
	};
	LoadActor("../eval_stage")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+166);
	};
	LoadActor("diff")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-46);
	};
	LoadActor("../../Graphics/_FooterShared")..{
		OnCommand=cmd(y,SCREEN_CENTER_Y+(460-240));
	};
	LoadActor("../_playmode")..{
		OnCommand=cmd(x,SCREEN_CENTER_X-220;y,SCREEN_TOP+41);
	};
	LoadActor("extra")..{
		OnCommand=cmd(play);
		Condition=GAMESTATE:HasEarnedExtraStage();
	};
	LoadActor("bgmscore")..{
		OnCommand=cmd(play);
		Condition=ScoreP1 + ScoreP2 >=1;
	};
}