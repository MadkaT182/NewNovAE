return Def.ActorFrame{
	LoadActor("gameover")..{
		OnCommand=cmd(Center);
	};
}