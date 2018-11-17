return Def.ActorFrame {
	LoadActor("StageFrame")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+37);
	};
};