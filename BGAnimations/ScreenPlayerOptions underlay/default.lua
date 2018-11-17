return Def.ActorFrame{
	Def.Quad{
		OnCommand=cmd(FullScreen;diffuse,color("0,0,0,.6"));
	};
	LoadActor("optbg")..{
		OnCommand=cmd(Center);
	};
}